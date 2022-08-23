USE Rodoviaria;
GO

SET IDENTITY_INSERT Empresas ON;
GO

INSERT INTO Empresas(Id, Nome) VALUES(101, 'FLORES');
INSERT INTO Empresas(Id, Nome) VALUES(102, 'REGINAS');
INSERT INTO Empresas(Id, Nome) VALUES(103, 'MASTER');
INSERT INTO Empresas(Id, Nome) VALUES(104, 'RUBANIL');
INSERT INTO Empresas(Id, Nome) VALUES(105, 'REAL');
GO

SET IDENTITY_INSERT Empresas OFF;
GO

SET IDENTITY_INSERT Motoristas ON;
GO

INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(341, 'Paulo Roberto', 35, 'M', 1200);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(342, 'Anderson Moraes', 24, 'M', 1150);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(343, 'Fernando Santana', 28, 'M', 1170);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(344, 'Carlos Paiva', 40, 'M', 1320);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(345, 'Alberto Ara�jo', 25, 'M', 890);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(346, 'Jorge Luiz', 43, 'M', 1400);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(347, 'Maria Padilha', 29, 'F', 900);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(348, 'Claudia da Silva', 32, 'F', 1000);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(349, 'Jeferson Gomes', 30, 'M', 1380);
INSERT INTO Motoristas(Id, Nome, Idade, Sexo, Salario) VALUES(350, 'Felipe Castro', 19, 'M', 650);
GO

SET IDENTITY_INSERT Motoristas OFF;
GO

SET IDENTITY_INSERT Onibus ON;
GO

INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(2451, 101, 341, 'Nova Igua�u x Caxias');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(2452, 101, 342, 'S�o Jo�o X Pra�a XV');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(2453, 101, 343, 'Mesquita X Pra�a Mau�');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(4213, 102, 344, 'Pavuna X Castelo');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(4214, 102, 345, 'Nova Igua�u X Pavuna');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(4215, 102, 346, 'Caxias X S�o Jo�o');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(4216, 102, 347, 'Nil�polis X Caxias');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(5987, 103, 348, 'Queimados X Pavuna');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(5988, 103, 349, 'Campo Grande X Caxias');
INSERT INTO Onibus(Id, EmpresaId, MotoristaId, Trajeto) VALUES(1702, 104, 350, 'S�o Jo�o X Itagua�');
GO

SET IDENTITY_INSERT Onibus OFF;
GO
