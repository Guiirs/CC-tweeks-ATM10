-- Sistema de Monitoramento Applied Energistics 2
-- Autor: Sistema CC Tweeks
-- Versão: 1.0

-- Configurações
local CONFIG_FILE = "me_config.txt"
local UPDATE_INTERVAL = 2 -- segundos entre atualizações

-- Variáveis globais
local meBridge = nil
local monitor = nil
local itemsToMonitor = {}

-- Cores para a interface
local colors_title = colors.blue
local colors_header = colors.yellow
local colors_normal = colors.white
local colors_low = colors.red
local colors_medium = colors.orange
local colors_high = colors.green

-- Função para conectar ao ME Bridge
local function connectME()
    -- Tentar encontrar meBridge primeiro
    meBridge = peripheral.find("meBridge")
    
    -- Se não encontrar, tentar ae2:controller
    if not meBridge then
        meBridge = peripheral.find("ae2:controller")
    end
    
    -- Se ainda não encontrar, procurar qualquer periférico AE2
    if not meBridge then
        local peripherals = peripheral.getNames()
        for _, name in ipairs(peripherals) do
            if name:find("ae2:") then
                meBridge = peripheral.wrap(name)
                break
            end
        end
    end
    
    if not meBridge then
        print("Erro: ME System não encontrado!")
        print("Conecte um Wired Modem ao ME Controller")
        print("")
        print("Periféricos disponíveis:")
        for _, name in ipairs(peripheral.getNames()) do
            print("  - " .. name)
        end
        return false
    end
    
    print("Conectado ao: " .. peripheral.getName(meBridge))
    
    -- Testar métodos disponíveis
    print("Testando métodos disponíveis...")
    local methods = peripheral.getMethods(peripheral.getName(meBridge))
    local hasMethod = false
    for _, method in ipairs(methods) do
        if method == "listItems" or method == "getAvailableItems" or method == "list" then
            print("  Método encontrado: " .. method)
            hasMethod = true
        end
    end
    
    if not hasMethod then
        print("")
        print("AVISO: Métodos de listagem não encontrados!")
        print("O servidor pode não ter a integração AE2+CC completa.")
        return false
    end
    
    return true
end

-- Função para conectar ao monitor (opcional)
local function connectMonitor()
    monitor = peripheral.find("monitor")
    if monitor then
        monitor.setTextScale(0.5)
        return true
    end
    return false
end

-- Função para carregar configuração
local function loadConfig()
    if not fs.exists(CONFIG_FILE) then
        -- Configuração padrão
        itemsToMonitor = {
            {name = "minecraft:iron_ingot", display = "Iron Ingot", minQty = 1000},
            {name = "minecraft:gold_ingot", display = "Gold Ingot", minQty = 500},
            {name = "minecraft:diamond", display = "Diamond", minQty = 100},
            {name = "minecraft:coal", display = "Coal", minQty = 2000},
            {name = "minecraft:redstone", display = "Redstone", minQty = 1000},
            {name = "ae2:certus_quartz_crystal", display = "Certus Quartz", minQty = 500},
            {name = "ae2:fluix_crystal", display = "Fluix Crystal", minQty = 500},
            {name = "minecraft:copper_ingot", display = "Copper Ingot", minQty = 1000},
        }
        saveConfig()
    else
        local file = fs.open(CONFIG_FILE, "r")
        local content = file.readAll()
        file.close()
        itemsToMonitor = textutils.unserialize(content)
    end
end

-- Função para salvar configuração
function saveConfig()
    local file = fs.open(CONFIG_FILE, "w")
    file.write(textutils.serialize(itemsToMonitor))
    file.close()
end

-- Função para obter quantidade de um item no sistema ME
local function getItemQuantity(itemName)
    local success, items = pcall(function() 
        return meBridge.listItems() 
    end)
    
    if not success or not items then
        -- Tentar método alternativo para AE2 direto
        success, items = pcall(function()
            return meBridge.getAvailableItems()
        end)
    end
    
    if not success or not items then
        return 0
    end
    
    for _, item in pairs(items) do
        if item.name == itemName then
            return item.amount or item.count or 0
        end
    end
    return 0
end

-- Função para formatar números grandes
local function formatNumber(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

-- Função para obter cor baseada na quantidade
local function getStatusColor(current, minimum)
    local percentage = (current / minimum) * 100
    if percentage >= 100 then
        return colors_high
    elseif percentage >= 50 then
        return colors_medium
    else
        return colors_low
    end
end

-- Função para desenhar interface no terminal
local function drawTerminal()
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors_title)
    print("========================================")
    print("   MONITOR AE2 - Sistema ME")
    print("========================================")
    term.setTextColor(colors_normal)
    print("")
    
    term.setTextColor(colors_header)
    print(string.format("%-25s %10s %10s", "Item", "Atual", "Mínimo"))
    print("----------------------------------------")
    term.setTextColor(colors_normal)
    
    for _, item in ipairs(itemsToMonitor) do
        local qty = getItemQuantity(item.name)
        local color = getStatusColor(qty, item.minQty)
        term.setTextColor(color)
        print(string.format("%-25s %10s %10s", 
            item.display, 
            formatNumber(qty), 
            formatNumber(item.minQty)))
    end
    
    term.setTextColor(colors_normal)
    print("")
    print("Pressione 'q' para sair")
end

-- Função para desenhar interface no monitor
local function drawMonitor()
    if not monitor then return end
    
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.setTextColor(colors_title)
    monitor.write("=== MONITOR AE2 ===")
    monitor.setCursorPos(1, 2)
    monitor.setTextColor(colors_normal)
    
    local y = 4
    monitor.setCursorPos(1, y)
    monitor.setTextColor(colors_header)
    monitor.write(string.format("%-20s %8s %8s", "Item", "Atual", "Min"))
    y = y + 1
    
    for _, item in ipairs(itemsToMonitor) do
        monitor.setCursorPos(1, y)
        local qty = getItemQuantity(item.name)
        local color = getStatusColor(qty, item.minQty)
        monitor.setTextColor(color)
        monitor.write(string.format("%-20s %8s %8s", 
            item.display:sub(1, 20), 
            formatNumber(qty), 
            formatNumber(item.minQty)))
        y = y + 1
    end
end

-- Função para obter informações do sistema
local function getSystemInfo()
    local info = {
        totalStorage = 0,
        usedStorage = 0,
        itemTypes = 0,
        cpus = 0
    }
    
    -- Tentar obter informações do sistema
    local success, items = pcall(function() return meBridge.listItems() end)
    if success and items then
        info.itemTypes = #items
        for _, item in pairs(items) do
            info.usedStorage = info.usedStorage + (item.amount or 0)
        end
    end
    
    -- Verificar CPUs de craft
    local success, cpus = pcall(function() return meBridge.getCraftingCPUs() end)
    if success and cpus then
        info.cpus = #cpus
    end
    
    return info
end

-- Função principal
local function main()
    -- Conectar periféricos
    if not connectME() then
        return
    end
    
    connectMonitor()
    loadConfig()
    
    print("Sistema de monitoramento iniciado!")
    print("Atualizando a cada " .. UPDATE_INTERVAL .. " segundos")
    if monitor then
        print("Monitor externo detectado e ativado")
    end
    print("")
    
    local running = true
    
    -- Timer para atualização
    local timerID = os.startTimer(UPDATE_INTERVAL)
    
    while running do
        -- Desenhar interfaces
        drawTerminal()
        drawMonitor()
        
        -- Aguardar evento
        local event, param = os.pullEvent()
        
        if event == "timer" and param == timerID then
            -- Renovar timer
            timerID = os.startTimer(UPDATE_INTERVAL)
        elseif event == "char" and param == "q" then
            running = false
        elseif event == "key" and param == keys.q then
            running = false
        end
    end
    
    term.clear()
    term.setCursorPos(1, 1)
    print("Sistema de monitoramento encerrado.")
end

-- Executar programa
main()
