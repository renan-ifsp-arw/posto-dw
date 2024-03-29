CREATE TABLE cliente (
                         id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         nome VARCHAR(255),
                         documento VARCHAR(14),
                         ativo BOOLEAN NOT NULL DEFAULT TRUE,
                         CONSTRAINT check_documento_length CHECK (CHAR_LENGTH(documento) IN (11, 14))

);

CREATE TABLE funcionario (
                             id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                             nome VARCHAR(255) NOT NULL,
                             cpf VARCHAR(11) NOT NULL,
                             cargo VARCHAR(255) NOT NULL,
                             ativo BOOLEAN NOT NULL DEFAULT TRUE,
                             CONSTRAINT check_cpf_length CHECK (CHAR_LENGTH(cpf) = 11)
);

CREATE TABLE fornecedor (
                            id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            nome VARCHAR(255) NOT NULL,
                            cnpj VARCHAR(14) NOT NULL,
                            ativo BOOLEAN NOT NULL DEFAULT TRUE,
                            CONSTRAINT check_cnpj_length CHECK (CHAR_LENGTH(cnpj) = 14)
);

CREATE TABLE ordem_compra (
                              id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              data_compra DATE NOT NULL,
                              valor_total DECIMAL(10,2) NOT NULL,
                              fornecedor_id BIGINT NOT NULL,
                              produto VARCHAR(255) NOT NULL,
                              descricao VARCHAR(500) NULL,
                              tipo ENUM('COMBUSTIVEL', 'CONVENIENCIA') NOT NULL,  -- Uso de ENUM para restringir os valores
                              ativo BOOLEAN NOT NULL DEFAULT TRUE,
                              FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE venda_conveniencia (
                              id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              data_venda DATE NOT NULL,
                              valor_total DECIMAL(10,2) NOT NULL,
                              cliente_id BIGINT NOT NULL,
                              produto VARCHAR(255) NOT NULL,
                              descricao VARCHAR(500) NULL,
                              ativo BOOLEAN NOT NULL DEFAULT TRUE,
                              FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE bomba (
                       id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       combustivel VARCHAR(255) NOT NULL,
                       preco DECIMAL(10,2) NOT NULL,
                       quantidade_atual DECIMAL(10,2) NOT NULL,
                       capacidade DECIMAL(10,2) NOT NULL,
                       ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE abastecimento (
                               id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                               preco DECIMAL(10,2) NOT NULL,
                               data_venda DATE NOT NULL,
                               quantidade DECIMAL(10,2) NOT NULL,
                               bomba_id BIGINT NOT NULL,
                               cliente_id BIGINT NOT NULL,
                               ativo BOOLEAN NOT NULL DEFAULT TRUE,
                               FOREIGN KEY (bomba_id) REFERENCES bomba(id),
                               FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

