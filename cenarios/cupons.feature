# language: pt

Funcionalidade: Regra de Cupons de Desconto
  Como cliente da Verzel Store
  Quero aplicar cupons no carrinho
  Para obter descontos no subtotal dos produtos

  Contexto:
    Dado que o cliente está no carrinho de compras da Verzel Store

  Cenário 1: Aplicação de cupom válido com sucesso
    Dado que o subtotal do carrinho é de R$ 100,00
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então deve ser concedido 10% de desconto sobre o subtotal
    E o valor do desconto deve ser R$ 10,00

    * **Status:** Passou ✅
<details>
<summary><b>🔍 Clique para expandir a evidência do Cenário 1</b></summary>

![Cenário 1](cenario-01-cupom-valido.png)

</details>

  Cenário 2: Aplicação de cupom com letras minúsculas e espaços
    Dado que o subtotal do carrinho é de R$ 100,00
    Quando o cliente digita o cupom "  bemvindo10  "
    Então o cupom deve ser aceito e aplicar 10% de desconto

  Cenário 3: Tentativa de aplicação de cupom inexistente
    Quando o cliente tenta aplicar o cupom "CUPOMINEXISTENTE"
    Então nenhuma porcentagem de desconto deve ser aplicada
    E a mensagem "Cupom inválido." deve ser exibida

  Cenário 4: Tentativa de aplicação de cupom expirado
    Quando o cliente tenta aplicar o cupom "VERAO2026"
    Então nenhuma porcentagem de desconto deve ser aplicada
    E a mensagem "Cupom expirado." deve ser exibida

  Cenário 5: Remoção do cupom aplicado no carrinho
    Dado que o cupom "BEMVINDO10" está aplicado no carrinho
    Quando o cliente clica no botão de remover o cupom
    Então o valor do desconto deve ser zerado (R$ 0,00)
    E o valor total do carrinho deve ser recalculado sem o desconto
    E o campo de digitação de cupom deve voltar a ficar limpo e disponível para preenchimento
