-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/09/2023 às 22:43
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdfilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbator`
--

CREATE TABLE `tbator` (
  `codAtor` int(11) NOT NULL,
  `ator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbator`
--

INSERT INTO `tbator` (`codAtor`, `ator`) VALUES
(1, 'kid trembala'),
(7, 'tom holland');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbatorfilme`
--

CREATE TABLE `tbatorfilme` (
  `codAtorFilme` int(11) NOT NULL,
  `codAtor` int(11) NOT NULL,
  `codFilme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbdiretorfilme`
--

CREATE TABLE `tbdiretorfilme` (
  `codDiretorFilme` int(11) NOT NULL,
  `nomeDiretor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbdiretorfilme`
--

INSERT INTO `tbdiretorfilme` (`codDiretorFilme`, `nomeDiretor`) VALUES
(1, 'jorge');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfilme`
--

CREATE TABLE `tbfilme` (
  `codFilme` int(11) NOT NULL,
  `filme` varchar(50) DEFAULT NULL,
  `codGenero` int(11) NOT NULL,
  `codDiretor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgenerofilme`
--

CREATE TABLE `tbgenerofilme` (
  `codGeneroFilme` int(11) NOT NULL,
  `generoFilme` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbgenerofilme`
--

INSERT INTO `tbgenerofilme` (`codGeneroFilme`, `generoFilme`) VALUES
(1, ''),
(2, 'humor'),
(3, 'Comédia');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbator`
--
ALTER TABLE `tbator`
  ADD PRIMARY KEY (`codAtor`);

--
-- Índices de tabela `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  ADD PRIMARY KEY (`codAtorFilme`),
  ADD KEY `codAtor` (`codAtor`),
  ADD KEY `codFilme` (`codFilme`);

--
-- Índices de tabela `tbdiretorfilme`
--
ALTER TABLE `tbdiretorfilme`
  ADD PRIMARY KEY (`codDiretorFilme`);

--
-- Índices de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD PRIMARY KEY (`codFilme`),
  ADD KEY `codGenero` (`codGenero`),
  ADD KEY `codDiretor` (`codDiretor`);

--
-- Índices de tabela `tbgenerofilme`
--
ALTER TABLE `tbgenerofilme`
  ADD PRIMARY KEY (`codGeneroFilme`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbator`
--
ALTER TABLE `tbator`
  MODIFY `codAtor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  MODIFY `codAtorFilme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbdiretorfilme`
--
ALTER TABLE `tbdiretorfilme`
  MODIFY `codDiretorFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  MODIFY `codFilme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbgenerofilme`
--
ALTER TABLE `tbgenerofilme`
  MODIFY `codGeneroFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbatorfilme`
--
ALTER TABLE `tbatorfilme`
  ADD CONSTRAINT `tbatorfilme_ibfk_1` FOREIGN KEY (`codAtor`) REFERENCES `tbator` (`codAtor`),
  ADD CONSTRAINT `tbatorfilme_ibfk_2` FOREIGN KEY (`codFilme`) REFERENCES `tbfilme` (`codFilme`);

--
-- Restrições para tabelas `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD CONSTRAINT `tbfilme_ibfk_1` FOREIGN KEY (`codGenero`) REFERENCES `tbgenerofilme` (`codGeneroFilme`),
  ADD CONSTRAINT `tbfilme_ibfk_2` FOREIGN KEY (`codDiretor`) REFERENCES `tbdiretorfilme` (`codDiretorFilme`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
