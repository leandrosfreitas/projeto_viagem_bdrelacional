-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-146625-db.mariadb-146625:15525
-- Tempo de geração: 27-Set-2023 às 23:58
-- Versão do servidor: 10.5.12-MariaDB-1:10.5.12+maria~bionic
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `viagens`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do destino',
  `descricao` varchar(255) NOT NULL COMMENT 'descricao do produto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(1, 'Praia Boa Viagem', 'Mais popular do Recife'),
(2, 'Praia dos Carneiros', 'Famosa pela igrejinha'),
(3, 'Praia de Porto de Galinhas', 'Favorita pelos turistas'),
(4, 'Praia de Calheitas', 'Atrações radicais');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'referencia ao ID do usuario que fez a reserva',
  `id_destinos` int(11) DEFAULT NULL COMMENT 'referencia ao ID do destino da reserva',
  `data` date DEFAULT NULL COMMENT 'data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'status da reserva(confirmada, pendente, cancelada e etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destinos`, `data`, `status`) VALUES
(1, 1, 1, '2023-09-26', 'pendente'),
(2, 2, 3, '2023-10-15', 'confirmada'),
(3, 4, 2, '2023-12-19', 'confirmada'),
(4, 3, 4, '2024-01-02', 'cancelada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do usuario',
  `email` varchar(255) NOT NULL COMMENT 'endereço de email do usuario',
  `data_nascimento` date NOT NULL COMMENT 'data de nascimento do usuario',
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `data_nascimento`, `rua`, `numero`, `cidade`, `estado`) VALUES
(1, 'Leandro Freitas', 'leandro@mail.com', '1987-06-17', 'Av Paulo Petribu', '700', 'Recife', 'PE'),
(2, 'Lucia Soares', 'lucia@mail.com', '1992-07-03', 'Av Paulo Petribu', '700', 'Recife', 'PE'),
(3, 'Enzo Miguel', 'enzo@mail.com', '2017-12-09', 'Av Paulo Petribu', '700', 'Recife', 'PE'),
(4, 'Jose Antonio', 'joseafreitas@mail.com', '1957-06-22', 'Rua Clotilde Oliveira', '199', 'Recife', 'PE');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservas_usuarios` (`id_usuario`),
  ADD KEY `fk_reservas_destinos` (`id_destinos`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_destinos` FOREIGN KEY (`id_destinos`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
