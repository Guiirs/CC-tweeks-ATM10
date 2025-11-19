# 🔧 Como Montar o Sistema ME Monitor

## 📦 Itens que Você Precisa

```
✅ 1x Computer (ComputerCraft)
✅ 1x Wired Modem (ComputerCraft)
✅ Networking Cables (ComputerCraft)
✅ 1x ME Interface OU ME Controller (Applied Energistics 2)
```

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

Você tem 2 opções:

#### **Opção A - ME Interface (Mais Comum)**

1. Pegue **Networking Cable** (cabo de rede do ComputerCraft)
2. Conecte do **Wired Modem** (no Computer) até o **ME Interface**
3. Clique com **botão direito** no cabo que está tocando o ME Interface

```
[Computer] 
    |
[Wired Modem]
    |
[Networking Cable] ─────> [ME Interface]
                                |
                          [Seu sistema ME]
```

#### **Opção B - Direto no ME Controller**

1. Conecte o cabo do Computer direto no **ME Controller**
2. Clique com **botão direito** no cabo conectado ao Controller

```
[Computer] 
    |
[Wired Modem]
    |
[Networking Cable] ─────> [ME Controller]
```

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
    [ME Interface] <─── Clique aqui no cabo!
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

**Verifique:**
- [ ] Wired Modem está no Computer?
- [ ] Cabo conecta o Modem ao ME Interface/Controller?
- [ ] Você clicou com botão direito no cabo no ME Interface?
- [ ] O sistema ME está ligado (tem energia)?

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

1. Computer + Wired Modem
2. Cabo do Computer até ME Interface
3. Clicar com botão direito no cabo no ME Interface
4. Instalar programa
5. Pronto! ✅

---

**Dica:** O ME Bridge é criado automaticamente quando você conecta corretamente o Wired Modem ao ME System!

📌 **Repositório:** https://github.com/Guiirs/CC-tweeks-ATM10
