import { test, expect } from '@playwright/test';

const BASE_URL = 'https://verzel-store.qa-test-verzel-store.workers.dev';

test.describe('API - Aplicação de Cupom', () => {

  test('Deve aplicar cupom BEMVINDO10 e conceder 10% de desconto', async ({ request }) => {
    const response = await request.post(`${BASE_URL}/api/carrinho/calcular`, {
      data: {
        itens: [
          {
            produtoId: 'P001',
            quantidade: 1
          }
        ],
        cupom: 'BEMVINDO10'
      }
    });

    expect(response.status()).toBe(200);

    const body = await response.json();

    expect(body.cupom.aplicado).toBe(true);
    expect(body.cupom.codigo).toBe('BEMVINDO10');
    expect(body.desconto).toBe(5.99); // 10% de R$ 59,90
  });

});