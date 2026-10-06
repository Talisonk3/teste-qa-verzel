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

  Cenário 8: Frete grátis considera o subtotal antes do desconto do cupom
    Dado que o cliente possui produtos no carrinho com subtotal de R$ 200,00
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o valor do desconto aplicado deve ser de R$ 20,00
    E o subtotal com desconto passa a ser R$ 180,00
    Mas o valor do frete deve permanecer R$ 0,00 (frete grátis)
