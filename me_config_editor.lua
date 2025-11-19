-- Editor de Configuração do Monitor AE2
-- Permite adicionar/remover itens a serem monitorados

local CONFIG_FILE = "me_config.txt"
local itemsToMonitor = {}

-- Função para carregar configuração
local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local file = fs.open(CONFIG_FILE, "r")
        local content = file.readAll()
        file.close()
        itemsToMonitor = textutils.unserialize(content)
    else
        itemsToMonitor = {}
    end
end

-- Função para salvar configuração
local function saveConfig()
    local file = fs.open(CONFIG_FILE, "w")
    file.write(textutils.serialize(itemsToMonitor))
    file.close()
end

-- Função para listar itens
local function listItems()
    term.clear()
    term.setCursorPos(1, 1)
    print("=== ITENS MONITORADOS ===")
    print("")
    
    if #itemsToMonitor == 0 then
        print("Nenhum item configurado")
    else
        for i, item in ipairs(itemsToMonitor) do
            print(i .. ". " .. item.display)
            print("   ID: " .. item.name)
            print("   Qtd Mínima: " .. item.minQty)
            print("")
        end
    end
    
    print("Pressione qualquer tecla...")
    os.pullEvent("key")
end

-- Função para adicionar item
local function addItem()
    term.clear()
    term.setCursorPos(1, 1)
    print("=== ADICIONAR ITEM ===")
    print("")
    
    print("Nome de exibição:")
    local display = read()
    
    print("ID do item (ex: minecraft:iron_ingot):")
    local name = read()
    
    print("Quantidade mínima:")
    local minQty = tonumber(read())
    
    if display and name and minQty then
        table.insert(itemsToMonitor, {
            name = name,
            display = display,
            minQty = minQty
        })
        saveConfig()
        print("")
        print("Item adicionado com sucesso!")
    else
        print("")
        print("Erro: Dados inválidos")
    end
    
    sleep(2)
end

-- Função para remover item
local function removeItem()
    if #itemsToMonitor == 0 then
        term.clear()
        term.setCursorPos(1, 1)
        print("Nenhum item para remover")
        sleep(2)
        return
    end
    
    term.clear()
    term.setCursorPos(1, 1)
    print("=== REMOVER ITEM ===")
    print("")
    
    for i, item in ipairs(itemsToMonitor) do
        print(i .. ". " .. item.display)
    end
    
    print("")
    print("Número do item para remover:")
    local num = tonumber(read())
    
    if num and num >= 1 and num <= #itemsToMonitor then
        table.remove(itemsToMonitor, num)
        saveConfig()
        print("")
        print("Item removido com sucesso!")
    else
        print("")
        print("Erro: Número inválido")
    end
    
    sleep(2)
end

-- Menu principal
local function mainMenu()
    loadConfig()
    
    while true do
        term.clear()
        term.setCursorPos(1, 1)
        print("=== EDITOR DE CONFIGURAÇÃO AE2 ===")
        print("")
        print("1. Listar itens monitorados")
        print("2. Adicionar item")
        print("3. Remover item")
        print("4. Sair")
        print("")
        print("Escolha uma opção:")
        
        local choice = read()
        
        if choice == "1" then
            listItems()
        elseif choice == "2" then
            addItem()
        elseif choice == "3" then
            removeItem()
        elseif choice == "4" then
            break
        end
    end
    
    term.clear()
    term.setCursorPos(1, 1)
    print("Editor encerrado")
end

-- Executar
mainMenu()
