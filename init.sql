CREATE TABLE `Clientes` (
    `ClienteId` int AUTO_INCREMENT NOT NULL ,
    `RazaoSocial` varchar(255)  NOT NULL ,
    `Email` varchar(255)  NOT NULL ,
    `CodigoEstado` int  NOT NULL ,
    PRIMARY KEY (
        `ClienteId`
    )
);

CREATE TABLE `Estados` (
    `EstadoId` int AUTO_INCREMENT NOT NULL ,
    `NomeEstado` varchar(100)  NOT NULL ,
    `CodigoEstado` varchar(2)  NOT NULL ,
    PRIMARY KEY (
        `EstadoId`
    ),
    CONSTRAINT `uc_Estados_CodigoEstado` UNIQUE (
        `CodigoEstado`
    )
);

CREATE TABLE `Telefones` (
    `Id` int AUTO_INCREMENT NOT NULL ,
    `ClienteId` int  NOT NULL ,
    `NumeroTelefone` varchar(11)  NOT NULL ,
    `TipoTelefone` varchar(100)  NOT NULL ,
    PRIMARY KEY (
        `Id`
    )
);

ALTER TABLE `Clientes` ADD CONSTRAINT `fk_Clientes_CodigoEstado` FOREIGN KEY(`CodigoEstado`)
REFERENCES `Estados` (`EstadoId`);

ALTER TABLE `Telefones` ADD CONSTRAINT `fk_Telefones_ClienteId` FOREIGN KEY(`ClienteId`)
REFERENCES `Clientes` (`ClienteId`);


INSERT INTO `Estados` (`EstadoId`, `NomeEstado`, `CodigoEstado`) VALUES
(1, 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Minas Gerais', 'MG'),
(4, 'Bahia', 'BA');


INSERT INTO `Clientes` (`ClienteId`, `RazaoSocial`, `Email`, `CodigoEstado`) VALUES
(1, 'Empresa ABC Ltda', 'contato@empresaabc.com.br', 1),
(2, 'Comércio XYZ S/A', 'vendas@comercioxyz.com.br', 2),
(3, 'Indústria JKL Eireli', 'suporte@industriajkl.com.br', 3),
(4, 'Serviços QRS ME', 'info@servicosqrs.com.br', 4);

INSERT INTO `Telefones` (`Id`, `ClienteId`, `NumeroTelefone`, `TipoTelefone`) VALUES
(1, 1, '11987654321', 'Comercial'),
(2, 1, '11987654322', 'Residencial'),
(3, 1, '11987654323', 'Celular'),
(4, 2, '21987654321', 'Comercial'),
(5, 2, '21987654322', 'Residencial'),
(6, 2, '21987654323', 'Celular'),
(7, 3, '31987654321', 'Comercial'),
(8, 3, '31987654322', 'Residencial'),
(9, 3, '31987654323', 'Celular'),
(10, 4, '71987654321', 'Comercial'),
(11, 4, '71987654322', 'Residencial'),
(12, 4, '71987654323', 'Celular');