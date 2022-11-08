-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para maisensina
CREATE DATABASE IF NOT EXISTS `maisensina` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `maisensina`;

-- Copiando estrutura para tabela maisensina.administrativo
CREATE TABLE IF NOT EXISTS `administrativo` (
  `IdAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `IdCargo` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`IdAdmin`),
  KEY `IdCargo` (`IdCargo`),
  KEY `IdEscola` (`IdEscola`),
  CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`),
  CONSTRAINT `administrativo_ibfk_2` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`IdEscola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.administrativo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `RA` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  PRIMARY KEY (`RA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.aluno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.cargo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.certificado
CREATE TABLE IF NOT EXISTS `certificado` (
  `IdCertificado` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCertificado`),
  KEY `IdEmpresa` (`IdEmpresa`),
  KEY `IdProfessor` (`IdProfessor`),
  CONSTRAINT `certificado_ibfk_1` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  CONSTRAINT `certificado_ibfk_2` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.certificado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `certificado` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificado` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.emissao
CREATE TABLE IF NOT EXISTS `emissao` (
  `IdEmissao` int(11) NOT NULL AUTO_INCREMENT,
  `RA` varchar(20) NOT NULL,
  `IdCertificado` int(11) NOT NULL,
  `DataEmissao` date NOT NULL,
  PRIMARY KEY (`IdEmissao`),
  KEY `RA` (`RA`),
  KEY `IdCertificado` (`IdCertificado`),
  CONSTRAINT `emissao_ibfk_1` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`),
  CONSTRAINT `emissao_ibfk_2` FOREIGN KEY (`IdCertificado`) REFERENCES `certificado` (`IdCertificado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.emissao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `emissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `emissao` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `IdEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  PRIMARY KEY (`IdEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.escola
CREATE TABLE IF NOT EXISTS `escola` (
  `IdEscola` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`IdEscola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.escola: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.post
CREATE TABLE IF NOT EXISTS `post` (
  `IdPost` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `DataPost` datetime NOT NULL,
  `Corpo` text NOT NULL,
  `Anexo` varchar(1000) DEFAULT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPost`),
  KEY `IdEmpresa` (`IdEmpresa`),
  KEY `IdProfessor` (`IdProfessor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.post: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.professor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

-- Copiando estrutura para tabela maisensina.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `IdTurma` int(11) NOT NULL AUTO_INCREMENT,
  `Curso` varchar(50) NOT NULL,
  `Semestre` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`IdTurma`),
  KEY `IdEscola` (`IdEscola`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`IdEscola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.turma: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
