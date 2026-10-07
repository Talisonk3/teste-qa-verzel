# language: pt

Funcionalidade: Regra de Frete Grátis
  Como cliente da Verzel Store
  Quero ter benefício de frete grátis em compras acima do valor limite
  Para economizar no custo total da entrega

  Contexto:
    Dado que o cliente está no carrinho de compras da Verzel Store

  Cenário 6: Subtotal igual ou superior a R$ 200,00 garante frete grátis
    Dado que o cliente possui o produto "Jaqueta Corta-Vento" (R$ 229,90) no carrinho
    Quando o carrinho calcula o frete
    Então o valor do frete deve ser R$ 0,00
    E o sistema deve indicar que a compra possui frete grátis

  Cenário 7: Subtotal inferior a R$ 200,00 cobra frete fixo e informa valor faltante
    Dado que o cliente possui o produto "Mochila Urbana 20L" (R$ 100,00) no carrinho
    Quando o carrinho calcula o frete
    Então o valor do frete deve ser de R$ 19,90
    E o sistema deve informar que faltam R$ 100,00 para frete grátis

  Cenário 8: Cupom de desconto incide apenas sobre o valor dos produtos
    Dado que o cliente possui produtos no carrinho com subtotal de R$ 100,00
    E o valor do frete calculado é de R$ 19,90
    Quando o cliente aplica o cupom de 10% "BEMVINDO10"
    Então o valor do desconto deve ser de R$ 10,00 (incidindo apenas sobre os R$ 100,00 dos produtos)
    E o valor do frete deve permanecer em R$ 19,90 sem alterações
