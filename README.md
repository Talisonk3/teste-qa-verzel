# Teste Técnico QA Júnior – Verzel Store

## 👤 Informações do Candidato

* **Candidato:** Talison Vieira Brito
* **Cargo Pretendido:** QA Analyst / QA Júnior
* **Empresa Avaliadora:** Verzel
* **Demanda / Card:** VZS-142 – Cupom de desconto e frete grátis
* **Versão da Aplicação:** 2.3.0
* **Data da Execução:** Outubro de 2026
* **Ambiente de Testes:** [Verzel Store - QA Test](https://verzel-store.qa-test-verzel-store.workers.dev)

---

## 🎯 Objetivo do Projeto

Validação funcional, exploratória e de API da história de usuário **VZS-142**, cobrindo as regras de negócio de cupons de desconto, frete grátis e validações de pedido na Verzel Store.

---

## 📊 Matriz e Resumo da Cobertura de Testes

| Categoria | Tipo de Teste | Qtd |
| :--- | :--- | :---: |
| **Regra de Cupons** | UI / Manual | 5 |
| **Regra de Frete Grátis** | UI / Manual | 3 |
| **Validação de API & Limites** | API / Backend | 6 |
| **TOTAL DE CENÁRIOS** | — | **14** |

---

## 🤖 Cenários Automatizados (Playwright)

Foram automatizados 3 cenários de API em TypeScript cobrindo as regras essenciais do backend:

1. **`tests/frete.spec.ts`**
   * **Cenário:** Validação do cálculo de frete padrão para compras abaixo do limite de R$ 200,00.
   * **Endpoint:** `POST /api/carrinho/calcular`
   * **Verificações:** Status Code `200`, `freteGratis: false`, valor fixo de frete `19.9` e cálculo correto do valor restante para frete grátis.

2. **`tests/cupom.spec.ts`**
   * **Cenário:** Aplicação do cupom de desconto `BEMVINDO10`.
   * **Endpoint:** `POST /api/carrinho/calcular`
   * **Verificações:** Status Code `200`, `cupom.aplicado: true`, código aplicado e concessão de 10% de desconto sobre o subtotal.

3. **`tests/api-carrinho.spec.ts`**
   * **Cenário:** Validação de concessão automática de frete grátis para compras acima de R$ 200,00.
   * **Endpoint:** `POST /api/carrinho/calcular`
   * **Verificações:** Status Code `200`, `freteGratis: true`, valor de frete zerado (`0`) e totalização do carrinho.

---

## 📁 Estrutura do Repositório

```text
.
├── README.md             # Apresentação do projeto e instruções de execução
├── BUGS.md               # Relatório detalhado dos defeitos encontrados
├── cenarios/             # Especificação dos testes em BDD (Gherkin)
│   ├── cupons.feature
│   ├── frete.feature
│   └── api.feature
├── evidencias/           # Evidências de execução (prints e gravações)
│   ├── manuais/
│   └── api/
└── tests/                # Automação de testes de API em Playwright (TypeScript)
    ├── frete.spec.ts
    ├── cupom.spec.ts
    └── api-carrinho.spec.ts
```

---

## 🚀 Como Executar os Testes Automatizados (Playwright)

### Pré-requisitos
* Node.js instalado (v18 ou superior)

### Passos para execução:

1. Clone o repositório:
```bash
git clone [https://github.com/Talisonk3/teste-qa-verzel.git](https://github.com/Talisonk3/teste-qa-verzel.git)
cd teste-qa-verzel
```

2. Instale as dependências:
```bash
npm install
```

3. Execute os testes automatizados de API:
```bash
npx playwright test
```

4. Para visualizar o relatório interativo de execução no navegador:
```bash
npx playwright show-report
```
