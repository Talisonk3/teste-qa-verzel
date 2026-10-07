# Teste Técnico QA Júnior – Verzel Store

## 👤 Informações do Candidato
- **Candidato:** Talison Vieira Brito
- **Cargo Pretendido:** QA Analyst / QA Júnior
- **Empresa Avaliadora:** Verzel
- **Demanda / Card:** VZS-142 – Cupom de desconto e frete grátis
- **Versão da Aplicação:** 2.3.0
- **Data da Execução:** Outubro de 2026
- **Ambiente de Testes:** [Verzel Store - QA Test](https://verzel-store.qa-test-verzel-store.workers.dev/)

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

## 📁 Estrutura do Repositório

```text
.
├── README.md               # Apresentação do projeto e instruções de execução
├── BUGS.md                 # Relatório detalhado dos defeitos encontrados
├── cenarios/               # Especificação dos testes em BDD (Gherkin)
│   ├── cupons.feature
│   ├── frete.feature
│   └── api.feature
├── evidencias/             # Evidências de execução (prints e gravações)
│   ├── manuais/
│   └── api/
└── tests/                  # Automação End-to-End em Playwright (TypeScript)
