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
	(2, 'fernando@gmail.com', '12345', 'Fernando', 1);

-- Copiando estrutura para tabela maisensina.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `RA` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  `IdTurma` int(11) NOT NULL,
  PRIMARY KEY (`RA`),
  KEY `IdTurma` (`IdTurma`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`IdTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.aluno: ~0 rows (aproximadamente)
INSERT INTO `aluno` (`RA`, `Email`, `Senha`, `Nome`, `DataNasc`, `IdTurma`) VALUES
	('123', 'cvantim@gail.com', '123', 'Caroline', '1999-10-09', 1);

-- Copiando estrutura para tabela maisensina.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.cargo: ~3 rows (aproximadamente)
INSERT INTO `cargo` (`IdCargo`, `Nome`) VALUES
	(1, 'Administracao'),
	(2, 'Professor'),
	(3, 'Estagiario');

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

-- Copiando estrutura para procedure maisensina.mostrarpostadministrativo
DELIMITER //
CREATE PROCEDURE `mostrarpostadministrativo`(IN id INT)
BEGIN
	
	CALL validaautor(id,@autor);

	
	IF @autor = "A"
	THEN
		SELECT v.*,t.curso AS Curso, a.Nome AS Autor FROM vw_postsadm v,turma t,administrativo a WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND a.IdAdministrativo = v.IdAdministrativo;
		
	
	ELSEIF @autor = "E"
	THEN
		SELECT v.*,t.curso AS Curso, e.Nome AS Autor FROM vw_postsemp v,turma t,empresa e WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND e.IdEmpresa = v.IdEmpresa;
		
		
	ELSEIF @autor = "P"
	THEN
		SELECT v.*,t.curso AS Curso, p.Nome AS Autor FROM vw_postsprof v,turma t,professor p WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND p.IdProfessor = v.IdProfessor;
				
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure maisensina.mostrarpostaluno
DELIMITER //
CREATE PROCEDURE `mostrarpostaluno`(IN id INT, IN ida INT)
BEGIN

	CALL selecionaturma(ida,@idt);
	
	CALL validaautor(id,@autor);

	
	IF @autor = "A"
	THEN
		SELECT v.*,t.curso AS Curso, a.Nome AS Autor FROM vw_postsadm v,turma t,administrativo a WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND a.IdAdministrativo = v.IdAdministrativo AND (v.IdTurma = @idt OR v.IdTurma = 0);
		
	
	ELSEIF @autor = "E"
	THEN
		SELECT v.*,t.curso AS Curso, e.Nome AS Autor FROM vw_postsemp v,turma t,empresa e WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND e.IdEmpresa = v.IdEmpresa AND (v.IdTurma = @idt OR v.IdTurma = 0);
		
		
	ELSEIF @autor = "P"
	THEN
		SELECT v.*,t.curso AS Curso, p.Nome AS Autor FROM vw_postsprof v,turma t,professor p WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND p.IdProfessor = v.IdProfessor AND (v.IdTurma = @idt OR v.IdTurma = 0);
				
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure maisensina.mostrarpostempresa
DELIMITER //
CREATE PROCEDURE `mostrarpostempresa`(IN id INT, IN ide INT)
BEGIN
	
	CALL validaautor(id,@autor);
	

	IF @autor = "E"
	THEN
	
		SELECT v.*,t.curso AS Curso, e.Nome AS Autor FROM vw_postsemp v,turma t,empresa e WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND e.IdEmpresa = v.IdEmpresa AND v.IdEmpresa = ide;
		
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure maisensina.mostrarpostprofessor
DELIMITER //
CREATE PROCEDURE `mostrarpostprofessor`(IN id INT, IN idp INT)
BEGIN
	
	CALL validaautor(id,@autor);
	

	IF @autor = "P"
	THEN
	
		SELECT v.*,t.curso AS Curso, p.Nome AS Autor FROM vw_postsprof v,turma t,professor p WHERE v.idPost = id AND t.IdTurma = v.IdTurma AND p.IdProfessor = v.IdProfessor AND v.IdProfessor = idp;
				
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para tabela maisensina.post
CREATE TABLE IF NOT EXISTS `post` (
  `IdPost` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `DataPost` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Corpo` text NOT NULL,
  `Anexo` varchar(1000) DEFAULT NULL,
  `IdTurma` int(11) DEFAULT NULL,
  `IdAdministrativo` int(11) DEFAULT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPost`),
  KEY `IdTurma` (`IdTurma`),
  KEY `IdAdministrativo` (`IdAdministrativo`),
  KEY `IdEmpresa` (`IdEmpresa`),
  KEY `IdProfessor` (`IdProfessor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`IdTurma`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdAdministrativo`) REFERENCES `administrativo` (`IdAdministrativo`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  CONSTRAINT `post_ibfk_4` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.post: ~8 rows (aproximadamente)
INSERT INTO `post` (`IdPost`, `Titulo`, `DataPost`, `Corpo`, `Anexo`, `IdTurma`, `IdAdministrativo`, `IdEmpresa`, `IdProfessor`) VALUES
	(1, 'Matematica', '2022-12-09 05:54:22', 'O logaritmo é uma operação matemática diretamente relacionada com as equações exponenciais. Nele buscamos encontrar o expoente que faz com a base seja igual ao que chamamos de logaritmando.', 'https://docs.google.com/document/d/1GIMJ9XU__LtkYRoi94CND0ULwF4e27ABVOH4aV46W34/edit?usp=sharing', 1, NULL, NULL, 1),
	(2, 'Algebra', '2022-12-09 05:54:25', 'Algebra linear é um ramo da matemática que surgiu do estudo detalhado de sistemas de equações lineares, sejam elas algébricas ou diferenciais.', 'https://docs.google.com/document/d/15Khmg1uX9_Kybyg2-vkK8zNEx9e1D2t_cEKtgaoWA8o/edit', 3, NULL, NULL, 1),
	(3, 'Desenvolvimento Web', '2022-12-09 05:54:27', 'HTML é uma linguagem de marcação utilizada na construção de páginas na Web. Documentos HTML podem ser interpretados por navegadores. A tecnologia é fruto da junção entre os padrões HyTime e SGML. HyTime é um padrão para a representação estruturada de hipermídia e conteúdo baseado em tempo.', 'https://i.imgur.com/TlTlb4B.png', 2, NULL, NULL, 1),
	(4, 'Portugues', '2022-11-22 20:30:41', 'Verbo é a classe gramatical de palavras que normalmente têm significado de ação, estado, mudança de estado ou fenômeno da natureza, e que variam em relação ao tempo. Exemplos: Ele plantou milho em sua fazenda. A professora está satisfeita. A aluna virou professora. Amanhã choverá em minha cidade.', 'https://i.imgur.com/YnU3TMj.png', 1, NULL, NULL, 1),
	(6, 'Anuncio Administracao', '2022-12-09 06:26:15', 'A administracao informa que o site entrara em manutencao Durante o dia 14/09/2022!', 'https://i.imgur.com/n2XT1LF.png', 0, 2, NULL, NULL),
	(7, 'Vaga Auxiliar de Escritorio', '2022-12-09 21:37:00', 'Olá, somos da empresa KABUM COMERCIO ELETRONICO S.A., segue em anexo link com a oportunidade de vaga para estudandes de sua escola.', 'https://www.linkedin.com', 0, NULL, 1, NULL),
	(8, 'Teste', '2022-12-12 00:40:59', 'testando', 'teste.com.br', 0, 2, NULL, NULL),
	(9, 'Teste', '2022-12-12 00:43:24', 'testando', 'teste.com.br', 0, 2, NULL, NULL);

-- Copiando estrutura para procedure maisensina.postseletivo
DELIMITER //
CREATE PROCEDURE `postseletivo`(IN p_titulo VARCHAR(100), IN p_datapost DATETIME, IN p_corpo TEXT, IN p_anexo VARCHAR(1000),IN p_idturma INT, IN tipo CHAR(1),IN id INT)
BEGIN

	IF tipo = "A"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdTurma,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (p_titulo,p_datapost,p_corpo,p_anexo,p_idturma,id,NULL,NULL);
	
	ELSEIF tipo = "E"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdTurma,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (p_titulo,p_datapost,p_corpo,p_anexo,p_idturma,NULL,id,NULL);
		
	ELSEIF tipo = "P"
	THEN
		INSERT INTO post (Titulo,DataPost,Corpo,Anexo,IdTurma,IdAdministrativo,IdEmpresa,IdProfessor) VALUES (p_titulo,p_datapost,p_corpo,p_anexo,p_idturma,NULL,NULL,id);
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

-- Copiando estrutura para procedure maisensina.selecionaturma
DELIMITER //
CREATE PROCEDURE `selecionaturma`(IN id INT, OUT idt INT)
BEGIN
	
	SET idt = (SELECT t.IdTurma FROM turma t, aluno a WHERE t.IdTurma = a.IdTurma AND a.RA = id);

END//
DELIMITER ;

-- Copiando estrutura para tabela maisensina.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `IdTurma` int(11) NOT NULL AUTO_INCREMENT,
  `Curso` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela maisensina.turma: ~5 rows (aproximadamente)
INSERT INTO `turma` (`IdTurma`, `Curso`) VALUES
	(0, 'Geral'),
	(1, 'Ensino Medio'),
	(2, 'Informática'),
	(3, 'Mecânica'),
	(4, 'Química');

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
	
	
	IF (prof IS NOT NULL)
	THEN
		SET resultado = "P";
	END IF;
	
	
	IF (emp IS NOT NULL)
	THEN
		SET resultado = "E";
	END IF;
	
END//
DELIMITER ;

-- Copiando estrutura para view maisensina.vw_postsadm
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vw_postsadm` (
	`IdPost` INT(11) NOT NULL,
	`Titulo` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`DataPost` TIMESTAMP NOT NULL,
	`Corpo` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Anexo` VARCHAR(1000) NULL COLLATE 'utf8mb4_general_ci',
	`IdTurma` INT(11) NULL,
	`IdAdministrativo` INT(11) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view maisensina.vw_postsemp
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vw_postsemp` (
	`IdPost` INT(11) NOT NULL,
	`Titulo` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`DataPost` TIMESTAMP NOT NULL,
	`Corpo` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Anexo` VARCHAR(1000) NULL COLLATE 'utf8mb4_general_ci',
	`IdTurma` INT(11) NULL,
	`IdEmpresa` INT(11) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view maisensina.vw_postsprof
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vw_postsprof` (
	`IdPost` INT(11) NOT NULL,
	`Titulo` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`DataPost` TIMESTAMP NOT NULL,
	`Corpo` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Anexo` VARCHAR(1000) NULL COLLATE 'utf8mb4_general_ci',
	`IdTurma` INT(11) NULL,
	`IdProfessor` INT(11) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view maisensina.vw_postsadm
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vw_postsadm`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_postsadm` AS SELECT IdPost,Titulo,DataPost,Corpo,Anexo,IdTurma,IdAdministrativo FROM post ;

-- Copiando estrutura para view maisensina.vw_postsemp
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vw_postsemp`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_postsemp` AS SELECT IdPost,Titulo,DataPost,Corpo,Anexo,IdTurma,IdEmpresa FROM post ;

-- Copiando estrutura para view maisensina.vw_postsprof
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vw_postsprof`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_postsprof` AS SELECT IdPost,Titulo,DataPost,Corpo,Anexo,IdTurma,IdProfessor FROM post ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
