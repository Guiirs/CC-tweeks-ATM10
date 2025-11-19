# 🔧 Guia Completo de Instalação - AE2 Monitor

## 📦 Itens Necessários (Minecraft)

### Obrigatórios:
1. **1x Computer** (ComputerCraft)
   - Computer normal OU
   - Advanced Computer (recomendado - tem cores)
   
2. **1x Wired Modem** OU **Wireless Modem**
   - Wired Modem (recomendado) OU
   - Wireless Modem

3. **1x ME Interface** OU **ME Controller** (Applied Energistics 2)
   - Qualquer um dos dois funciona

4. **Networking Cable** (se usar Wired Modem)
   - Para conectar o Modem ao ME System

### Opcionais:
5. **1x Monitor** (ComputerCraft) - para display externo
   - Pode usar vários monitores juntos (3x3, 4x4, etc.)

---

## 🏗️ Montagem Física

### Passo 1: Colocar o Computer
```
Coloque o Computer próximo ao seu sistema ME
(pode ser ao lado ou a até 256 blocos de distância com cabo)
```

### Passo 2: Conectar o Modem

#### Opção A - Wired Modem (Recomendado):
1. Clique com botão direito no Wired Modem em qualquer lado do Computer
2. Use Networking Cable para conectar o Modem até o ME Interface ou ME Controller
3. Clique com botão direito no cabo conectado ao ME Interface/Controller

```
[Computer] <-- Wired Modem --> [Cabo] --> [ME Interface/Controller]
```

#### Opção B - Wireless Modem:
1. Coloque o Wireless Modem em qualquer lado do Computer
2. Coloque outro Wireless Modem no ME Interface ou Controller
3. Ambos devem estar no alcance (64 blocos padrão)

```
[Computer com Modem]  ~~~wireless~~~  [ME Interface com Modem]
```

### Passo 3: Conectar Monitor (Opcional)
1. Coloque monitores formando um retângulo (ex: 2x2, 3x3)
2. Conecte um Wired Modem em qualquer monitor
3. Use cabo para conectar ao Computer

```
[Monitor][Monitor]
[Monitor][Monitor] <-- Cabo --> [Computer]
```

---

## 💻 Instalação do Software

### Passo 1: Ligar o Computer
1. Clique com botão direito no Computer
2. Aguarde o prompt aparecer

### Passo 2: Instalar o Sistema

#### Método 1 - Instalador Automático (MAIS FÁCIL):
Digite no Computer:
```lua
wget run https://raw.githubusercontent.com/Guiirs/CC-tweeks-ATM10/main/installer.lua
```
Pressione ENTER e aguarde o download

#### Método 2 - Manual:
Digite linha por linha:
```lua
wget https://raw.githubusercontent.com/Guiirs/CC-tweeks-ATM10/main/me_monitor.lua me_monitor.lua
```
```lua
wget https://raw.githubusercontent.com/Guiirs/CC-tweeks-ATM10/main/me_config_editor.lua me_config_editor.lua
```

### Passo 3: Executar
Digite:
```lua
me_monitor
```

---

## ✅ Verificação

Você deve ver:
```
========================================
   MONITOR AE2 - Sistema ME
========================================

Item                       Atual    Mínimo
----------------------------------------
Iron Ingot                   0      1.0K
Gold Ingot                   0       500
...

Pressione 'q' para sair
```

---

## ⚙️ Configuração dos Itens

### Ver/Editar Itens Monitorados:
```lua
me_config_editor
```

### Menu do Editor:
```
1. Listar itens monitorados
2. Adicionar item
3. Remover item
4. Sair
```

### Como Adicionar um Item:

1. Escolha opção **2**
2. Digite o **nome de exibição** (ex: `Iron Ingot`)
3. Digite o **ID do item** (ex: `minecraft:iron_ingot`)
4. Digite a **quantidade mínima** (ex: `1000`)

#### Como Descobrir o ID de um Item:

**Método 1 - JEI/REI (Mod de receitas):**
1. Abra seu inventário
2. Passe o mouse sobre o item
3. Pressione `U` (uso) ou olhe o tooltip
4. O ID aparece como `minecraft:iron_ingot`

**Método 2 - Comando:**
```
/give @p <comece a digitar o nome do item>
```
O jogo sugerirá o ID completo

**Método 3 - Lista Comum:**
- Itens Vanilla: `minecraft:nome_do_item`
- AE2: `ae2:nome_do_item`
- Mekanism: `mekanism:nome_do_item`
- Thermal: `thermal:nome_do_item`

---

## 🎨 Códigos de Cor

Quando o monitor estiver funcionando:

- **🟢 VERDE** = Quantidade OK (>100% do mínimo)
- **🟠 LARANJA** = Atenção (50-99% do mínimo)
- **🔴 VERMELHO** = Crítico (<50% do mínimo)

---

## 🚀 Executar Automaticamente

Para o monitor iniciar sozinho quando o Computer ligar:

```lua
edit startup.lua
```

Adicione esta linha:
```lua
shell.run("me_monitor")
```

Salve com `Ctrl` e saia.

---

## 🔍 Itens Pré-Configurados

O sistema vem com estes itens:

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

---

## 🐛 Problemas Comuns

### "ME Bridge não encontrado"
❌ **Problema:** O Computer não está conectado ao ME System

✅ **Solução:**
1. Verifique se o Modem está no Computer
2. Verifique o cabo até o ME Interface/Controller
3. Clique com botão direito no cabo conectado ao ME
4. Certifique-se que o ME System está ligado (com energia)

### "HTTP não está habilitado"
❌ **Problema:** Download não funciona

✅ **Solução:**
1. Peça ao admin do servidor para habilitar HTTP
2. Ou copie os arquivos manualmente usando `edit`

### Monitor não detecta
❌ **Problema:** Monitor externo não funciona

✅ **Solução:**
1. Conecte o Monitor diretamente ao Computer com cabo
2. O sistema funciona SEM monitor (usa o terminal do Computer)

### Itens não aparecem
❌ **Problema:** Itens com quantidade 0

✅ **Solução:**
1. Verifique se os itens EXISTEM no sistema ME
2. Verifique se o ID está correto
3. Adicione pelo menos 1 unidade do item no ME System

---

## 📊 Exemplo de Setup Completo

```
      [Monitor 2x2]
           |
      [Wired Modem]
           |
        [Cabo]
           |
    [Advanced Computer]
           |
      [Wired Modem]
           |
        [Cabo] -----> [ME Controller]
                           |
                    [ME Network completo]
```

---

## 🎮 Comandos Rápidos

```lua
me_monitor          # Iniciar monitor
me_config_editor    # Editar configuração
edit startup.lua    # Auto-iniciar
reboot              # Reiniciar computer
```

---

**Pronto para usar!** Se tiver dúvidas, abra uma issue no GitHub! 🚀

📌 **Repositório:** https://github.com/Guiirs/CC-tweeks-ATM10
