# ⚠️ TROUBLESHOOTING - ME Bridge não funciona

## 🔍 Diagnóstico Completo

### TESTE 1: Verificar se o Computer reconhece algum periférico

Abra o Computer e digite:
```lua
peripherals
```
OU
```lua
peripheral.getNames()
```

**O que deve aparecer:**
- Se aparecer `meBridge_0` ou similar = ✅ Conexão OK!
- Se aparecer apenas `back`, `left`, etc = ❌ Sem conexão

---

### TESTE 2: Verificar mod instalado

Digite no Computer:
```lua
lua
peripheral.getType("back")
```
(substitua "back" pelo lado onde está o modem)

---

## 🛠️ Soluções Alternativas

### OPÇÃO 1: Usar apenas 1 Wired Modem direto no bloco AE2

Alguns packs permitem conectar o Wired Modem DIRETAMENTE no bloco do AE2:

1. Retire o cabo
2. Coloque o Wired Modem DIRETO no ME Interface (clique com botão direito)
3. O modem vai grudar no ME Interface
4. Teste: `peripheral.find("meBridge")`

```
[Computer]    [ME Interface com Wired Modem grudado nele]
```

---

### OPÇÃO 2: Usar mod diferente - AppliedMekanistics

Se o servidor tiver o mod **AppliedMekanistics**, use:

**ME Chemical Storage Cell** ou **Mekanism Entangloporter**

---

### OPÇÃO 3: Usar OpenComputers em vez de ComputerCraft

Se não funcionar, pode ser que o pack não tenha integração AE2+CC.
Tente usar **OpenComputers** com **Adapter**.

---

### OPÇÃO 4: Verificar se CC:Tweaked tem integração AE2

Digite no chat do Minecraft:
```
/ct dump
```

Procure por "ae2" ou "appeng" nos arquivos gerados.

---

## 📋 Checklist Final

- [ ] Está usando **Networking Cable** (cinza do ComputerCraft), NÃO cabo roxo do AE2?
- [ ] O ME Interface está conectado e funcionando no sistema ME?
- [ ] O Computer está ligado?
- [ ] Você clicou com botão direito nos Wired Modems para ativar?
- [ ] O servidor tem CC:Tweaked + AE2 com integração?
- [ ] Tentou conectar o Wired Modem DIRETO no ME Interface (sem cabo)?

---

## 🆘 Teste de Última Instância

### Verificar se o pack suporta a integração:

1. Procure no JEI por: `ME Bridge`
2. Se NÃO existir, o pack pode não ter integração CC+AE2
3. Pergunte ao admin do servidor se a integração está ativa

### Mods necessários:
- **CC:Tweaked** (ComputerCraft)
- **Applied Energistics 2**
- **CC:Tweaked AE2 Addon** (ou integração built-in)

---

## 💡 Solução Alternativa - Sistema Manual

Se realmente não funcionar, posso criar um sistema alternativo que:
- Usa Storage Drawers
- Usa Chests com inventários
- Monitora usando Inventory Peripheral

Quer que eu crie essa alternativa? 🤔
