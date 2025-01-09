
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE IF NOT EXISTS `cadastros` (
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `matricula` bigint NOT NULL,
  `codigoCartao` int NOT NULL,
  `statusCartao` tinyint(1) NOT NULL,
  `id` int NOT NULL,
  `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cadastros` (`nome`, `senha`, `foto`, `email`, `matricula`, `codigoCartao`, `statusCartao`, `id`, `saldo`) VALUES
('Bernardo B. Brando', 'Xyz@2024!', 'foto_url4', 'brando_bern78@email.com', 202478904, 654321, 1, 1, 2.0),
('Ana C. Silva', 'Pass#2023', 'foto_url5', 'ana.c_silva85@email.com', 202145678, 654323, 1, 2, 2.0),
('Carlos R. Souza', 'Secure@45', 'foto_url6', 'carlos.rs88@email.com', 201987654, 654324, 1, 3, 2.0),
('Mariana T. Lima', 'Delta%789', 'foto_url7', 'mari.lima_01@email.com', 201856732, 654325, 1, 4, 2.0),
('Rafael A. Mendes', 'Secure@98', 'foto_url8', 'rafa.mendes45@email.com', 202378905, 654326, 1, 5, 2.0),
('Beatriz F. Costa', 'Pass#777', 'foto_url9', 'bia.costa99@email.com', 202467890, 654327, 1, 6, 2.0);

DROP TABLE IF EXISTS `precadastros`;
CREATE TABLE IF NOT EXISTS `precadastros` (
  `id` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `matricula` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `precadastros` (`id`, `nome`, `senha`, `foto`, `email`, `matricula`) VALUES
(1, 'Lucas Silva', 'senha1234', 'foto_url3', 'lucas.silva@email.com', 201912345),
(2, 'Juliana Costa', 'Juliana@2023', 'foto_url4', 'juliana.costa@email.com', 202023456),
(3, 'Felipe Rocha', 'F@lipe987', 'foto_url5', 'felipe.rocha@email.com', 202134567),
(4, 'Camila Pereira', 'Camila!456', 'foto_url6', 'camila.pereira@email.com', 202245678),
(5, 'Gustavo Almeida', 'Gust@vo2024', 'foto_url7', 'gustavo.almeida@email.com', 202356789),
(6, 'Larissa Martins', 'Lari@1234', 'foto_url8', 'larissa.martins@email.com', 201845678);

DROP TABLE IF EXISTS `historico`;
CREATE TABLE IF NOT EXISTS `historico` (
  `matricula` bigint NOT NULL,
  `valor` int NOT NULL,
  `data` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

