
Consulta 1 — `SELECT … FROM … JOIN`

> Listar todos os itens com dados da placa, material e nome do cliente.

```sql
SELECT
 e.id AS encomenda_id,
 c.nome AS cliente,
 i.frase,
 p.largura || 'x' || p.altura AS dimensao_cm,
 m.descricao AS material
FROM item i
JOIN encomenda e ON e.id = i.encomenda_id
JOIN cliente c ON c.id = e.cliente_id
JOIN placa p ON p.id = i.placa_id
JOIN material m ON m.id = p.material_id;
```

---

Consulta 2 — `SELECT … FROM … JOIN … WHERE`

> Encomendas abertas de um cliente específico, com valor acima de zero.

```sql
SELECT
 e.id,
 e.data,
 e.entrega,
 e.valor,
 c.nome AS cliente
FROM encomenda e
JOIN cliente c ON c.id = e.cliente_id
WHERE c.nome = 'Ana Silva'
 AND e.situacao = 'Aberta'
 AND e.valor > 0
ORDER BY e.data;
```

---

Consulta 3 — `SELECT … FROM … JOIN … GROUP BY`

> Quantidade de itens e valor total por encomenda.

```sql
SELECT
 e.id AS encomenda_id,
 c.nome AS cliente,
 e.situacao,
 COUNT(i.id) AS total_itens,
 e.valor AS valor_encomenda
FROM encomenda e
JOIN cliente c ON c.id = e.cliente_id
JOIN item i ON i.encomenda_id = e.id
GROUP BY e.id, c.nome, e.situacao, e.valor
ORDER BY total_itens DESC;
```

---

Consulta 4 — `SELECT … FROM … JOIN … WHERE … GROUP BY`

> Total de encomendas e receita por cliente, apenas para encomendas fechadas.

```sql
SELECT
 c.nome AS cliente,
 COUNT(e.id) AS total_encomendas,
 SUM(e.valor) AS receita_total
FROM encomenda e
JOIN cliente c ON c.id = e.cliente_id
WHERE e.situacao = 'Fechada'
GROUP BY c.id, c.nome
ORDER BY receita_total DESC;
```

---

Consulta 5 — `SELECT … FROM … JOIN … GROUP BY … HAVING`

> Encomendas com mais de 2 itens (independente de status).

```sql
SELECT
 e.id AS encomenda_id,
 c.nome AS cliente,
 e.situacao,
 COUNT(i.id) AS total_itens
FROM encomenda e
JOIN cliente c ON c.id = e.cliente_id
JOIN item i ON i.encomenda_id = e.id
GROUP BY e.id, c.nome, e.situacao
HAVING COUNT(i.id) > 2
ORDER BY total_itens DESC;
```

---

Consulta 6 — `SELECT … FROM … JOIN … WHERE … GROUP BY … HAVING`

> Materiais usados em encomendas abertas a partir de março de 2024,
> com valor médio por item acima de R$ 30,00.

```sql
SELECT
 m.descricao AS material,
 COUNT(i.id) AS total_itens,
 ROUND(AVG(m.custo + LENGTH(i.frase) * m.valor_letra), 2) AS valor_medio_item
FROM item i
JOIN encomenda e ON e.id = i.encomenda_id
JOIN placa p ON p.id = i.placa_id
JOIN material m ON m.id = p.material_id
WHERE e.situacao = 'Aberta'
 AND e.data >= '2024-03-01'
GROUP BY m.id, m.descricao
HAVING AVG(m.custo + LENGTH(i.frase) * m.valor_letra) > 30
ORDER BY valor_medio_item DESC;
```
