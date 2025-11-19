# 🔧 Como Montar o Sistema ME Monitor

## 📦 Itens que Você Precisa

```
✅ 1x Computer (ComputerCraft)
✅ 1x Wired Modem (ComputerCraft)
✅ Networking Cables (ComputerCraft)
✅ 1x ME Bridge Block (Applied Energistics 2) - IMPORTANTE!
✅ Seu sistema ME funcionando
```

**IMPORTANTE:** O ME Controller NÃO aceita Networking Cable diretamente!
Você precisa do bloco **ME Bridge** do AE2.

**Opcional:** Monitores para display externo

---

## 🏗️ Montagem - Passo a Passo

### **PASSO 1: Colocar o Computer**

Coloque o Computer em qualquer lugar próximo ao seu sistema ME.

```
[Computer]
```

---

### **PASSO 2: Adicionar Wired Modem no Computer**

1. Pegue um **Wired Modem**
2. Clique com **botão direito** em qualquer lado do Computer
3. O modem vai grudar no Computer

```
[Computer com Modem na lateral]
```

---

### **PASSO 3: Conectar ao ME System**

**IMPORTANTE:** O Networking Cable NÃO conecta direto no ME Controller!

#### **Solução: Use ME Bridge Block**

Procure no JEI: `ME Bridge` (bloco do AE2)

**Montagem correta:**

```
[Computer] 
    |
[Wired Modem]
    |
[Networking Cable] ──> [ME Bridge] ──> [Cabo ME] ──> [ME Controller/Sistema]
                         ↑
                    CLIQUE AQUI!
```

**Passo a passo:**

1. Coloque o bloco **ME Bridge** próximo ao seu sistema ME
2. Conecte o ME Bridge ao seu sistema usando **cabo do AE2** (Glass Cable, etc)
3. Use **Networking Cable** (ComputerCraft) do Wired Modem até o **ME Bridge**
4. **Clique com botão direito** no Networking Cable onde ele toca o ME Bridge
5. O cabo deve ficar conectado (muda de aparência)

---

### **PASSO 4: Ativar a Conexão**

**IMPORTANTE:** Você precisa clicar com **botão direito** no cabo onde ele toca o ME Interface/Controller para ativar a conexão!

O cabo deve mudar de aparência (geralmente fica mais grosso/conectado).

---

## 🎯 Setup Completo Visual

```
     SEU SISTEMA ME
          |
    [ME Controller]
          |
    [Cabo do AE2 - Glass Cable]
          |
    [ME Bridge Block] <─── CLIQUE no Networking Cable aqui!
          |
    [Networking Cable]
          |
    [Wired Modem]
          |
    [Computer] <─── Abra aqui e instale o programa
```

---

## 💻 Depois de Montar

1. **Abra o Computer** (botão direito)

2. **Instale o programa:**
   ```lua
   wget run https://raw.githubusercontent.com/Guiirs/CC-tweeks-ATM10/main/installer.lua
   ```

3. **Execute:**
   ```lua
   me_monitor
   ```

---

## ✅ Como Saber se Está Funcionando

### ❌ **Se aparecer erro:**
```
Erro: ME Bridge não encontrado!
```

**CHECKLIST DE DIAGNÓSTICO:**

#### 1️⃣ **Verificar Wired Modem no Computer**
- [ ] O Wired Modem está GRUDADO no Computer? (deve aparecer visualmente)
- [ ] É um **Wired Modem** (cinza) e NÃO Wireless Modem (vermelho)?

#### 2️⃣ **Verificar Cabo de Rede**
- [ ] Você está usando **Networking Cable** do ComputerCraft?
- [ ] NÃO é cabo do AE2 (Glass Cable/Covered Cable)?
- [ ] O cabo está conectando o Wired Modem até o ME Interface/Controller?

#### 3️⃣ **MUITO IMPORTANTE - Ativar o Cabo no ME**
- [ ] Você clicou com **botão direito** no cabo onde ele toca o ME Interface?
- [ ] O cabo mudou de aparência (ficou mais grosso/conectado)?
- [ ] Se não mudou, clique novamente!

#### 4️⃣ **Verificar ME System**
- [ ] O sistema ME está ligado? (tem energia)
- [ ] O ME Interface/Controller está funcionando?
- [ ] Teste: tente acessar o terminal ME normalmente

#### 5️⃣ **Verificar no Computer**
- [ ] Digite no Computer: `peripherals` ou `peripheral list`
- [ ] Deve aparecer algo como: `meBridge_0` ou similar
- [ ] Se não aparecer, a conexão não está ativa!

### ✅ **Se funcionar:**
```
========================================
   MONITOR AE2 - Sistema ME
========================================

Item                    Atual    Mínimo
----------------------------------------
Iron Ingot             1.2K      1.0K   (verde)
```

---

## 🔍 TESTE RÁPIDO - Verificar Conexão

Antes de instalar o programa, teste se o ME Bridge foi criado:

1. **Abra o Computer**
2. **Digite:**
   ```lua
   lua
   ```
3. **Digite:**
   ```lua
   peripheral.find("meBridge")
   ```

### Resultados:

✅ **Se aparecer algo como:**
```
table: 0x12345678
```
**SUCESSO!** O ME Bridge está conectado! Pode instalar o programa.

❌ **Se aparecer:**
```
nil
```
**PROBLEMA!** O ME Bridge não foi criado. Siga o checklist acima.

**Para sair do modo lua:** digite `exit()`

---

## 🛠️ Soluções Comuns

### **Problema 1: Usando o cabo errado**
❌ **ERRADO:** Cabo do AE2 (Glass Cable, Covered Cable, Smart Cable)
✅ **CORRETO:** Networking Cable do ComputerCraft (cabo preto/cinza)

**Como fazer:**
```
ComputerCraft > Blocks > Networking Cable
```

---

### **Problema 2: Não ativou o cabo**
Você PRECISA clicar com botão direito no ponto onde o Networking Cable toca o ME Interface!

**Visual:**
```
[ME Interface] <── CLIQUE AQUI no cabo!
    ║
    ║ (Networking Cable)
    ║
[Wired Modem]
```

O cabo deve ficar mais "grosso" ou mudar de cor no ponto de conexão.

---

### **Problema 3: ME System não tem energia**
- Verifique se seu ME Controller está aceso (com luzes)
- Certifique-se que tem energia chegando no sistema

---

### **Problema 4: Versão do mod**
Alguns modpacks/versões do AE2 precisam de **ME Capability Adapter** em vez de ME Interface.

**SOLUÇÃO - Tente uma destas opções:**

#### **Opção 1: ME Capability Adapter (Recomendado para ATM10)**
```
[Computer]
    |
[Wired Modem]
    |
[Networking Cable] ──> [ME Capability Adapter] ──> [ME System]
```
O ME Capability Adapter é um bloco específico do AE2 Additions/Expansions.

#### **Opção 2: Conectar direto no ME Controller**

**Cabo necessário: Networking Cable (ComputerCraft)**
- Cor: Cinza/Preto
- NO JEI: pesquise "Networking Cable" 
- É do mod **ComputerCraft**, NÃO do AE2!

**Montagem:**
```
[Computer] 
    |
[Wired Modem] (grudado no Computer)
    |
[Networking Cable] ──> [ME Controller] 
                        ↑
                   CLIQUE AQUI com botão direito!
```

**Passo a passo:**
1. Coloque Wired Modem no Computer
2. Pegue o Networking Cable (ComputerCraft)
3. Conecte do Wired Modem até o ME Controller
4. **Clique com botão direito** no cabo onde toca o Controller
5. O cabo deve mudar de aparência

#### **Opção 3: ME Pattern Provider**
Algumas versões usam ME Pattern Provider:
```
[Computer]
    |
[Wired Modem]
    |
[Networking Cable] ──> [ME Pattern Provider] ──> [ME System]
```

**Depois de conectar, SEMPRE clique com botão direito no cabo!**

---

### **Problema 5: Distância do cabo**
Networking Cable tem limite de distância (256 blocos padrão).

Se estiver muito longe, use **Wired Modem em ambos os lados:**
```
[Computer com Wired Modem] ─ Cabo ─ [Wired Modem] ─ [ME Interface]
```

---

## 📺 Adicionar Monitor Externo (Opcional)

Se quiser um display grande:

1. **Monte monitores** em formato retangular (ex: 2x2, 3x3)
2. **Coloque Wired Modem** em um dos monitores
3. **Conecte cabo** do modem do monitor até o Computer

```
[Monitor][Monitor]
[Monitor][Monitor]
    |
[Wired Modem]
    |
[Cabo] ───> [Computer]
```

O sistema detecta automaticamente!

---

## 🔌 Resumo Rápido

**Para ATM10 / AE2 mais recente:**

1. Computer + Wired Modem
2. Networking Cable do Computer até:
   - **ME Capability Adapter** (preferível) OU
   - **ME Controller** (direto) OU
   - **ME Pattern Provider**
3. **Clicar com botão direito no cabo** onde toca o bloco do ME
4. Testar: `lua` depois `peripheral.find("meBridge")`
5. Se aparecer `table:`, instalar programa
6. Pronto! ✅

---

**Dica:** O ME Bridge é criado automaticamente quando você conecta corretamente o Wired Modem ao ME System!

📌 **Repositório:** https://github.com/Guiirs/CC-tweeks-ATM10
