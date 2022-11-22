-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para maisensina
CREATE DATABASE IF NOT EXISTS `maisensina` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `maisensina`;

-- Copiando estrutura para tabela maisensina.administrativo
CREATE TABLE IF NOT EXISTS `administrativo` (
  `IdAdministrativo` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `IdCargo` int(11) NOT NULL,
  PRIMARY KEY (`IdAdministrativo`) USING BTREE,
  KEY `IdCargo` (`IdCargo`),
  CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.administrativo: ~1 rows (aproximadamente)
INSERT INTO `administrativo` (`IdAdministrativo`, `Email`, `Senha`, `Nome`, `IdCargo`) VALUES
	(2, 'fernando@gmail.com', '12345', 'Fernando', 0);

-- Copiando estrutura para tabela maisensina.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `RA` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  PRIMARY KEY (`RA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.aluno: ~1 rows (aproximadamente)
INSERT INTO `aluno` (`RA`, `Email`, `Senha`, `Nome`, `DataNasc`) VALUES
	('123', 'cvantim@gail.com', '123', 'Caroline', '1999-10-09');

-- Copiando estrutura para tabela maisensina.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.cargo: ~2 rows (aproximadamente)
INSERT INTO `cargo` (`IdCargo`, `Nome`) VALUES
	(0, 'Administracao'),
	(1, 'Professor');

-- Copiando estrutura para tabela maisensina.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `IdEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  PRIMARY KEY (`IdEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.empresa: ~1 rows (aproximadamente)
INSERT INTO `empresa` (`IdEmpresa`, `CNPJ`, `Nome`, `Endereco`, `Email`, `Senha`) VALUES
	(1, '05.570.714/000', 'KABUM COMERCIO ELETRONICO S.A.', 'Rua Carlos Gomes, 1321', 'kabum@kabum.com', '123456');

-- Copiando estrutura para tabela maisensina.post
CREATE TABLE IF NOT EXISTS `post` (
  `IdPost` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `DataPost` datetime NOT NULL,
  `Corpo` text NOT NULL,
  `Anexo` varchar(1000) DEFAULT NULL,
  `IdAdministrativo` int(11) DEFAULT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPost`),
  KEY `IdAdministrativo` (`IdAdministrativo`),
  KEY `IdEmpresa` (`IdEmpresa`),
  KEY `IdProfessor` (`IdProfessor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`IdAdministrativo`) REFERENCES `admnistrativo` (`IdAdministrativo`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.post: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela maisensina.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `IdProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  `IdCargo` int(11) NOT NULL,
  PRIMARY KEY (`IdProfessor`),
  KEY `IdCargo` (`IdCargo`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.professor: ~1 rows (aproximadamente)
INSERT INTO `professor` (`IdProfessor`, `Email`, `Senha`, `Nome`, `DataNasc`, `IdCargo`) VALUES
	(1, 'caroline@professora.com', '123mudar', 'Caroline Vantim', '1999-10-09', 1);

-- Copiando estrutura para tabela maisensina.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `IdTurma` int(11) NOT NULL AUTO_INCREMENT,
  `Curso` varchar(50) NOT NULL,
  `Semestre` int(11) NOT NULL,
  PRIMARY KEY (`IdTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.turma: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
