-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Nov-2022 às 16:50
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maisensina`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrativo`
--

CREATE TABLE `administrativo` (
  `IdAdmin` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `IdCargo` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `ra` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `datanasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`ra`, `email`, `senha`, `nome`, `datanasc`) VALUES
('123', 'cvantim@gail.com', '123', 'Caroline', '1999-10-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `IdCargo` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`IdCargo`, `Nome`) VALUES
(1, 'Professor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `certificado`
--

CREATE TABLE `certificado` (
  `IdCertificado` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emissao`
--

CREATE TABLE `emissao` (
  `IdEmissao` int(11) NOT NULL,
  `RA` varchar(20) NOT NULL,
  `IdCertificado` int(11) NOT NULL,
  `DataEmissao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `IdEmpresa` int(11) NOT NULL,
  `CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`IdEmpresa`, `CNPJ`, `Nome`, `Endereco`, `Email`, `Senha`) VALUES
(1, '05.570.714/000', 'KABUM COMERCIO ELETRONICO S.A.', 'Rua Carlos Gomes, 1321', 'kabum@kabum.com', '123456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escola`
--

CREATE TABLE `escola` (
  `IdEscola` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE `post` (
  `IdPost` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `DataPost` datetime NOT NULL,
  `Corpo` text NOT NULL,
  `Anexo` varchar(1000) DEFAULT NULL,
  `IdEmpresa` int(11) DEFAULT NULL,
  `IdProfessor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `IdProfessor` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  `IdCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`IdProfessor`, `Email`, `Senha`, `Nome`, `DataNasc`, `IdCargo`) VALUES
(1, 'caroline@professora.com', '123mudar', 'Caroline Vantim', '1999-10-09', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `IdTurma` int(11) NOT NULL,
  `Curso` varchar(50) NOT NULL,
  `Semestre` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`, `tipo`) VALUES
(1, 'carolinevantim@gmail.com', '12345', 'Aluno');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`IdAdmin`),
  ADD KEY `IdCargo` (`IdCargo`),
  ADD KEY `IdEscola` (`IdEscola`);

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`ra`);

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IdCargo`);

--
-- Índices para tabela `certificado`
--
ALTER TABLE `certificado`
  ADD PRIMARY KEY (`IdCertificado`),
  ADD KEY `IdEmpresa` (`IdEmpresa`),
  ADD KEY `IdProfessor` (`IdProfessor`);

--
-- Índices para tabela `emissao`
--
ALTER TABLE `emissao`
  ADD PRIMARY KEY (`IdEmissao`),
  ADD KEY `RA` (`RA`),
  ADD KEY `IdCertificado` (`IdCertificado`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`IdEmpresa`);

--
-- Índices para tabela `escola`
--
ALTER TABLE `escola`
  ADD PRIMARY KEY (`IdEscola`);

--
-- Índices para tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`IdPost`),
  ADD KEY `IdEmpresa` (`IdEmpresa`),
  ADD KEY `IdProfessor` (`IdProfessor`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`IdProfessor`),
  ADD KEY `IdCargo` (`IdCargo`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`IdTurma`),
  ADD KEY `IdEscola` (`IdEscola`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrativo`
--
ALTER TABLE `administrativo`
  MODIFY `IdAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IdCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `certificado`
--
ALTER TABLE `certificado`
  MODIFY `IdCertificado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emissao`
--
ALTER TABLE `emissao`
  MODIFY `IdEmissao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `IdEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `escola`
--
ALTER TABLE `escola`
  MODIFY `IdEscola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `post`
  MODIFY `IdPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `IdProfessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `IdTurma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`),
  ADD CONSTRAINT `administrativo_ibfk_2` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`IdEscola`);

--
-- Limitadores para a tabela `certificado`
--
ALTER TABLE `certificado`
  ADD CONSTRAINT `certificado_ibfk_1` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  ADD CONSTRAINT `certificado_ibfk_2` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`);

--
-- Limitadores para a tabela `emissao`
--
ALTER TABLE `emissao`
  ADD CONSTRAINT `emissao_ibfk_1` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`),
  ADD CONSTRAINT `emissao_ibfk_2` FOREIGN KEY (`IdCertificado`) REFERENCES `certificado` (`IdCertificado`);

--
-- Limitadores para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdProfessor`) REFERENCES `professor` (`IdProfessor`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `cargo` (`IdCargo`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`IdEscola`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
