-- Active: 1723869495017@@127.0.0.1@3306
CREATE DATABASE Patentess
    DEFAULT CHARACTER SET = 'utf8mb4';
    USE Patentess

  
CREATE TABLE Patentes (
    id_patente INT PRIMARY KEY,
    numero_patente INT,
    nombre_invento VARCHAR(25)
);


CREATE TABLE Inventores (
    id_inventor INT PRIMARY KEY,
    nombre VARCHAR(25),
    dni VARCHAR(9),
    direccion VARCHAR(25),
    telefono VARCHAR(15)
);


CREATE TABLE Ayudantes (
    id_ayudante INT PRIMARY KEY,
    nombre VARCHAR(25),
    dni VARCHAR(9),
    direccion VARCHAR(25),
    telefono VARCHAR(15),
    id_inventor INT,
    FOREIGN KEY (id_inventor) REFERENCES Inventores(id_inventor)
);


CREATE TABLE Empresas (
    id_empresa INT PRIMARY KEY,
    codigo_empresa VARCHAR(10),
    nombre VARCHAR(25),
    direccion VARCHAR(25),
    telefono VARCHAR(15)
);


CREATE TABLE CompraPatentes (
    id_compra INT PRIMARY KEY,
    id_patente INT,
    id_empresa INT,
    fecha_compra DATE,
    FOREIGN KEY (id_patente) REFERENCES Patentes(id_patente),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);


CREATE TABLE Contratos (
    id_contrato INT PRIMARY KEY,
    id_inventor INT,
    id_empresa INT,
    fecha_contrato DATE,
    FOREIGN KEY (id_inventor) REFERENCES Inventores(id_inventor),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

CREATE TABLE ContratosAyudantes (
    id_contrato_ayudante INT PRIMARY KEY,
    id_ayudante INT,
    id_empresa INT,
    fecha_contrato DATE,
    FOREIGN KEY (id_ayudante) REFERENCES Ayudantes(id_ayudante),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);


ALTER TABLE Ayudantes
ADD CONSTRAINT fk_ayudantes_inventores
FOREIGN KEY (id_inventor) REFERENCES Inventores(id_inventor);


ALTER TABLE CompraPatentes
ADD CONSTRAINT fk_comprapatentes_patentes
FOREIGN KEY (id_patente) REFERENCES Patentes(id_patente);

ALTER TABLE CompraPatentes
ADD CONSTRAINT fk_comprapatentes_empresas
FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa);


ALTER TABLE Contratos
ADD CONSTRAINT fk_contratos_inventores
FOREIGN KEY (id_inventor) REFERENCES Inventores(id_inventor);

ALTER TABLE Contratos
ADD CONSTRAINT fk_contratos_empresas
FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa);


ALTER TABLE ContratosAyudantes
ADD CONSTRAINT fk_contratosayudantes_ayudantes
FOREIGN KEY (id_ayudante) REFERENCES Ayudantes(id_ayudante);

ALTER TABLE ContratosAyudantes
ADD CONSTRAINT fk_contratosayudantes_empresas
FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa);
INSERT INTO Patentes (id_patente, numero_patente, nombre_invento) VALUES
(1, 12345, 'Invento 1'),
(2, 67890, 'Invento 2'),
(3, 34567, 'Invento 3'),
(4, 90123, 'Invento 4'),
(5, 45678, 'Invento 5');
INSERT INTO Inventores (id_inventor, nombre, dni, direccion, telefono) VALUES
(1, 'Juan Pérez', '12345678A', 'Calle 1', '912345678'),
(2, 'María García', '98765432B', 'Calle 2', '965432109'),
(3, 'Pedro Sánchez', '56789012C', 'Calle 3', '923456789'),
(4, 'Ana López', '34567890D', 'Calle 4', '954321098'),
(5, 'Luis Martínez', '23456789E', 'Calle 5', '987654321');

INSERT INTO Empresas (id_empresa, codigo_empresa, nombre, direccion, telefono) VALUES
(1, 'EMP001', 'Empresa 1', 'Calle 1', '912345678'),
(2, 'EMP002', 'Empresa 2', 'Calle 2', '965432109'),
(3, 'EMP003', 'Empresa 3', 'Calle 3', '923456789'),
(4, 'EMP004', 'Empresa 4', 'Calle 4', '954321098'),
(5, 'EMP005', 'Empresa 5', 'Calle 5', '987654321');


INSERT INTO CompraPatentes (id_compra, id_patente, id_empresa, fecha_compra) VALUES
(1, 1, 1, '2022-01-01'),
(2, 2, 2, '2022-02-01'),
(3, 3, 3, '2022-03-01'),
(4, 4, 4, '2022-04-01'),
(5, 5, 5, '2022-05-01');
