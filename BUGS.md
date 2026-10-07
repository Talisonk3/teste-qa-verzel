# 🐛 Relatório de Bug (Bug Report)

### [BUG-01] Cobrança indevida de frete para compras de valor exatamente igual a R$ 200,00

* **ID do Bug:** BUG-01
* **Título:** Não aplicação da regra de Frete Grátis no valor limite exato de R$ 200,00
* **Severidade:** Alta *(Afeta a regra de negócio central e impede a conversão correta da promoção)*
* **Prioridade:** Alta
* **Componente:** Módulo de Carrinho / Checkout (Cálculo de Frete)
* **Ambiente:** Verzel Store (Web / Navegador Desktop)

---

### 📝 Descrição do Problema
De acordo com a especificação técnica do e-commerce, compras com valor **igual ou superior a R$ 200,00** devem ter o valor do frete zerado (Frete Grátis). No entanto, ao adicionar itens que somam exatamente R$ 200,00 no carrinho (ex: 2 unidades de R$ 100,00), o sistema continua aplicando a cobrança do frete.

---

### 🔁 Passo a Passo para Reproduzir
1. Acesse a aplicação **Verzel Store**.
2. Navegue até o catálogo de produtos.
3. Adicione produtos ao carrinho até que o **Subtotal** seja exatamente **R$ 200,00** (ex: 2 itens de R$ 100,00 cada).
4. Acesse a tela do **Carrinho**.
5. Verifique o campo **Frete** no "Resumo do pedido".

---

### 🎯 Comportamento Esperado
O campo **Frete** deve exibir a mensagem **"Grátis"** (R$ 0,00), pois o subtotal atingiu o valor limite estipulado pela regra de negócio (>= R$ 200,00).

---

### ❌ Comportamento Atual (Obtido)
O campo **Frete** continua exibindo a cobrança normal do frete, sem zerar o valor para o cliente.

---

### 📸 Evidência do Bug

* **Cenário de Teste Relacionado:** Cenário 7 (Validação da regra de frete grátis para compras de valor igual ou superior a R$ 200,00)

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Bug</b></summary>

![Evidência do Bug](./evidencias/cenario-07-frete-gratis-acima-limite.gif)

</details>,00)

---

### 🔍 Causa Provável (Análise de QA)
Falha na validação do operador relacional na lógica de cálculo do frete no backend/frontend (*Boundary Value Analysis*). O código provavelmente utiliza uma condição de "maior que" (`subtotal > 200`) em vez de "maior ou igual a" (`subtotal >= 200`).
