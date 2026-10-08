import { test, expect } from '@playwright/test';

const BASE_URL = 'https://verzel-store.qa-test-verzel-store.workers.dev';

test.describe('API - Regras de Frete', () => {

  test('Deve cobrar frete padrao para compras abaixo do limite de R$ 200', async ({ request }) => {
    // Envia 1 produto P001 (R$ 59,90) - Valor total abaixo de R$ 200,00
    const response = await request.post(`${BASE_URL}/api/carrinho/calcular`, {
      data: {
        itens: [
          {
            produtoId: 'P001',
            quantidade: 1
          }
        ]
      }
    });

    // 1. Valida Status Code
    expect(response.status()).toBe(200);

    const body = await response.json();

    // 2. Validações das Regras de Frete
    expect(body.freteGratis).toBe(false);
    expect(body.frete).toBe(19.9);
    expect(body.valorFaltanteFreteGratis).toBe(140.1);
  });

});