# 5.5 — Views

---

View 1 — 3 clientes com maior receita

Considera apenas encomendas com `situacao = 'Fechada'`

```sql
CREATE OR REPLACE VIEW viww_top3_clientes_receita AS
SELECT
 c.id,
 c.nome,
 c.cpf,
 COUNT(e.id) AS total_encomendas,
 SUM(e.valor) AS receita_total
FROM cliente c
JOIN encomenda e ON e.cliente_id = c.id
WHERE e.situacao = 'Fechada'
GROUP BY c.id, c.nome, c.cpf
ORDER BY receita_total DESC
LIMIT 3;
```

```sql
SELECT * FROM viww_top3_clientes_receita;
```

---

View 2 — Valor arrecadado por placa

Soma o valor gerado por cada tipo de placa nas encomendas fechadas.
O valor por item é calculado como `material.custo + LENGTH(frase) × material.valor_letra`.

```sql
CREATE VIEW view_valor_por_placa AS
SELECT
 p.id AS placa_id,
 p.largura || ' x ' || p.altura || ' cm' AS dimensao,
 m.descricao AS material,
 COUNT(i.id) AS total_vendas,
 ROUND(
 SUM(m.custo + LENGTH(i.frase) * m.valor_letra), 2
 ) AS valor_arrecadado
FROM placa p
JOIN item i ON i.placa_id = p.id
JOIN encomenda e ON e.id = i.encomenda_id
JOIN material m ON m.id = p.material_id
WHERE e.situacao = 'Fechada'
GROUP BY p.id, p.largura, p.altura, m.descricao
ORDER BY valor_arrecadado DESC;
```

```sql
SELECT * FROM view_valor_por_placa;
```
