


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

(1, 1, 'Proibido Entrar', 1, 2),
(1, 2, 'Saída Emergência', 3, 8),
(2, 3, 'Cuidado Elétrico', 4, 2),
(2, 4, 'Área Restrita', 5, 3),
(3, 5, 'Bem-vindo', 6, 2),
(3, 1, 'Atenção Obra', 1, 4),
(4, 2, 'Proibido Fumar', 3, 2),
(4, 3, 'Silêncio Hospital', 4, 8),
(5, 4, 'Loja Aberta', 7, 2),
(5, 5, 'Use EPI', 1, 6),
(6, 1, 'Recepção', 5, 4),
(6, 2, 'Banheiro Fem.', 6, 2),
(7, 3, 'Banheiro Masc.', 3, 8),
(7, 4, 'Piso Escorregadio', 5, 2),
(8, 5, 'Estacionamento', 1, 3),
(8, 1, 'Proibido Parar', 3, 2),
(9, 2, 'Entrada Proibida', 4, 2),
(9, 3, 'Piso Molhado', 7, 4),
(10, 4, 'Cuidado com o Cão', 1, 6),
(10, 5, 'Velocidade 30 km', 5, 2),
(11, 1, 'Portaria', 6, 2),
(11, 2, 'Segurança 24h', 1, 4),
(11, 3, 'Guarita', 3, 8),
(12, 4, 'Direção Proibida', 4, 2),
(12, 5, 'Pare', 3, 8),
(12, 1, 'Dê a Preferência', 5, 2),
(13, 2, 'Depósito', 1, 3),
(13, 3, 'Almoxarifado', 6, 2),
(13, 4, 'Produção', 4, 8),
(14, 5, 'Escritório', 1, 4),
(14, 1, 'Sala de Reunião', 3, 2),
(14, 2, 'TI', 5, 6),
(15, 3, 'Financeiro', 6, 2),
(15, 4, 'RH', 1, 4),
(15, 5, 'Diretoria', 4, 8),
(16, 1, 'Marketing', 3, 2),
(16, 2, 'Comercial', 7, 4),
(16, 3, 'Logística', 1, 6),
(17, 4, 'Manutenção', 5, 2),
(17, 5, 'Qualidade', 6, 8),
(17, 1, 'Expedição', 3, 4),
(18, 2, 'Controle de Acesso', 1, 2),
(18, 3, 'Câmeras Ativas', 4, 8),
(18, 4, 'Monitorado 24 horas', 3, 2),
(19, 5, 'Saída', 6, 2),
(19, 1, 'Entrada', 1, 4),
(19, 2, 'Carga e Descarga', 5, 3),
(20, 3, 'Refeitório', 7, 2),
(20, 4, 'Vestiário', 6, 8),
(20, 5, 'Emergência', 3, 2);


UPDATE encomenda SET situacao = 'Fechada'
WHERE id IN (1, 2, 5, 6, 9, 13, 17);

