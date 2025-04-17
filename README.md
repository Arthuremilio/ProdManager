# Visão Geral do Projeto
Este sistema foi desenvolvido com fins educacionais, com o objetivo de explorar conceitos fundamentais da arquitetura cliente-servidor utilizando a linguagem de programação Delphi.
A proposta foi simular um ambiente real de cadastro e faturamento de produtos, integrando funcionalidades como controle de estoque e emissão de notas fiscais, com divisão clara entre camadas e aplicação de boas práticas como separação de responsabilidades e uso de microserviços.

---

## ✅ Comportamentos Esperados

- Validação de saldo antes da impressão
- Se o saldo for suficiente:
  - Nota é impressa (.txt)
  - Estoque é baixado
  - Status da nota é alterado para "Fechada"
  - Usuário recebe feedback claro

---

## 🏗️ Arquitetura

### 1. EstoqueService
- CRUD de produtos
- Controle e baixa de saldo
- Endpoints expostos via `TIdHTTPServer`

### 2. FaturamentoService
- CRUD de notas fiscais e itens
- Impressão e comunicação com EstoqueService
- Endpoints via `TIdHTTPServer`

### 3. Cliente Delphi (VCL)
- Interface gráfica para gerenciar os dados
- Comunicação HTTP com os serviços
- Geração de arquivo `.txt` da nota

---

## 🛠️ Tecnologias Utilizadas

- Delphi VCL
- Firebird 4.0.5
- Indy Components (`TIdHTTP`, `TIdHTTPServer`)
- JSON (System.JSON)
- Arquivos `.txt` para logs e impressão

---

## 🔁 Fluxo da Aplicação

1. Cadastro de produto (EAN, nome, saldo, custo e preço)
2. Criação de nota fiscal
3. Inclusão de produtos na nota
4. Impressão:
   - Validação de saldo
   - Baixa de estoque
   - Alteração de status
   - Geração de `.txt`

---

## ⚠️ Tratamento de Falhas

### Cenário Simulado:
- Serviço de estoque offline → operação é abortada
- Nenhuma alteração na nota
- Mensagem de erro exibida:  
  `"Erro de conexão: serviço está desligado."`

---

## 🔐 Transações ACID

Operações críticas usam:
- `StartTransaction`
- `Commit`
- `Rollback`

---

## 🧵 Concorrência

- Endpoint `/produto/saldo` usa:
  ```sql
  SELECT Saldo FROM Produtos WHERE ID = :id FOR UPDATE WITH LOCK

Isso garante bloqueio de linha e evita problemas de leitura suja em acessos simultâneos.

---

## 🖥️ Como Executar

### 1. Banco de Dados

- Instale o Firebird
- Caminho padrão: `\ProdManager\Data\BANCO.FDB`
- Ajuste o caminho no código, se necessário

### 2. Instalação dos serviços

```bash
cd \ProdManager\EstoqueService\Server\Win32\Release
EstoqueService.exe /install

cd \ProdManager\FaturamentoService\Server\Win32\Release
FaturamentoService.exe /install
```

### 3. Execução

- Pressione `Win + R` → `services.msc`
- Inicie: `EstoqueController` e `FaturamentoController`
- Execute: `\ProdManager\Client\Win32\Release\Client.exe`

---

## 🔎 Endpoints Principais

### EstoqueService (porta 8081)

- GET /produto
- GET /produto/{ean}
- POST /produto
- POST /produto/{id}
- POST /produto/saldo
- POST /produto/delete/{id}

### FaturamentoService (porta 8082)

- GET /nota
- GET /nota/{id}
- GET /nota/itens/
- POST /nota
- POST /nota/item
- POST /nota/imprimir
- POST /nota/deletar/{id}
- POST /nota/item/deletar/{id}
- POST /nota/atualizar/{id}
- POST /nota/atualizar/valortotal/{id}
- POST /nota/atualizar/chave/{id}

---

## 📂 Geração de Arquivo da Nota

Notas emitidas são salvas em:

`\ProdManager\NotasEmitidas\Nota_{ID}.txt`

---

## ✅ Requisitos Atendidos

| Funcionalidade                             | Status |
|-------------------------------------------|--------|
| Cadastro de produtos                      | ✅     |
| Cadastro de notas com itens               | ✅     |
| Impressão com validação de saldo          | ✅     |
| Baixa de estoque e fechamento da nota     | ✅     |
| Microserviços independentes               | ✅     |
| Transações ACID                           | ✅     |
| Cenário de falha com recuperação          | ✅     |
| Controle de concorrência                  | ✅     |

---

## 👨‍💻 Desenvolvedor

**Arthur Fonseca**  
📧 arthur.elf95@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/arthuremilio)  
🐙 [GitHub](https://github.com/Arthuremilio)
