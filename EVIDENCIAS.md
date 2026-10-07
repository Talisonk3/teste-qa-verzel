# 📸 Relatório de Execução e Evidências de Testes - Verzel Store

## 🎟️ Regra de Cupons de Desconto (Card VZS-142)

---

### 🔹 Cenário 1: Aplicação de cupom válido com sucesso

**BDD / Gherkin:**
- Dado que o subtotal do carrinho é de R$ 100,00
- Quando o cliente aplica o cupom "BEMVINDO10"
- Então deve ser concedido 10% de desconto sobre o subtotal
- E o valor do desconto deve ser R$ 10,00

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 1</b></summary>

![Evidência Cenário 1](evidencias/cenario-01-cupom-valido.png)

</details>

---

### 🔹 Cenário 2: Aplicação de cupom com letras minúsculas e espaços

**BDD / Gherkin:**
- Dado que o subtotal do carrinho é de R$ 100,00
- Quando o cliente digita o cupom " bemvindo10 "
- Então o cupom deve ser aceito e aplicar 10% de desconto

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 2</b></summary>

![Evidência Cenário 2](evidencias/cenario-02-cupom-minusculas-espacos.gif)

</details>

---

### 🔹 Cenário 3: Tentativa de aplicação de cupom inexistente

**BDD / Gherkin:**
- Quando o cliente tenta aplicar o cupom "CUPOMINEXISTENTE"
- Então nenhuma porcentagem de desconto deve ser aplicada
- E a mensagem "Cupom inválido." deve ser exibida

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 3</b></summary>

![Evidência Cenário 3](evidencias/cenario-03-cupom-inexistente.png)

</details>

---

### 🔹 Cenário 4: Tentativa de aplicação de cupom expirado

**BDD / Gherkin:**
- Quando o cliente tenta aplicar o cupom "VERAO2026"
- Então nenhuma porcentagem de desconto deve ser aplicada
- E a mensagem "Cupom expirado." deve ser exibida

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 4</b></summary>

![Evidência Cenário 4](evidencias/cenario-04-cupom-expirado.png)

</details>

---

### 🔹 Cenário 5: Remoção do cupom aplicado no carrinho

**BDD / Gherkin:**
- Dado que o cupom "BEMVINDO10" está aplicado no carrinho
- Quando o cliente clica no botão "Remover cupom"
- Então o cupom deve ser removido
- E o valor total deve ser recalculado sem o desconto

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 5</b></summary>

![Evidência Cenário 5](evidencias/cenario-05-remocao-cupom.gif)

</details>

---

---

### 🔹 Cenário 6: Cálculo de frete para compras abaixo de R$ 200,00

**BDD / Gherkin:**
- Dado que o subtotal do carrinho é inferior a R$ 200,00
- Quando o valor do frete é calculado
- Então o valor do frete deve ser cobrado normalmente

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 6</b></summary>

![Evidência Cenário 6](evidencias/cenario-06-frete-carrinho-abaixo-limite.png)

</details>

---

---

---

### 🔹 Cenário 7: Validação da regra de frete grátis para compras de valor igual ou superior a R$ 200,00

**BDD / Gherkin:**
- Dado que o subtotal do carrinho atinge exatamente R$ 200,00 (2 itens de R$ 100,00)
- Quando o valor do frete é calculado
- Então o valor do frete deve ser R$ 0,00 (Grátis) conforme a regra de valor igual ou superior a R$ 200,00

* **Resultado:** Falha ❌ (Bug de Valor Limite - O sistema cobra frete com subtotal de R$ 200,00)

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 7</b></summary>

![Evidência Cenário 7](evidencias/cenario-07-frete-gratis-acima-limite.gif)

</details>

---

### 🔹 Cenário 8: Incidência do cupom de desconto exclusivamente sobre o valor dos produtos

**BDD / Gherkin:**
- Dado que o carrinho contém um produto de R$ 100,00 e o frete é R$ 19,90
- Quando o cliente aplica o cupom de 10% "BEMVINDO10"
- Então o desconto de R$ 10,00 deve incidir apenas sobre os R$ 100,00 do produto
- E o valor do frete deve permanecer em R$ 19,90
- E o total recalculado deve ser R$ 109,90

* **Resultado:** Sucesso ✅

<details>
<summary><b>🔍 Clique aqui para expandir a evidência do Cenário 8</b></summary>

![Evidência Cenário 8](evidencias/cenario-08-incidencia-cupom-desconto.png)

</details>
