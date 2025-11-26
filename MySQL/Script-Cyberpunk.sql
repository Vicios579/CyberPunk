DROP DATABASE cyberpunk;

CREATE DATABASE cyberpunk;

USE cyberpunk;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    genero CHAR (1) NOT NULL
	CONSTRAINT chk_genero
    CHECK (genero IN ('M', 'F')),
    CPF VARCHAR(15) UNIQUE,
    dtNasc DATE,
    senha VARCHAR(25) NOT NULL
);

CREATE TABLE Modificacoes (
    idModificacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    categoria VARCHAR(45),
    descricao VARCHAR(100),
    preco VARCHAR(7),
    localizacao VARCHAR(45),
    fabricante VARCHAR(45),
    condicao VARCHAR(45)
);

CREATE TABLE ParteCorpo (
    idParteCorpo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE EstadoCorpo (
    fkUsuario INT,
    fkParteCorpo INT,
    fkModificacao INT,
    estado TINYINT
        CONSTRAINT estado_chk CHECK (estado IN ('0', '1')),
    dtModificacao VARCHAR(45),
    PRIMARY KEY (fkUsuario, fkParteCorpo, fkModificacao),
    CONSTRAINT fk_estado_usuario
        FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT fk_estado_parte
        FOREIGN KEY (fkParteCorpo) REFERENCES ParteCorpo(idParteCorpo),
    CONSTRAINT fk_estado_modificacao
        FOREIGN KEY (fkModificacao) REFERENCES Modificacoes(idModificacao)
);

INSERT INTO Usuario VALUES 
(DEFAULT, 'a', 'a', 'M', '000.000.000-00', '2000-01-01', 'a');

INSERT INTO Modificacoes VALUES
(DEFAULT, 'Orgânico', null, null, null, null, null, null),
(DEFAULT, 'Sandevistan', 'Neuralware', 'Implante que aumenta a percepção do usuário, deixando o tempo mais devagar', 9999, 'Sistema Nervoso Central', 'Arasaka', 98),
(DEFAULT, 'Skin Watch', 'Fashionware', 'Relógio LED implantado subdermalmente', 1500, 'Antebraço', 'Arasaka', 100),
(DEFAULT, 'Shift Tacts', 'Fashionware', 'Implantes de lentes coloridas nos olhos', 1000, 'Olhos', 'Arasaka', 100),
(DEFAULT, 'Gorilla Arms', 'CyberLimbs', 'Braços robóticos que exercem grande força', 5000, 'Braços', 'Arasaka', 80),
(DEFAULT, 'Lança-Granadas Retrátil', 'CyberLimbs', 'Arma de longa distância retrátil com alto potêncial explosivo', 4000, 'Antebraço', 'Militech', 95),
(DEFAULT, 'Cybersnake', 'Internal Cyberware', 'Tentáculo instalado no esôfago que pode ser usado como arma de curta distância', 8000, 'Pescoço', 'Militech', 90),
(DEFAULT, 'Mr.Studd Sexual Implant', 'Internal Cyberware', 'A noite toda, toda noite, eles nunca saberão', 4000, 'Virilha', 'Arasaka', 69),
(DEFAULT, 'David´s Kebab Machine', 'Internal Cyberware', 'Aparelho culinário de cunho humorístico', 4000, 'Abdômem', 'Arasaka', 67),
(DEFAULT, 'Grandes Punhos', 'CyberLimbs', 'Punhos robóticos', 4000, 'Mãos', 'Militech', 67),
(DEFAULT, 'Second Heart', 'Internal Cyberware', 'Dispositivo de auxilio a cicatrização de ferimentos', 7500, 'Peito', 'Arasaka', 100),
(DEFAULT, 'Skate Feet', 'CyberLimbs', 'Dispositivo de auxilio a cicatrização de ferimentos', 3000, 'Peito', 'Arasaka', 90),
(DEFAULT, 'Jump Booster', 'CyberLimbs', 'Sistema hidráulico que gera extrema força nas perna', 4000, 'Coxas', 'Arasaka', 88);

INSERT INTO ParteCorpo VALUES
(DEFAULT, 'head'),
(DEFAULT, 'neck'),
(DEFAULT, 'right-chest'),
(DEFAULT, 'left-chest'),
(DEFAULT, 'right-rib'),
(DEFAULT, 'left-rib'),
(DEFAULT, 'right-biceps'),
(DEFAULT, 'left-biceps'),
(DEFAULT, 'right-forearm'),
(DEFAULT, 'left-forearm'),
(DEFAULT, 'right-hand'),
(DEFAULT, 'abdomen'),
(DEFAULT, 'groin'),
(DEFAULT, 'right-thigh'),
(DEFAULT, 'left-thigh'),
(DEFAULT, 'right-calf'),
(DEFAULT, 'left-calf'),
(DEFAULT, 'right-foot'),
(DEFAULT, 'left-foot');

INSERT INTO EstadoCorpo VALUES
(1, 1, 1, 0, null),
(1, 2, 1, 0, null),
(1, 3, 1, 0, null),
(1, 4, 1, 0, null),
(1, 5, 1, 0, null),
(1, 6, 1, 0, null),
(1, 7, 1, 0, null),
(1, 8, 1, 0, null),
(1, 9, 1, 0, null),
(1, 10, 1, 0, null),
(1, 11, 1, 0, null),
(1, 12, 1, 0, null),
(1, 13, 1, 0, null),
(1, 14, 1, 0, null),
(1, 15, 1, 0, null),
(1, 16, 1, 0, null),
(1, 17, 1, 0, null),
(1, 18, 1, 0, null),
(1, 19, 1, 0, null);




