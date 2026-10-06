# 📸 Relatório de Execução e Evidências de Testes - Verzel Store

## 🎟️ Regra de Cupons de Desconto (Card VZS-142)

---

### 🔹 Cenário 1: Aplicação de cupom válido com sucesso
**BDD / Gherkin:**
```gherkin
Dado que o subtotal do carrinho é de R$ 100,00
Quando o cliente aplica o cupom "BEMVINDO10"
Então deve ser concedido 10% de desconto sobre o subtotal
E o valor do desconto deve ser R$ 10,00
