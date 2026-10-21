
CREATE DATABASE IF NOT EXISTS mini_saas
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE mini_saas;

CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (nome, descricao, preco)
VALUES
('Notebook', 'Notebook para estudos', 2500.00),
('Mouse', 'Mouse USB', 59.90);
