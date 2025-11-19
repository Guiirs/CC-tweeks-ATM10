# Instruções para Publicar no GitHub

## ✅ Status Atual

- ✅ Repositório Git inicializado
- ✅ Commit inicial criado
- ✅ Branch `main` configurada
- ✅ Branch `development` criada
- ✅ Arquivos prontos para envio

## 📤 Próximos Passos

### 1. Criar Repositório no GitHub

1. Acesse [GitHub](https://github.com)
2. Clique no botão **"+"** no canto superior direito
3. Selecione **"New repository"**
4. Configure o repositório:
   - **Nome**: `ae2-monitor-cc` (ou o nome que preferir)
   - **Descrição**: `Sistema de monitoramento AE2 para ComputerCraft`
   - **Visibilidade**: Public ou Private
   - ⚠️ **NÃO marque** "Initialize with README" (já temos um)
5. Clique em **"Create repository"**

### 2. Conectar e Enviar os Arquivos

Após criar o repositório, o GitHub mostrará instruções. Execute estes comandos:

```powershell
cd "c:\Users\faria\Downloads\ae2 cc"

# Conectar ao repositório remoto (substitua SEU-USUARIO pelo seu nome de usuário)
git remote add origin https://github.com/SEU-USUARIO/ae2-monitor-cc.git

# Enviar branch main
git push -u origin main

# Enviar branch development
git push -u origin development
```

### 3. Autenticação

Se solicitado credenciais, use um **Personal Access Token**:

1. Vá em GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Clique em **"Generate new token (classic)"**
3. Marque as permissões: `repo` (todas as opções)
4. Copie o token gerado
5. Use o token como senha quando solicitado

### 4. Trabalhar com Branches

#### Para trabalhar na branch development:
```powershell
git checkout development
```

#### Para voltar à main:
```powershell
git checkout main
```

#### Para fazer merge da development na main:
```powershell
git checkout main
git merge development
git push
```

## 📋 Comandos Úteis

### Verificar status:
```powershell
git status
```

### Adicionar mudanças:
```powershell
git add .
```

### Fazer commit:
```powershell
git commit -m "Sua mensagem aqui"
```

### Enviar para o GitHub:
```powershell
git push
```

### Ver branches:
```powershell
git branch -a
```

### Atualizar do GitHub:
```powershell
git pull
```

## 🔗 URLs Úteis

Depois de criar o repositório, você terá:

- **Repositório**: `https://github.com/SEU-USUARIO/ae2-monitor-cc`
- **Clone HTTPS**: `https://github.com/SEU-USUARIO/ae2-monitor-cc.git`
- **Raw Files**: `https://raw.githubusercontent.com/SEU-USUARIO/ae2-monitor-cc/main/ARQUIVO.lua`

## 📦 Usar no ComputerCraft

Após publicar, os jogadores podem instalar com:

```lua
-- Download direto do arquivo principal
wget https://raw.githubusercontent.com/SEU-USUARIO/ae2-monitor-cc/main/me_monitor.lua me_monitor.lua

-- Download do editor de configuração
wget https://raw.githubusercontent.com/SEU-USUARIO/ae2-monitor-cc/main/me_config_editor.lua me_config_editor.lua
```

Atualize o arquivo `installer.lua` com as URLs corretas após publicar!

## 🎯 Workflow Recomendado

1. **Desenvolvimento**: Trabalhe na branch `development`
2. **Testes**: Teste as mudanças
3. **Merge**: Mescle na `main` quando estável
4. **Release**: Use tags para versões: `git tag v1.0` e `git push --tags`

---

**Pronto para começar!** 🚀

Execute os comandos da seção 2 depois de criar o repositório no GitHub.
