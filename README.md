# Sistema de Monitoramento AE2 para ComputerCraft

Sistema completo de monitoramento para Applied Energistics 2 usando ComputerCraft Tweaked.

## 📋 Recursos

- ✅ Monitoramento em tempo real dos itens no sistema ME
- ✅ Alertas visuais com código de cores (verde/amarelo/vermelho)
- ✅ Suporte para monitor externo
- ✅ Configuração personalizável de itens
- ✅ Interface intuitiva e fácil de usar
- ✅ Formatação automática de números grandes (K, M)

## 🔧 Requisitos

### No Minecraft:
1. **Applied Energistics 2** instalado
2. **ComputerCraft: Tweaked** instalado
3. Um **Computer** (normal ou avançado)
4. Um **Modem** (Wired ou Wireless)
5. Um **ME Interface** ou **ME Controller**
6. *Opcional:* Um **Monitor** para display externo

## 📦 Instalação

### 1. Conectar Hardware

1. Coloque o Computer próximo ao seu sistema ME
2. Conecte um Modem ao Computer (em qualquer lado)
3. Conecte o Modem ao ME Interface ou ME Controller usando cabos
4. *(Opcional)* Conecte um Monitor ao Computer

### 2. Instalar Arquivos

#### Opção A: Download direto (se o server tiver HTTP habilitado)

```lua
-- No Computer, execute:
wget https://raw.githubusercontent.com/seu-repo/me_monitor.lua me_monitor.lua
wget https://raw.githubusercontent.com/seu-repo/me_config_editor.lua me_config_editor.lua
```

#### Opção B: Copiar manualmente

1. Abra o Computer
2. Digite `edit me_monitor.lua`
3. Cole o conteúdo do arquivo `me_monitor.lua`
4. Pressione `Ctrl` para salvar e sair
5. Repita para `me_config_editor.lua`

## 🚀 Uso

### Iniciar o Monitor

```lua
me_monitor
```

O sistema irá:
- Conectar automaticamente ao ME Bridge
- Detectar monitores externos (se disponíveis)
- Exibir os itens configurados com suas quantidades
- Atualizar a cada 2 segundos

### Configurar Itens Monitorados

```lua
me_config_editor
```

Menu de opções:
1. **Listar itens monitorados** - Ver todos os itens configurados
2. **Adicionar item** - Adicionar novo item para monitorar
3. **Remover item** - Remover item da lista
4. **Sair** - Fechar o editor

#### Adicionar Item:
1. **Nome de exibição**: Nome amigável (ex: "Iron Ingot")
2. **ID do item**: ID interno (ex: `minecraft:iron_ingot`)
3. **Quantidade mínima**: Limite para alertas (ex: `1000`)

### Encontrar IDs de Itens

Para descobrir o ID de um item:

1. Use o comando `/give @p <item>` e veja a sugestão
2. Use um mod como JEI/REI (pressione U sobre o item)
3. Consulte a wiki do mod

## 📊 Interface

### Código de Cores

- 🟢 **Verde**: Quantidade >= 100% do mínimo (OK)
- 🟠 **Laranja**: Quantidade entre 50-99% do mínimo (Atenção)
- 🔴 **Vermelho**: Quantidade < 50% do mínimo (Crítico)

### Exemplo de Display

```
========================================
   MONITOR AE2 - Sistema ME
========================================

Item                       Atual    Mínimo
----------------------------------------
Iron Ingot                 2.5K     1.0K   🟢
Gold Ingot                  450      500   🔴
Diamond                     125      100   🟢
Coal                       1.8K     2.0K   🟠
Redstone                   1.2K     1.0K   🟢
Certus Quartz               320      500   🔴
Fluix Crystal               550      500   🟢
Copper Ingot               1.5K     1.0K   🟢

Pressione 'q' para sair
```

## ⚙️ Configuração Padrão

O sistema vem pré-configurado com os seguintes itens:

| Item | ID | Quantidade Mínima |
|------|-----|-------------------|
| Iron Ingot | `minecraft:iron_ingot` | 1000 |
| Gold Ingot | `minecraft:gold_ingot` | 500 |
| Diamond | `minecraft:diamond` | 100 |
| Coal | `minecraft:coal` | 2000 |
| Redstone | `minecraft:redstone` | 1000 |
| Certus Quartz | `ae2:certus_quartz_crystal` | 500 |
| Fluix Crystal | `ae2:fluix_crystal` | 500 |
| Copper Ingot | `minecraft:copper_ingot` | 1000 |

## 🔄 Executar na Inicialização

Para executar automaticamente ao ligar o computer:

```lua
edit startup.lua
```

Adicione:
```lua
shell.run("me_monitor")
```

## 🐛 Solução de Problemas

### "ME Bridge não encontrado"
- Verifique se o Modem está conectado ao Computer
- Verifique se o Modem está conectado ao ME Interface/Controller
- Certifique-se que o sistema ME está ligado

### Monitor não detectado
- Conecte o Monitor diretamente ao Computer
- Verifique se o Monitor está ligado
- O sistema funciona sem monitor, exibindo apenas no terminal

### Item não aparece
- Verifique se o ID do item está correto
- Certifique-se que o item existe no sistema ME
- Use o editor de configuração para verificar/editar

## 📝 Personalização

### Alterar Intervalo de Atualização

Edite `me_monitor.lua`, linha 6:
```lua
local UPDATE_INTERVAL = 2 -- segundos entre atualizações
```

### Alterar Cores

Edite as linhas 13-18 em `me_monitor.lua`:
```lua
local colors_title = colors.blue
local colors_header = colors.yellow
local colors_normal = colors.white
local colors_low = colors.red
local colors_medium = colors.orange
local colors_high = colors.green
```

## 📄 Arquivos

- `me_monitor.lua` - Programa principal de monitoramento
- `me_config_editor.lua` - Editor de configuração
- `me_config.txt` - Arquivo de configuração (criado automaticamente)
- `README.md` - Esta documentação

## 🤝 Contribuindo

Sinta-se livre para modificar e melhorar este sistema!

## 📜 Licença

Livre para uso pessoal e em servidores.

---

**Versão:** 1.0  
**Compatível com:** ComputerCraft: Tweaked + Applied Energistics 2
