import { test, expect } from '@playwright/test';

const BASE_URL = 'https://verzel-store.qa-test-verzel-store.workers.dev';

test.describe('API - Validações do Carrinho', () => {

  test('Deve calcular carrinho com frete gratis para valores acima de R$ 200', async ({ request }) => {
    // 4 unidades de P001 (4 x R$ 59,90 = R$ 239,60)
    const response = await request.post(`${BASE_URL}/api/carrinho/calcular`, {
      data: {
        itens: [
          {
            produtoId: 'P001',
            quantidade: 4
          }
        ]
      }
    });

    expect(response.status()).toBe(200);

    const body = await response.json();

    expect(body.subtotal).toBe(239.6);
    expect(body.freteGratis).toBe(true);
    expect(body.frete).toBe(0);
    expect(body.total).toBe(239.6);
  });

});