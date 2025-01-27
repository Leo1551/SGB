
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
  `cargo` varchar(6) NOT NULL, 
  `id` int NOT NULL,
  `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cadastros` (`nome`, `senha`, `foto`, `email`, `matricula`, `codigoCartao`, `statusCartao`, `cargo`, `id`, `saldo`) VALUES
('Bernardo B. Brando', 'ad396a29cd7a95297d16e0acf8838130', 'foto_url4', 'macleonardo96@gmail.com', 202478904, 654321, 1, 'gestor', 1, 20.0),
('Ana C. Silva', '42fe18080bcf33f01ec34d7c8ed64568', 'foto_url5', 'ana.c_silva85@email.com', 202145678, 654323, 1,'aluno', 2, 20.0),
('Carlos R. Souza', 'e23c081efbe4610dd72f78d6036ac4cf', 'foto_url6', 'carlos.rs88@email.com', 201987654, 654324, 1,'aluno', 3, 20.0),
('Mariana T. Lima', '3abc2be25b8a208e78b4a5c6b58b07f8', 'foto_url7', 'mari.lima_01@email.com', 201856732, 654325, 1,'aluno', 4, 20.0),
('Rafael A. Mendes', '84ceb47148d1888363c64ab33b8ce3f9', 'foto_url8', 'rafa.mendes45@email.com', 202378905, 654326, 1,'aluno', 5, 20.0),
('Beatriz F. Costa', 'd3a5dc43e0bd0cb8797b1c7d3659d684', 'foto_url9', 'bia.costa99@email.com', 202467890, 654327, 1,'aluno', 6, 20.0),
('teste', '1234', 'foto_urlteste', 'teste@gmail.com', 123456789, 654879, 1, 'aluno', 6, 20.0);

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
  `data` timestamp NOT NULL,
   `funcionario` varchar(60) NOT NULL,
  	`saldo` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `historico` (`matricula`, `valor`, `data`, `funcionario`, `saldo`) VALUES
(20230263912, 1000, '2024-03-15 14:34:22', 'Marcia Almeida Carvalho', 1000),
(20230587943, -320, '2024-04-22 15:05:11', 'João Silva Pereira', 4040),
(20231294856, 8000, '2024-05-12 21:50:43', 'Joana Cabral Orvalho', 10680),
(20230918377, 3000, '2024-06-18 22:00:12', 'Marcia Almeida Carvalho', 3000),
(20230263912, -320, '2024-07-10 15:15:33', 'João Silva Pereira', 680),
(20230918377, -320, '2024-08-21 15:45:56', 'Joana Cabral Orvalho', 2680),
(20231294856, -320, '2024-09-14 14:15:12', 'João Silva Pereira', 10360),
(20230587943, 2000, '2024-10-25 15:27:42', 'Joana Cabral Orvalho', 6040),
(20230263912, -320, '2024-11-19 22:00:00', 'Marcia Almeida Carvalho', 360),
(20230918377, 5000, '2024-12-10 15:35:10', 'João Silva Pereira', 7360),
(20230587943, -320, '2024-12-12 14:22:09', 'Joana Cabral Orvalho', 5720),
(20231294856, -320, '2024-12-15 15:10:22', 'João Silva Pereira', 10040),
(20230587943, -320, '2024-12-20 14:45:35', 'Marcia Almeida Carvalho', 5400),
(20230263912, -320, '2024-12-25 15:30:50', 'Joana Cabral Orvalho', 40),
(20230918377, -320, '2024-12-28 21:55:33', 'João Silva Pereira', 7040),
(20231294856, -320, '2024-12-29 22:00:00', 'Joana Cabral Orvalho', 9720),
(20230587943, -320, '2024-12-30 15:20:11', 'João Silva Pereira', 5080),
(20231294856, -320, '2024-12-31 14:15:33', 'Joana Cabral Orvalho', 9400),
(20230587943, -320, '2025-01-02 15:05:22', 'João Silva Pereira', 4760),
(20230918377, -320, '2025-01-03 21:55:33', 'Marcia Almeida Carvalho', 6720),
(20231294856, -320, '2025-01-04 15:27:11', 'João Silva Pereira', 9080),
(20230587943, -320, '2025-01-05 15:45:22', 'Joana Cabral Orvalho', 4440),
(20230263912, 2000, '2025-01-06 22:00:00', 'Marcia Almeida Carvalho', 2360),
(20231294856, -320, '2025-01-07 14:30:50', 'João Silva Pereira', 8760),
(20230587943, -320, '2025-01-08 15:15:44', 'Joana Cabral Orvalho', 4120),
(20230263912, -320, '2025-01-09 15:35:22', 'João Silva Pereira', 2040),
(20231294856, -320, '2025-01-10 15:25:11', 'Marcia Almeida Carvalho', 8440),
(20230263912, 1000, '2025-01-11 15:55:33', 'João Silva Pereira', 2720),
(20230587943, -320, '2025-01-12 14:45:22', 'Joana Cabral Orvalho', 3800),
(20230918377, -320, '2025-01-13 21:59:12', 'Marcia Almeida Carvalho', 6400),
(20231294856, -320, '2025-01-14 15:35:10', 'João Silva Pereira', 8120),
(20230263912, -320, '2025-01-15 15:45:33', 'Joana Cabral Orvalho', 2400),
(20230587943, -320, '2025-01-16 15:25:11', 'Marcia Almeida Carvalho', 3480),
(20231294856, -320, '2025-01-17 15:50:22', 'João Silva Pereira', 7800),
(20230263912, 1000, '2025-01-18 15:35:33', 'Joana Cabral Orvalho', 3400),
(20230587943, -320, '2025-01-19 14:30:10', 'Marcia Almeida Carvalho', 3160),
(20230918377, -320, '2025-01-20 21:58:20', 'João Silva Pereira', 6080),
(20231294856, -320, '2025-01-21 15:15:11', 'Joana Cabral Orvalho', 7480),
(20230587943, -320, '2025-01-22 15:45:33', 'João Silva Pereira', 2840),
(20230263912, -320, '2025-01-23 15:35:22', 'Marcia Almeida Carvalho', 3080),
(20231294856, -320, '2025-01-24 15:25:44', 'João Silva Pereira', 7160),
(20230918377, 3000, '2025-01-25 21:55:33', 'Joana Cabral Orvalho', 9080),
(20230587943, -320, '2025-01-26 14:45:22', 'Marcia Almeida Carvalho', 2520),
(20230263912, -320, '2025-01-27 15:35:44', 'João Silva Pereira', 2760),
(20231294856, -320, '2025-01-28 15:15:33', 'Joana Cabral Orvalho', 6840),
(20230587943, 2000, '2025-01-29 14:50:12', 'João Silva Pereira', 4520),
(20230587943, -320, '2025-01-14 12:16:08', 'Marco Marcio Luis', 0),
(20230587943, -320, '2025-01-14 12:16:12', 'Marco Marcio Luis', 0),
(20230587943, -320, '2025-01-14 12:16:48', 'Marco Marcio Luis', 0),
(20230587943, -320, '2024-09-15 14:34:22', 'Marco Marcio Luis', 0),
(20230263912, -320, '2024-09-16 00:34:22', 'Marco luis Luis', 100);

DROP TABLE IF EXISTS `cartoes`;
CREATE TABLE IF NOT EXISTS `cartoes` (
    `nome` varchar(60),
    `numero` bigint NOT NULL,
    `validade` timestamp NOT NULL,
    `cvv` int NOT NULL,
    `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `pixInstituicao`;
CREATE TABLE IF NOT EXISTS `pixInstituicao` (
    `id` int NOT NULL,
    `chavePix` varchar(60),
    `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pixInstituicao`(`id`, `chavePix`, `saldo`) VALUES
(1, 'abcde1234', 1000.00);