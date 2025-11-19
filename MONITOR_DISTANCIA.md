# 📺 Como Conectar Monitor à Distância

## 🔧 Itens Necessários

```
✅ Monitor(es) - 5x5 ou qualquer tamanho
✅ 2x Wired Modem (um no Computer, outro no Monitor)
✅ Networking Cable (para conectar à distância)
```

---

## 🏗️ Montagem Passo a Passo

### **PASSO 1: Montar os Monitores**

Monte seus monitores em formato retangular (ex: 5x5):

```
[Monitor][Monitor][Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor][Monitor][Monitor]
```

---

### **PASSO 2: Colocar Wired Modem no Monitor**

1. Pegue um **Wired Modem**
2. **Clique com botão direito** em qualquer monitor (de preferência um dos cantos)
3. O Wired Modem vai grudar no monitor

```
[Monitor com Wired Modem]
```

---

### **PASSO 3: Conectar com Networking Cable**

1. Use **Networking Cable** para conectar do Computer até o monitor
2. O cabo pode ter quantos blocos você quiser (até 256 blocos)

```
[Computer]                                [Monitores 5x5]
    |                                          |
[Wired Modem] ═══════════════════════ [Wired Modem]
              (Networking Cable)
```

**Visual 3D:**
```
[Computer]
    |
[Wired Modem]
    ║
    ║ (Networking Cable - pode ser BEM longo!)
    ║
    ║
    ║
[Wired Modem]
    |
[Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor]
[Monitor][Monitor][Monitor]
```

---

### **PASSO 4: ATIVAR os Modems (IMPORTANTE!)**

Você precisa **ativar** ambos os Wired Modems:

1. **Clique com botão direito** no Wired Modem do Computer
2. **Clique com botão direito** no Wired Modem do Monitor
3. Os modems devem ficar com uma **luz vermelha** quando ativados

---

## ✅ Como Saber se Funcionou

1. Execute o programa: `me_monitor`
2. O display deve aparecer automaticamente no monitor grande
3. O Computer continuará mostrando a interface também

---

## 🔄 Múltiplos Monitores em Locais Diferentes

Você pode ter vários monitores conectados ao mesmo Computer:

```
                    [Monitor 1 - 5x5]
                          |
                    [Wired Modem]
                          |
[Computer] ══════════════╬═══════════════ [Monitor 2 - 3x3]
    |                    |                      |
[Wired Modem]      [Wired Modem]         [Wired Modem]
                          |
                    [Monitor 3 - 2x2]
```

O programa usa automaticamente o primeiro monitor encontrado.

---

## 💡 Dicas

### **Para cabos muito longos:**
- Networking Cable suporta até **256 blocos** por padrão
- Você pode passar o cabo por paredes, teto, chão
- Não precisa ser em linha reta!

### **Para economizar Wired Modems:**
Se os monitores estiverem grudados no Computer, não precisa de cabo:
```
[Computer][Monitor][Monitor]
          [Monitor][Monitor]
```

### **Troubleshooting:**
- ✅ Ambos os Wired Modems têm luz vermelha? (ativados)
- ✅ O Networking Cable está conectado?
- ✅ O programa está rodando? `me_monitor`
- ✅ Digite `peripherals` - deve aparecer `monitor_X`

---

## 🎨 Ajustar Tamanho da Fonte

Se a fonte estiver muito pequena ou grande, edite:

```lua
edit me_monitor.lua
```

Linha 8, mude o valor:
```lua
local MONITOR_SCALE = 1.0  -- Mude este número
```

Valores:
- `0.5` = Muito pequeno
- `1.0` = Médio (padrão para 5x5)
- `1.5` = Grande
- `2.0` = Muito grande

---

## 📐 Exemplo Completo - Setup à Distância

```
SALA DO COMPUTER              CORREDOR (50 blocos)          SALA DOS MONITORES
                              
[Computer]                                                   [M][M][M][M][M]
    |                                                        [M][M][M][M][M]
[Wired Modem]                                                [M][M][M][M][M]
    ║                                                        [M][M][M][M][M]
    ║══════════════════════════════════════════════════════ [M][M][M][M][M]
    (Networking Cable passando por paredes/chão)                  |
                                                            [Wired Modem]
```

**Pronto para montar!** 🚀
