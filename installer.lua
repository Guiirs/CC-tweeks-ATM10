-- Instalador do Sistema de Monitoramento AE2
-- Execute este arquivo no ComputerCraft para instalar tudo automaticamente

local files = {
    {
        name = "me_monitor.lua",
        url = "https://pastebin.com/raw/YOURCODE1" -- Substitua com seu pastebin
    },
    {
        name = "me_config_editor.lua",
        url = "https://pastebin.com/raw/YOURCODE2" -- Substitua com seu pastebin
    }
}

print("========================================")
print("  Instalador AE2 Monitor System")
print("========================================")
print("")

-- Verificar se HTTP está habilitado
if not http then
    print("ERRO: HTTP não está habilitado!")
    print("Peça ao administrador para habilitar")
    print("HTTP na configuração do ComputerCraft")
    return
end

print("Baixando arquivos...")
print("")

local success = 0
local failed = 0

for _, file in ipairs(files) do
    print("Baixando " .. file.name .. "...")
    
    local response = http.get(file.url)
    
    if response then
        local content = response.readAll()
        response.close()
        
        local f = fs.open(file.name, "w")
        f.write(content)
        f.close()
        
        print("  ✓ " .. file.name .. " instalado")
        success = success + 1
    else
        print("  ✗ Falha ao baixar " .. file.name)
        failed = failed + 1
    end
end

print("")
print("========================================")
print("Instalação concluída!")
print("Sucesso: " .. success .. " | Falhas: " .. failed)
print("========================================")
print("")

if success > 0 then
    print("Para usar:")
    print("  me_monitor - Iniciar monitoramento")
    print("  me_config_editor - Configurar itens")
    print("")
    print("Executar monitor agora? (s/n)")
    
    local input = read()
    if input:lower() == "s" then
        shell.run("me_monitor")
    end
end
