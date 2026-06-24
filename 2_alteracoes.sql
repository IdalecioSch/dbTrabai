
ALTER TABLE encomenda
 ADD COLUMN valor DECIMAL(10,2) NOT NULL DEFAULT 0.00;


CREATE TABLE recebimento (
 id SERIAL PRIMARY KEY,
 encomenda_id INTEGER NOT NULL,
 sinal DECIMAL(10,2) NOT NULL,
 data_sinal TIMESTAMP NOT NULL,
 restante DECIMAL(10,2) NOT NULL,
 data_restante TIMESTAMP NOT NULL,
 CONSTRAINT fk_recebimento_encomenda
 FOREIGN KEY (encomenda_id) REFERENCES encomenda(id)
);


ALTER TABLE encomenda
 DROP CONSTRAINT fk_encomenda_desconto;

ALTER TABLE encomenda
 DROP COLUMN desconto_id;

DROP TABLE desconto;



ALTER TABLE encomenda
 ADD COLUMN situacao VARCHAR(10) NOT NULL DEFAULT 'Aberta'
 CONSTRAINT chk_encomenda_situacao CHECK (situacao IN ('Aberta', 'Fechada'));

