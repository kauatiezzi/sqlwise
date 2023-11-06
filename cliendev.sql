-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/11/2023 às 23:30
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
-- Banco de dados: `cliendev`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cargo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `ticket_id`, `sender`, `message`, `created_at`, `cargo`) VALUES
(21, 16, 'Kauã Tiezzi', 'Olá, Você poderia verificar se o cabo está conectado a internet?', '2023-09-08 15:45:37', 'Suporte T.I'),
(22, 16, 'João', 'Olá Kauã, está sim!', '2023-09-08 15:46:42', 'Funcionário'),
(23, 16, 'Kauã Tiezzi', 'Ok, daqui 20 minutos irei aí verificar o que está acontecendo.', '2023-09-08 15:47:29', 'Suporte T.I'),
(24, 17, 'Marcio', 'Olá, Você poderia me enviar o extrato do pagamento?', '2023-09-08 15:48:22', 'Suporte Financeiro'),
(25, 17, 'João', 'Olá Marcio, um momento por favor.', '2023-09-08 15:48:42', 'Funcionário'),
(26, 17, 'Marcio', 'Ok.', '2023-09-08 15:48:56', 'Suporte Financeiro'),
(27, 18, 'Adrian', 'Olá, verifique se existe algum tipo de cadeado para acessar esse armário por favor.', '2023-09-08 15:49:41', 'Suporte Manutenção'),
(28, 18, 'João', 'Existe sim Adrian.', '2023-09-08 15:49:56', 'Funcionário'),
(29, 18, 'Adrian', 'Vou encaminhar um chaveiro da equipe ao local, peço que aguarde por favor.', '2023-09-08 15:50:13', 'Suporte Manutenção'),
(30, 20, 'Kauã Tiezzi', 'Olá, qual o problema?', '2023-09-08 17:52:58', 'Suporte T.I'),
(31, 20, 'João', 'Internet', '2023-09-08 17:53:22', 'Funcionário'),
(32, 21, 'João', 'Oi', '2023-09-16 17:27:47', 'Funcionário'),
(33, 16, 'Kauã Tiezzi', 'aaa', '2023-09-16 17:28:57', 'Suporte T.I'),
(34, 21, 'João', 'OLA', '2023-10-06 22:00:41', 'Funcionário'),
(35, 23, 'Kauã Tiezzi', 'OI', '2023-10-20 22:03:17', 'Suporte T.I'),
(36, 24, 'Kauã Tiezzi', 'Oi', '2023-10-20 22:38:39', 'Suporte T.I'),
(37, 24, 'João', 'Oi', '2023-10-20 22:39:07', 'Funcionário'),
(38, 34, 'João', 'Olá, estou apenas testando o chat.', '2023-10-22 22:22:09', 'Funcionário'),
(39, 34, 'Kauã Tiezzi Santos', 'Olá, um funcionário de uma das equipes aqui testando o chat.', '2023-10-22 22:31:14', 'Suporte T.I'),
(40, 34, 'João', 'Olá equipe, tenho um problema.', '2023-10-22 22:33:04', 'Funcionário'),
(42, 36, 'Kauã Tiezzi Santos', 'OI', '2023-10-27 22:13:40', 'Suporte T.I'),
(43, 37, 'João', 'oi', '2023-10-27 22:28:09', 'Funcionário'),
(44, 37, 'Kauã Tiezzi Santos', 'oi', '2023-10-27 22:30:25', 'Suporte T.I');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_user`
--

CREATE TABLE `login_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('A','B','TI','Manutencao','Financeiro') NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `setor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login_user`
--

INSERT INTO `login_user` (`id`, `email`, `password`, `user_type`, `nome`, `cargo`, `setor`) VALUES
(2, 'pedro@wisetech.com', '123', 'B', 'Pedro', 'Gestor', NULL),
(11, 'kauatiezzi@wisetech.com', '123', 'TI', 'Kauã Tiezzi Santos', 'Suporte T.I', 'TI'),
(12, 'mariana@wisetech.com', '123', 'TI', 'Mariana', 'Suporte T.I', 'TI'),
(13, 'patrick@wisetech.com', '123', 'Financeiro', 'Patrick', 'Suporte Financeiro', 'Financeiro'),
(14, 'Thales@wisetech.com', '123', 'Manutencao', 'Thales', 'Suporte Manutenção', 'Manutenção'),
(19, 'joao@wisetech.com', '1234', 'A', 'João', 'Funcionário', 'Funcionário');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `criado_por` int(11) NOT NULL,
  `resposta` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Aberto',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `setor` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status2` varchar(255) DEFAULT 'Aberto',
  `equipe_responsavel` varchar(255) DEFAULT 'Nenhuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tickets`
--

INSERT INTO `tickets` (`id`, `titulo`, `descricao`, `criado_por`, `resposta`, `status`, `data_criacao`, `setor`, `categoria`, `localizacao`, `nome`, `status2`, `equipe_responsavel`) VALUES
(16, 'TESTE TICKET T.I', 'TESTE TICKET T.I', 1, NULL, 'Fechado', '2023-09-08 15:39:47', 'Setor A', 'Categoria 1', 'TESTE TICKET T.I', 'João', 'Fechado', 'TI'),
(17, 'TESTE TICKET FINANCEIRO', 'TESTE TICKET FINANCEIRO', 1, NULL, 'Fechado', '2023-09-08 15:40:04', 'Setor B', 'Categoria 2', 'TESTE TICKET FINANCEIRO', 'João', 'Fechado', 'Financeiro'),
(18, 'TESTE TICKET MANUTENÇÃO', 'TESTE TICKET MANUTENÇÃO', 1, NULL, 'Fechado', '2023-09-08 15:40:22', 'Setor C', 'Categoria 3', 'TESTE TICKET MANUTENÇÃO', 'João', 'Fechado', 'Manutencao'),
(19, 'TESTE', '11', 5, NULL, 'Fechado', '2023-09-08 17:44:43', 'Setor A', 'Categoria 1', '11', 'Adrian', 'Fechado', 'Nenhuma'),
(20, 'TESTE 1', 'TESTE 1', 1, NULL, 'Fechado', '2023-09-08 17:51:15', 'Setor B', 'Categoria 1', 'TESTE 1', 'João', 'Fechado', 'TI'),
(21, 'TESTE', '123', 1, NULL, 'Fechado', '2023-09-16 17:22:09', 'Setor A', 'Categoria 1', '1A', 'João', 'Fechado', 'TI'),
(23, 'OIOI', 'EWRRGMIRE', 1, NULL, 'Fechado', '2023-10-20 22:00:49', 'Setor A', 'Categoria 2', 'EFFE', 'João', 'Fechado', 'TI'),
(24, 'TESTE', '123', 1, NULL, 'Fechado', '2023-10-20 22:34:37', 'Setor A', 'Categoria 3', 'TESTE', 'João', 'Fechado', 'TI'),
(30, 'mbuu', 'klnoijd', 4, NULL, 'Fechado', '2023-10-06 21:59:58', 'Setor A', 'Categoria 1', 'klkj', 'Marcio', 'Fechado', 'TI'),
(33, 'Teste', '123', 19, NULL, 'Fechado', '2023-10-22 16:51:13', 'Setor A', 'Categoria 1', '123', 'João', 'Fechado', 'Nenhuma'),
(34, 'Chamado Teste', 'Testando chamado, sou um usuário normal do sistema.', 19, NULL, 'Fechado', '2023-10-22 22:19:18', 'Setor B', 'Categoria 1', '2ª ANDAR, sala 34.', 'João', 'Fechado', 'TI'),
(36, 'TESTE', '123', 19, NULL, 'Fechado', '2023-10-27 22:11:58', 'Setor A', 'Categoria 1', '123', 'João', 'Fechado', 'TI'),
(37, 'teste123', 'teste', 19, NULL, 'Fechado', '2023-10-27 22:27:29', 'Setor A', 'Categoria 2', 'teste', 'João', 'Fechado', 'TI');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Índices de tabela `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
