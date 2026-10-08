# 🐛 Relatório de Bug (Bug Report)

<h3 id="bug-01">🐛 BUG-01: Cobrança indevida de frete para subtotal de R$ 200,00</h3>

* **ID do Bug:** BUG-01 (Referente ao Cenário 7: Subtotal inferior a R$ 200,00 cobra frete fixo e informa valor faltante)
* **Título:** Não aplicação da regra de Frete Grátis no valor limite exato de R$ 200,00
* **Severidade:** Alta *(Afeta a regra de negócio central e impede a conversão correta da promoção)*
* **Prioridade:** Alta
* **Componente:** Módulo de Carrinho / Checkout (Cálculo de Frete)
* **Ambiente:** Verzel Store (Web / Navegador Desktop)

---

#### 📝 Descrição do Problema
De acordo com a especificação técnica do e-commerce, compras com valor **igual ou superior a R$ 200,00** devem ter o valor do frete zerado (Frete Grátis). No entanto, ao adicionar itens que somam exatamente R$ 200,00 no carrinho (ex: 2 unidades de R$ 100,00), o sistema continua aplicando a cobrança do frete[cite: 9].

<details>
<summary><b>🔍 Clique aqui para ver detalhes, passos para reproduzir e evidências do BUG-01</b></summary>

<br>

#### 🔄 Passo a Passo para Reproduzir
1. Acesse a aplicação **Verzel Store**[cite: 9].
2. Navegue até o catálogo de produtos[cite: 9].
3. Adicione produtos ao carrinho até que o **Subtotal** seja exatamente **R$ 200,00** (ex: 2 itens de R$ 100,00 cada)[cite: 9].
4. Acesse a tela do **Carrinho**[cite: 9].
5. Verifique o campo **Frete** no "Resumo do pedido"[cite: 9].

---

#### 🎯 Comportamento Esperado
O campo Frete deve exibir a mensagem **"Grátis"** (R$ 0,00), pois o subtotal atingiu o valor limite estipulado pela regra de negócio (>= R$ 200,00)[cite: 9].

---

#### ❌ Comportamento Atual (Obtido)
O campo Frete continua exibindo a cobrança normal do frete, sem zerar o valor para o cliente[cite: 9].

---

#### 📸 Evidência do Bug
* **Cenário de Teste Relacionado:** Cenário 7 (Validação da regra de frete grátis para compras de valor igual ou superior a R$ 200,00)

<details>
<summary><b>🔍 Clique aqui para ver a evidência em GIF</b></summary>

<br>

<img src="./evidencias/cenario-07-frete-gratis-acima-limite.gif" alt="Evidência do BUG-01" width="100%" />

</details>
---

#### 🔍 Causa Provável (Análise de QA)
Falha na validação do operador relacional na lógica de cálculo do frete no backend/frontend (*Boundary Value Analysis*)[cite: 9]. O código provavelmente utiliza uma condição de "maior que" (`subtotal > 200`) em vez de "maior ou igual a" (`subtotal >= 200`)[cite: 9].

</details>

---

### [BUG-02] Endpoint de cálculo do carrinho aceita quantidade acima do limite permitido (7 unidades)

* **ID do Bug:** BUG-02 (Referente ao Cenário 10: Tentativa de adicionar quantidade acima do limite permitido via API)
* **Título:** Ausência de validação do limite máximo de 6 unidades por produto no endpoint `/api/carrinho/calcular`
* **Severidade:** Média *(Inconsistência entre a regra do negócio/front-end e a validação do backend)*
* **Prioridade:** Alta
* **Componente:** Backend / API Rest (`POST /api/carrinho/calcular`)
* **Ambiente:** Verzel Store API (`https://verzel-store.qa-test-verzel-store.workers.dev`)

---

#### 📝 Descrição do Problema
A regra de negócio do e-commerce estabelece que o limite máximo permitido por produto é de **6 unidades**. Contudo, ao enviar uma requisição `POST` para o endpoint `/api/carrinho/calcular` contendo `quantidade: 7`, a API processa a solicitação com sucesso (`200 OK`) e calcula o valor total sem aplicar o bloqueio ou retornar o erro de validação esperado.

<details>
<summary><b>🔍 Clique aqui para ver detalhes, passos para reproduzir e evidências do BUG-02</b></summary>

<br>

#### 🔄 Passo a Passo para Reproduzir
1. Abra o **Postman** (ou qualquer cliente HTTP).
2. Configure uma requisição **POST** para a URL:  
   `https://verzel-store.qa-test-verzel-store.workers.dev/api/carrinho/calcular`
3. No corpo da requisição (`Body` -> `raw` -> `JSON`), insira o seguinte payload:
    ```json
    {
      "itens": [
        {
          "produtoId": "P001",
          "quantidade": 7
        }
      ]
    }
---

#### 🎯 Comportamento Esperado
A API deve recusar o cálculo e retornar um **Status Code `400 Bad Request`** ou **`422 Unprocessable Entity`** acompanhado de um código de erro de validação indicando que o limite máximo de 6 unidades foi excedido.

---

#### ❌ Comportamento Atual (Obtido)
A API responde com **Status Code `200 OK`** e realiza o cálculo normal do subtotal e total para 7 unidades:

```json
{
  "itens": [
    {
      "produtoId": "P001",
      "nome": "Camiseta Essencial",
      "precoUnitario": 59.9,
      "quantidade": 7,
      "total": 419.3
    }
  ],
  "subtotal": 419.3,
  "desconto": 0,
  "frete": 0,
  "freteGratis": true,
  "valorFaltanteFreteGratis": 0,
  "total": 419.3,
  "cupom": null
}
