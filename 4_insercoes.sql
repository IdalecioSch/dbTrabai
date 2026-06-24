


INSERT INTO cliente (cpf, nome) VALUES
 ('11122233344', 'Marco Aurelio'),
 ('22233344455', 'Fernando Bastos'),
 ('33344455566', 'Fabiano Gabardo'),
 ('44455566677', 'Jullian Hermann'),
 ('55566677788', 'Cleber Nardelli');





INSERT INTO material (descricao, valor_letra, custo) VALUES
 ('Aluminio', 2.50, 15.00),
 ('Plutonio', 1.50, 8.00),
 ('Acrilico', 3.00, 20.00);



INSERT INTO placa (largura, altura, material_id) VALUES
 (20, 10, 1), -- Aluminio
 (30, 15, 2), -- Plutonio
 (40, 20, 3), -- Acrilico
 (25, 12, 1), -- Aluminio
 (35, 18, 2); -- Plutonio




INSERT INTO cor (descricao, fundo, frase) VALUES
 ('Branco', TRUE, FALSE),
 ('Preto', FALSE, TRUE),
 ('Vermelho', TRUE, TRUE),
 ('Azul', TRUE, TRUE),
 ('Amarelo', TRUE, FALSE),
 ('Verde', TRUE, TRUE),
 ('Laranja', TRUE, FALSE),
 ('Cinza', FALSE, TRUE);





INSERT INTO encomenda (data, entrega, cliente_id, valor, situacao) VALUES
-- Marco Aurelio
('2026-01-10 09:00', '2026-01-20 18:00', 1, 0.00, 'Aberta'),
('2026-02-05 10:00', '2026-02-15 18:00', 1, 0.00, 'Aberta'),
('2026-03-12 11:00', '2026-03-22 18:00', 1, 0.00, 'Aberta'),
('2026-04-18 14:00', '2026-04-28 18:00', 1, 0.00, 'Aberta'),
-- Fernando Bastos
('2026-01-15 09:30', '2026-01-25 18:00', 2, 0.00, 'Aberta'),
('2026-02-20 10:30', '2026-03-02 18:00', 2, 0.00, 'Aberta'),
('2026-03-25 11:30', '2026-04-04 18:00', 2, 0.00, 'Aberta'),
('2026-04-30 14:30', '2026-05-10 18:00', 2, 0.00, 'Aberta'),
-- Fabiano Gabardo
('2026-01-20 08:00', '2026-01-30 18:00', 3, 0.00, 'Aberta'),
('2026-02-25 09:00', '2026-03-07 18:00', 3, 0.00, 'Aberta'),
('2026-03-30 10:00', '2026-04-09 18:00', 3, 0.00, 'Aberta'),
('2026-05-05 15:00', '2026-05-15 18:00', 3, 0.00, 'Aberta'),
-- Jullian Hermann
('2026-01-25 09:00', '2026-02-04 18:00', 4, 0.00, 'Aberta'),
('2026-02-28 10:00', '2026-03-10 18:00', 4, 0.00, 'Aberta'),
('2026-04-02 11:00', '2026-04-12 18:00', 4, 0.00, 'Aberta'),
('2026-05-08 14:00', '2026-05-18 18:00', 4, 0.00, 'Aberta'),
-- Cleber Nardelli
('2026-02-01 08:30', '2026-02-11 18:00', 5, 0.00, 'Aberta'),
('2026-03-07 09:30', '2026-03-17 18:00', 5, 0.00, 'Aberta'),
('2026-04-10 10:30', '2026-04-20 18:00', 5, 0.00, 'Aberta'),
('2026-05-15 15:30', '2026-05-25 18:00', 5, 0.00, 'Aberta');




INSERT INTO item (encomenda_id, placa_id, frase, cor_fundo_id, cor_frase_id) VALUES
(1, 1, 'Chefe Olhando', 1, 2),
(1, 2, 'Saida dos Corajosos', 3, 8),
(2, 3, 'Tomada Brava', 4, 2),
(2, 4, 'Area do Cafezinho', 5, 3),
(3, 5, 'Entre Por Sua Conta', 6, 2),
(3, 1, 'Obra Sem Previsao', 1, 4),
(4, 2, 'Finge Que Nao Viu', 3, 2),
(4, 3, 'Silencio Ou Eu Acordo', 4, 8),
(5, 4, 'Vendemos Sonhos', 7, 2),
(5, 5, 'EPI Ou Vai Doer', 1, 6),
(6, 1, 'Sorria Tem Câmera', 5, 4),
(6, 2, 'Ocupado (Mentira)', 6, 2),
(7, 3, 'Banheiro dos Machos', 3, 8),
(7, 4, 'Chão Traiçoeiro', 5, 2),
(8, 5, 'Vaga do Chefe', 1, 3),
(8, 1, 'Estaciona Nem 1 Min', 3, 2),
(9, 2, 'Só Entra Com Coragem', 4, 2),
(9, 3, 'Chão Quebradico', 7, 4),
(10, 4, 'Cachorro Filosofo', 1, 6),
(10, 5, 'Meta de Hoje', 5, 2),
(11, 1, 'Guarita Chique', 6, 2),
(11, 2, 'Segurança Cochilando', 1, 4),
(11, 3, 'Guarita 2.0', 3, 8),
(12, 4, 'Nem Tenta', 4, 2),
(12, 5, 'Pare e Pense na Vida', 3, 8),
(12, 1, 'Boa Sorte Mesmo', 5, 2),
(13, 2, 'Deposito de Sonhos', 1, 3),
(13, 3, 'Tem De Tudo (Menos o Que Quer)', 6, 2),
(13, 4, 'Aqui Acontece (as Vezes)', 4, 8),
(14, 5, 'Aqui Ninguem Trabalha', 1, 4),
(14, 1, 'Reuniao Que Nunca Acaba', 3, 2),
(14, 2, 'TI: Concerto de Impressoras', 5, 6),
(15, 3, 'Só Débito', 6, 2),
(15, 4, 'RH: Boa Sorte', 1, 4),
(15, 5, 'Ta Frio Aqui Dentro', 4, 8),
(16, 1, 'Criatividade em Obras', 3, 2),
(16, 2, 'Meta Quase Batendo', 7, 4),
(16, 3, 'Culpa da Logistica', 1, 6),
(17, 4, 'Chama Na Segunda', 5, 2),
(17, 5, 'Isso Serve', 6, 8),
(17, 1, 'Sumiu Mas Saiu', 3, 4),
(18, 2, 'Biometria do Chefe', 1, 2),
(18, 3, 'Camera Fingindo', 4, 8),
(18, 4, 'Talvez Monitorado', 3, 2),
(19, 5, 'Boa Sorte na Saida', 6, 2),
(19, 1, 'Entra Quem Tem Fe', 1, 4),
(19, 2, 'Deixa Aqui e Some', 5, 3),
(20, 3, 'Comida Misteriosa', 7, 2),
(20, 4, 'Cheiro de Outros', 6, 8),
(20, 5, 'Corre Que É Emergencia', 3, 2);

UPDATE encomenda SET situacao = 'Fechada'
WHERE id IN (1, 2, 5, 6, 9, 13, 17);

