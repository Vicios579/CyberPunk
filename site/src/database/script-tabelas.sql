-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE cyberpunk;

drop database cyberpunk;

USE cyberpunk;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    genero CHAR (1) NOT NULL
	CONSTRAINT chk_genero
    CHECK (genero IN ('M', 'F')),
    CPF CHAR(12) UNIQUE,
    dtNasc DATE,
    senha VARCHAR(25) NOT NULL
);

INSERT INTO Usuario VALUES 
(DEFAULT, 'Vinicius', 'vinicius.cg@gmailcom', 'M', '458636078-07', '2006-10-02', '123'),
(DEFAULT, 'Maynara', 'may.silva@gmailcom', 'F', '422638437-07', '2004-06-07', '12345');

CREATE TABLE Modificações (
    idModificação INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(45)
);

INSERT INTO Modificações VALUES
(DEFAULT, 'Sandevistan', 'Implante que desacelera o tempo'),
(DEFAULT, 'Mr.Studd', 'Implante do mr.studd');


CREATE TABLE ParteCorpo (
    idParteCorpo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

INSERT INTO ParteCorpo VALUES
(DEFAULT, 'Cabeça'),
(DEFAULT, 'Torso'),
(DEFAULT, 'Braço');

CREATE TABLE EstadoCorpo (
    fkUsuario INT,
    fkParteCorpo INT,
    fkModificação INT,
    estado TINYINT
		CONSTRAINT estao_chk
			CHECK (estado IN ('0', '1')),
    dtModificacao VARCHAR(45),
    PRIMARY KEY (fkUsuario, fkParteCorpo, fkModificação),
    CONSTRAINT fk_estado_usuario
        FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT fk_estado_parte
        FOREIGN KEY (fkParteCorpo) REFERENCES ParteCorpo(idParteCorpo),
    CONSTRAINT fk_estado_modificação
        FOREIGN KEY (fkModificação) REFERENCES Modificações(idModificação)
);

INSERT INTO EstadoCorpo VALUES

(2, 1, 2, 1, DEFAULT),
(2, 2, 1, 1, DEFAULT);

SELECT count(estado) FROM Usuario as u
    JOIN estadoCorpo as e ON e.fkUsuario = u.idUsuario
    WHERE fkusuario = 1
    AND estado = 1;
