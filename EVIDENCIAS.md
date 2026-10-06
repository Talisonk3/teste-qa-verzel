# 📸 Relatório de Execução e Evidências de Testes - Verzel Store

## 🎟️ Regra de Cupons de Desconto (Card VZS-142)

---

### 🔹 Cenário 1: Aplicação de cupom válido com sucesso
**BDD / Gherkin:**
```gherkin```
Dado que o subtotal do carrinho é de R$ 100,00
Quando o cliente aplica o cupom "BEMVINDO10"
Então deve ser concedido 10% de desconto sobre o subtotal
E o valor do desconto deve ser R$ 10,00

Dado que o subtotal do carrinho é de R$ 100,00
Quando o cliente digita o cupom " bemvindo10 "
Então o cupom deve ser aceito e aplicar 10% de desconto

Quando o cliente tenta aplicar o cupom "CUPOMINEXISTENTE"
Então nenhuma porcentagem de desconto deve ser aplicada
E a mensagem "Cupom inválido." deve ser exibida

Quando o cliente tenta aplicar o cupom "VERAO2026"
Então nenhuma porcentagem de desconto deve ser aplicada
E a mensagem "Cupom expirado." deve ser exibida

Dado que o cupom "BEMVINDO10" está aplicado no carrinho
Quando o cliente clica no botão "Remover cupom"
Então o cupom deve ser removido
E o valor total deve ser recalculado sem o desconto
