
CREATE TYPE tipo_contato AS ENUM ('email', 'telefone', 'celular', 'whatsapp');

CREATE TABLE cliente (
 id SERIAL PRIMARY KEY,
 cpf CHAR(11) NOT NULL,
 nome VARCHAR(50) NOT NULL
);

CREATE TABLE cor (
 id SERIAL PRIMARY KEY,
 descricao VARCHAR(20) NOT NULL,
 fundo BOOLEAN NOT NULL,
 frase BOOLEAN NOT NULL
);

CREATE TABLE material (
 id SERIAL PRIMARY KEY,
 descricao VARCHAR(20) NOT NULL,
 valor_letra DECIMAL(10,2) NOT NULL,
 custo DECIMAL(10,2) NOT NULL
);

CREATE TABLE desconto (
 id SERIAL PRIMARY KEY,
 valor_minimo DECIMAL(10,2) NOT NULL,
 valor_maximo DECIMAL(10,2) NOT NULL,
 percentual DECIMAL(5,2) NOT NULL
);

CREATE TABLE contato (
 id SERIAL PRIMARY KEY,
 cliente_id INTEGER NOT NULL,
 tipo tipo_contato NOT NULL,
 informacao VARCHAR(50) NOT NULL,
 CONSTRAINT fk_contato_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE placa (
 id SERIAL PRIMARY KEY,
 largura INTEGER NOT NULL,
 altura INTEGER NOT NULL,
 material_id INTEGER NOT NULL,
 CONSTRAINT fk_placa_material FOREIGN KEY (material_id) REFERENCES material(id)
);

CREATE TABLE encomenda (
 id SERIAL PRIMARY KEY,
 data TIMESTAMP NOT NULL,
 entrega TIMESTAMP NOT NULL,
 cliente_id INTEGER NOT NULL,
 desconto_id INTEGER NOT NULL,
 CONSTRAINT fk_encomenda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
 CONSTRAINT fk_encomenda_desconto FOREIGN KEY (desconto_id) REFERENCES desconto(id)
);

CREATE TABLE item (
 id SERIAL PRIMARY KEY,
 encomenda_id INTEGER NOT NULL,
 placa_id INTEGER NOT NULL,
 frase VARCHAR(50) NOT NULL,
 cor_fundo_id INTEGER NOT NULL,
 cor_frase_id INTEGER NOT NULL,
 CONSTRAINT fk_item_encomenda FOREIGN KEY (encomenda_id) REFERENCES encomenda(id),
 CONSTRAINT fk_item_placa FOREIGN KEY (placa_id) REFERENCES placa(id),
 CONSTRAINT fk_item_cor_fundo FOREIGN KEY (cor_fundo_id) REFERENCES cor(id),
 CONSTRAINT fk_item_cor_frase FOREIGN KEY (cor_frase_id) REFERENCES cor(id)
);
