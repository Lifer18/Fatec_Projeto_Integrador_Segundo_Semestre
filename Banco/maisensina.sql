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

-- Copiando dados para a tabela maisensina.administrativo: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela maisensina.aluno: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela maisensina.empresa: ~0 rows (aproximadamente)
INSERT INTO `empresa` (`IdEmpresa`, `CNPJ`, `Nome`, `Endereco`, `Email`, `Senha`) VALUES
	(1, '05.570.714/000', 'KABUM COMERCIO ELETRONICO S.A.', 'Rua Carlos Gomes, 1321', 'kabum@kabum.com', '123456');

-- Copiando estrutura para procedure maisensina.mostrarpost
DELIMITER //
CREATE PROCEDURE `mostrarpost`(IN id INT)
BEGIN
	
	CALL validaautor(id,@autor);

	
	IF @autor = "A"
	THEN
		SELECT v.*,a.Nome AS Autor FROM administrativo a,vw_posts v WHERE v.idPost = id;
		
	
	ELSEIF @autor = "E"
	THEN
		SELECT v.*,e.Nome AS Autor FROM empresa e,vw_posts v WHERE v.idPost = id;
		
		
	ELSEIF @autor = "P"
	THEN
		SELECT v.*,p.Nome AS Autor FROM professor p,vw_posts v WHERE v.idPost = id;
				
	END IF;
	
END//
DELIMITER ;

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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`IdAdministrativo`) REFERENCES `administrativo` (`IdAdministrativo`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.post: ~2 rows (aproximadamente)
INSERT INTO `post` (`IdPost`, `Titulo`, `DataPost`, `Corpo`, `Anexo`, `IdAdministrativo`, `IdEmpresa`, `IdProfessor`) VALUES
	(4, 'Teste', '2022-11-22 20:30:41', 'Este é um teste, esta sendo testado um teste testador', 'https://images.easytechjunkie.com/green-lit-numbers.jpg', 2, NULL, NULL),
	(5, 'Teste', '2022-11-22 20:30:41', 'Este é um teste, esta sendo testado um teste testador', 'https://images.easytechjunkie.com/green-lit-numbers.jpg', NULL, NULL, 1);

-- Copiando estrutura para procedure maisensina.postseletivo
DELIMITER //
CREATE PROCEDURE `postseletivo`(IN titulo VARCHAR(100), IN datapost DATETIME, IN corpo TEXT, IN anexo VARCHAR(1000), IN tipo CHAR(1),IN id INT)
BEGIN

	IF tipo = "A"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (titulo,datapost,corpo,anexo,id,NULL,NULL);
	
	ELSEIF tipo = "E"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (titulo,datapost,corpo,anexo,NULL,id,NULL);
		
	ELSEIF tipo = "P"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (titulo,datapost,corpo,anexo,NULL,NULL,id);
	END IF;
END//
DELIMITER ;

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

-- Copiando dados para a tabela maisensina.professor: ~0 rows (aproximadamente)
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

-- Copiando estrutura para procedure maisensina.validaautor
DELIMITER //
CREATE PROCEDURE `validaautor`(IN id INT, OUT resultado CHAR)
BEGIN
	
	DECLARE adm INT;
	DECLARE emp INT;
	DECLARE prof INT;

	SET adm = (SELECT IdAdministrativo FROM post WHERE IdPost = id);
	SET emp = (SELECT IdEmpresa FROM post WHERE IdPost = id);
	SET prof = (SELECT IdProfessor FROM post WHERE IdPost = id);
	
	IF (adm IS NOT NULL)
	THEN
		SET resultado = "A";
	END IF;	
	
	IF (emp IS NOT NULL)
	THEN
		SET resultado = "E";
	END IF;
	
	
	IF (prof IS NOT NULL)
	THEN
		SET resultado = "P";
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para view maisensina.vw_posts
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vw_posts` (
	`IdPost` INT(11) NOT NULL,
	`Titulo` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`DataPost` DATETIME NOT NULL,
	`Corpo` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Anexo` VARCHAR(1000) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view maisensina.vw_posts
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vw_posts`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_posts` AS SELECT IdPost,Titulo,DataPost,Corpo,Anexo FROM post ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
