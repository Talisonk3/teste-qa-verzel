# language: pt

Funcionalidade: Validação de API e Regras de Limite
  Como desenvolvedor/QA
  Quero validar os endpoints da API da Verzel Store
  Para garantir a integridade das respostas e códigos de erro

  Cenário 9: Tentar adicionar mais de 5 unidades do mesmo produto
    Quando o cliente tenta alterar a quantidade do produto "P001" para 6
    Então a interface/API deve barrar a ação
    E retornar o código de erro "QUANTIDADE_MAXIMA_EXCEDIDA"

  Cenário 10: Tentativa de adicionar quantidade acima do limite permitido via API
    Dado que é enviada uma requisição POST para a rota "/api/carrinho/calcular"
    E o corpo da requisição contém o produto "P001" com quantidade 7
    Quando a API processa a requisição
    Então a API deve retornar o código de erro de validação
    E não deve aceitar o cálculo do carrinho com a quantidade excedida
    
  Cenário 11: Confirmação de pedido com sucesso na API
    Dado que o cliente preenche dados válidos (Nome e Sobrenome, E-mail e CEP)
    E possui itens válidos no carrinho
    Quando confirma o pedido
    Então o sistema deve responder com status 201
    E gerar um número de pedido no formato "VZ-XXXXXX"

  Cenário 12: Tentativa de criação de pedido sem e-mail do cliente via API
    Dado que é enviada uma requisição POST para a rota "/api/pedidos"
    E o corpo da requisição omite o e-mail do cliente
    Quando a API tenta criar o pedido
    Então deve responder com status HTTP 422
    E o código de erro retornado deve ser "DADOS_INVALIDOS"

  Cenário 13: Cálculo do carrinho com cupom válido via API
    Dado que é enviada uma requisição POST para a rota "/api/carrinho/calcular"
    E o corpo da requisição contém produtos válidos e o cupom "BEMVINDO10"
    Quando a API processa a requisição
    Então deve responder com status HTTP 200
    E o JSON de resposta deve conter o subtotal, 10% de desconto e a mensagem "Cupom aplicado: 10% de desconto nos produtos."

  Cenário 14: Tentativa de confirmação de pedido com cupom expirado via API
    Dado que é enviada uma requisição POST para a rota "/api/pedidos"
    E o corpo da requisição contém os dados do cliente e o cupom expirado "VERAO2026"
    Quando a API tenta criar o pedido
    Então deve responder com status HTTP 422
    E o código de erro retornado deve ser "CUPOM_EXPIRADO"
