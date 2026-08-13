-- =====================================================
-- PROJETO: SISTEMA DE GERENCIAMENTO DE BIBLIOTECA
-- Banco de Dados: MariaDB / MySQL
-- =====================================================


-- =====================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- =====================================================

CREATE DATABASE biblioteca2;

USE biblioteca2;


-- =====================================================
-- 2. CRIAÇÃO DAS TABELAS INICIAIS
-- =====================================================

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);


-- =====================================================
-- 3. PRIMEIRA VERSÃO DA TABELA LIVRO
-- =====================================================

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(75) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    ano_publicacao INT NULL
);


-- =====================================================
-- 4. EXCLUSÃO DA PRIMEIRA VERSÃO DA TABELA LIVRO
-- Demonstração do comando DROP TABLE
-- =====================================================

DROP TABLE livro;


-- =====================================================
-- 5. CRIAÇÃO DA TABELA LIVRO DEFINITIVA
-- =====================================================

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR,
    isbn VARCHAR(20) UNIQUE,
    id_autor INT,
    id_categoria INT,

    CONSTRAINT fk_livro_autor
        FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor),

    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);


-- =====================================================
-- 6. CRIAÇÃO DA TABELA EMPRESTIMO
-- =====================================================

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL,
    id_usuario INT,
    id_livro INT,

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT fk_emprestimo_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
);


-- =====================================================
-- 7. REGISTRO DE AUTORES
-- =====================================================

INSERT INTO autor
VALUES
(DEFAULT, 'Nicolas Sparks', 'Americano'),
(DEFAULT, 'Isaac Asimov', 'Russo'),
(DEFAULT, 'Stephen King', 'Americano'),
(DEFAULT, 'Agatha Christie', 'Britânica'),
(DEFAULT, 'J.R.R. Tolkien', 'Britânico'),
(DEFAULT, 'Walter Isaacson', 'Britânico'),
(DEFAULT, 'Laurentino Gomes', 'Brasileiro'),
(DEFAULT, 'Augusto Cury', 'Brasileiro'),
(DEFAULT, 'Robert C. Martin', 'Americano'),
(DEFAULT, 'Paulo Freire', 'Brasileiro');


-- =====================================================
-- 8. REGISTRO DE CATEGORIAS
-- =====================================================

INSERT INTO categoria
VALUES
(DEFAULT, 'Romance'),
(DEFAULT, 'Ficção Científica'),
(DEFAULT, 'Terror'),
(DEFAULT, 'Suspense'),
(DEFAULT, 'Fantasia'),
(DEFAULT, 'Biografia'),
(DEFAULT, 'História'),
(DEFAULT, 'Autoajuda'),
(DEFAULT, 'Tecnologia'),
(DEFAULT, 'Educação');


-- =====================================================
-- 9. REGISTRO DE LIVROS
-- =====================================================

INSERT INTO livro
VALUES
(DEFAULT, 'Diário de uma Paixão', 1996, '111111111', 1, 1),
(DEFAULT, 'Eu, Robô', 1950, '222222222', 2, 2),
(DEFAULT, 'It: A Coisa', 1986, '333333333', 3, 3),
(DEFAULT, 'Assassinato no Expresso do Oriente', 1934, '444444444', 4, 4),
(DEFAULT, 'O Hobbit', 1937, '555555555', 5, 5),
(DEFAULT, 'Steve Jobs', 2011, '666666666', 6, 6),
(DEFAULT, '1808', 2007, '777777777', 7, 7),
(DEFAULT, 'O Vendedor de Sonhos', 2008, '888888888', 8, 8),
(DEFAULT, 'Código Limpo', 2008, '999999999', 9, 9),
(DEFAULT, 'Pedagogia do Oprimido', 1968, '101010101', 10, 10);


-- =====================================================
-- 10. ALTERAÇÃO DA TABELA USUARIO
-- Adição do CPF
-- =====================================================

ALTER TABLE usuario
ADD cpf VARCHAR(14) UNIQUE;


-- =====================================================
-- 11. REGISTRO DE USUÁRIOS
-- =====================================================

INSERT INTO usuario
VALUES
(DEFAULT, 'Ana Carolina Lima', 'ana.lima@gmail.com', '21998765432', '123.456.789-10'),
(DEFAULT, 'Bruno Henrique Souza', 'bruno.souza@gmail.com', '21997654321', '234.567.891-21'),
(DEFAULT, 'Camila Ferreira Alves', 'camila.alves@gmail.com', '21996543210', '345.678.912-32'),
(DEFAULT, 'Daniel Martins Costa', 'daniel.costa@gmail.com', '21995432109', '456.789.123-43'),
(DEFAULT, 'Eduarda Rocha Silva', 'eduarda.silva@gmail.com', '21994321098', '567.891.234-54'),
(DEFAULT, 'Felipe Gomes Santos', 'felipe.santos@gmail.com', '21993210987', '678.912.345-65'),
(DEFAULT, 'Gabriela Oliveira', 'gabriela.oliveira@gmail.com', '21992109876', '789.123.456-76'),
(DEFAULT, 'Henrique Barbosa', 'henrique.barbosa@gmail.com', '21991098765', '891.234.567-87'),
(DEFAULT, 'Juliana Mendes', 'juliana.mendes@gmail.com', '21990987654', '912.345.678-98'),
(DEFAULT, 'Lucas Pereira Costa', 'lucas.costa@gmail.com', '21999887766', '102.345.678-99');


-- =====================================================
-- 12. REGISTRO DE EMPRÉSTIMOS
-- =====================================================

INSERT INTO emprestimo
VALUES
(DEFAULT, '2026-05-20', '2026-06-05', 'Devolvido', 1, 1),
(DEFAULT, '2026-05-22', '2026-06-08', 'Atrasado', 2, 2),
(DEFAULT, '2026-05-24', '2026-06-10', 'Em andamento', 3, 3),
(DEFAULT, '2026-05-26', '2026-06-12', 'Devolvido', 4, 4),
(DEFAULT, '2026-05-28', '2026-06-15', 'Atrasado', 5, 5),
(DEFAULT, '2026-05-30', '2026-06-18', 'Em andamento', 6, 6),
(DEFAULT, '2026-06-01', '2026-06-20', 'Devolvido', 7, 7),
(DEFAULT, '2026-06-03', '2026-06-22', 'Em andamento', 8, 8),
(DEFAULT, '2026-06-05', '2026-06-25', 'Atrasado', 9, 9),
(DEFAULT, '2026-06-07', '2026-06-28', 'Devolvido', 10, 10);


-- =====================================================
-- 13. ALTERAÇÕES NA TABELA EMPRESTIMO
-- DECIMAL E DATETIME
-- =====================================================

ALTER TABLE emprestimo
ADD valor_multa DECIMAL(10,2);

ALTER TABLE emprestimo
ADD data_registro DATETIME;


-- Atualização do valor da multa

UPDATE emprestimo
SET valor_multa = 10.00
WHERE id_emprestimo = 9;


-- Atualização da data de registro

UPDATE emprestimo
SET data_registro = '2026-05-05 15:00:00'
WHERE id_emprestimo = 10;


-- =====================================================
-- 14. DISPONIBILIDADE DOS LIVROS
-- BOOLEAN
-- =====================================================

ALTER TABLE livro
ADD disponivel BOOLEAN;

UPDATE livro
SET disponivel =
CASE
    WHEN id_livro IN (1, 4, 7, 10) THEN TRUE
    ELSE FALSE
END;


-- =====================================================
-- 15. CONSULTAS
-- =====================================================


-- WHERE
SELECT *
FROM usuario
WHERE nome = 'Ana Carolina Lima';


-- LIKE
SELECT *
FROM usuario
WHERE nome LIKE 'A%';


-- BETWEEN
SELECT id_livro, titulo, ano_publicacao
FROM livro
WHERE ano_publicacao BETWEEN 1950 AND 2000
ORDER BY ano_publicacao ASC;


-- IN
SELECT id_usuario, nome
FROM usuario
WHERE id_usuario IN (1, 3, 5, 7)
ORDER BY id_usuario ASC;


-- =====================================================
-- 16. JOINS
-- =====================================================


-- USUARIO + EMPRESTIMO

SELECT
    u.nome,
    e.data_emprestimo,
    e.status
FROM usuario u
INNER JOIN emprestimo e
    ON u.id_usuario = e.id_usuario
ORDER BY e.id_emprestimo ASC;


-- LIVRO + EMPRESTIMO

SELECT
    l.titulo,
    e.data_emprestimo,
    e.data_devolucao
FROM livro l
INNER JOIN emprestimo e
    ON l.id_livro = e.id_livro
ORDER BY e.id_emprestimo ASC;


-- LIVRO + AUTOR

SELECT
    l.titulo,
    a.nome AS autor
FROM livro l
INNER JOIN autor a
    ON l.id_autor = a.id_autor
ORDER BY l.id_livro ASC;


-- LIVRO + CATEGORIA

SELECT
    l.titulo,
    c.nome_categoria
FROM livro l
INNER JOIN categoria c
    ON l.id_categoria = c.id_categoria
ORDER BY l.id_livro ASC;


-- =====================================================
-- 17. VISUALIZAÇÃO DA ESTRUTURA FINAL
-- =====================================================

SHOW TABLES;

DESCRIBE livro;
