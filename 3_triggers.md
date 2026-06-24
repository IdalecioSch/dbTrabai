### 3 — Trigger antes de insercao pra poder ja ser chamada ao inserir dados

Fun trigger 1 atualiza encomenda.valor quando insere/altera/exclui

Calcula o valor da encomenda quando adiciona um novo item no pedido, formula: `material.custo + LENGTH(item.frase) × material.valor_letra`.


```sql
CREATE FUNCTION fun_att_valor_enc()
RETURNS TRIGGER AS $$
DECLARE
 val_enc_id INTEGER;
BEGIN
 IF TG_OP = 'DELETE' THEN
 val_enc_id := OLD.encomenda_id; -- old pq pega o item.encomenda id antes de apagar
 ELSE
 val_enc_id := NEW.encomenda_id; -- new pq pega o item.encomenda_id depois de alterar/inserir
 END IF;


 UPDATE encomenda
 SET valor = (
 SELECT COALESCE(
 SUM(m.custo + LENGTH(i.frase) * m.valor_letra),
 0.00 
 )
 -- Coalese pq ele tenta pegar sum, se ficar null, retorna 0.00 msm, como um operador ternario
 FROM item i
 JOIN placa p ON p.id = i.placa_id
 JOIN material m ON m.id = p.material_id
 WHERE i.encomenda_id = val_enc_id
 )
 WHERE id = val_enc_id;


 IF TG_OP = 'UPDATE' AND OLD.encomenda_id <> NEW.encomenda_id THEN
 UPDATE encomenda
 SET valor = (
 SELECT COALESCE(
 SUM(m.custo + LENGTH(i.frase) * m.valor_letra),
 0.00
 )
 FROM item i
 JOIN placa p ON p.id = i.placa_id
 JOIN material m ON m.id = p.material_id
 WHERE i.encomenda_id = OLD.encomenda_id
 )
 WHERE id = OLD.encomenda_id;
 END IF;

 IF TG_OP = 'DELETE' THEN
 RETURN OLD;
 ELSE
 RETURN NEW;
 END IF;
END;
$$ LANGUAGE plpgsql;
```

fun trigger 2 — registra recebimento quando fecha encomenda

Quando encomenda.situacao() passa de aberta pra Fechada, bota uma linha em
recebimento com:

- snal = 1/2 do valor total -> vence na data encomenda.data
- resto = restante -> vence na data de encomenda.entrega


```sql
CREATE OR REPLACE FUNCTION fun_fechar_encomenda()
RETURNS TRIGGER AS $$
BEGIN
 -- so quando muda de Aberta pra Fechada
 IF NEW.situacao = 'Fechada' AND OLD.situacao = 'Aberta' THEN
 INSERT INTO recebimento (encomenda_id, sinal, data_sinal, restante, data_restante)
 VALUES (
 NEW.id,
 (NEW.valor * 0.50),
 NEW.data,
 (NEW.valor * 0.50),
 NEW.entrega
 );
 END IF;

 RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```
---
triggers

```sql
CREATE TRIGGER trg_fechar_encomenda
 AFTER UPDATE ON encomenda
 FOR EACH ROW
 EXECUTE FUNCTION fun_fechar_encomenda();


CREATE TRIGGER trg_att_valor_enc
 AFTER INSERT OR UPDATE OR DELETE ON item
 FOR EACH ROW
 EXECUTE FUNCTION fun_att_valor_enc();

```
