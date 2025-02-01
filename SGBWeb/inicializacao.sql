SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE IF NOT EXISTS `cadastros` (
  `id` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `matricula` bigint NOT NULL,
  `cpf` varchar(40) NOT NULL,
  `codigoCartao` int NOT NULL,
  `statusCartao` tinyint(1) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 1, 'Caio Lopes', '0910lopess123%#*', 'foto_21.jpg', 'Caiooolopes@gmail.com', 20230263912, '23483874097', 654321, 0, 20.0),
-- 2, 'Larissa Oliva', '1234567!@#', 'foto_22.jpg', 'larissa.oliva@gmail.com', 20230587943, '10928374615', 123456, 1, 20.0),
INSERT INTO `cadastros` (`id`, `nome`, `senha`, `foto`, `email`, `matricula`, `cpf`, `codigoCartao`, `statusCartao`, `saldo`) VALUES
(1, 'Caio Lopes', 'f9dfb6585dd7cd6718a6df35656c4d5a', 'foto_21.jpg', 'Caiooolopes@gmail.com', 20230263912, '23483874097', 654321, 0, 20.0),
(2, 'Larissa Oliva', '1504003a8eed067b613e04f61222003b', 'foto_22.jpg', 'larissa.oliva@gmail.com', 20230587943, '10928374615', 123456, 1, 20.0),
(3, 'Joaquim Almeida', '16e1f21c58e2567e84f8d205124ba7e6', 'foto_23.jpg', 'joaquim.almeida@outlook.com', 20231294856, '40957286111', 789012, 1, 20.0),
(4, 'Paula Ribeiro', 'bc187e0b4459a538c63a7948858cc2fc', 'foto_24.jpg', 'paula.ribeiro@hotmail.com', 20230918377, '57392018461', 112233, 1, 20.0),
(5, 'Fábio Silva', 'f952ddca4a4ae602b637f167688a49f1', 'foto_25.jpg', 'fabio.silva@live.com', 20231798421, '98571234601', 221133, 1, 20.0),
(6, 'Letícia Mendes', '26bcebe3203947235a20d814c645e3c9', 'foto_26.jpg', 'leticia.mendes@outlook.com', 20231240589, '82739162410', 987654, 1, 20.0),
(7, 'Vitor Souza', 'e818cc229e46552067ecdac503d983c6', 'foto_27.jpg', 'vitor.souza@gmail.com', 20231122345, '76250491837', 354879, 1, 20.0),
(8, 'Renata Costa', '3dd33f93adc58e496f8da4620c6bc117', 'foto_28.jpg', 'renata.costa@uol.com.br', 20231437650, '35958274109', 543210, 1, 20.0),
(9, 'Ricardo Martins', 'bdb04d1d1e5bfdea42e853a8ee908627', 'foto_29.jpg', 'ricardo.martins@outlook.com', 20230945781, '62483501724', 675849, 1, 20.0),
(10, 'Tatiane Rocha', '8a217a254c75a21c897bcf3458df08dd', 'foto_30.jpg', 'tatiane.rocha@live.com', 20231359862, '57192083650', 987321, 1, 20.0),
(11, 'Juliana Costa', '089ecd13021e90f9acf04b40ce4a4451', 'foto_31.jpg', 'juliana.costa@gmail.com', 20231648572, '46739258090', 112489, 1, 20.0),
(12, 'Lucas Almeida', '9f37fd4065270b402b3de15fc0bc3665', 'foto_32.jpg', 'lucas.almeida@outlook.com', 20231049560, '39648020359', 314159, 1, 20.0),
(13, 'Mariana Pinto', '07a814a37f1d8e06f0530bb5aa722cc7', 'foto_33.jpg', 'mariana.pinto@yahoo.com', 20231274214, '71094685310', 625781, 1, 20.0),
(14, 'Rogério Ferreira', '2124b3fb632b2b13e10fd236f109222c', 'foto_34.jpg', 'rogerio.ferreira@uol.com.br', 20230126480, '86243150907', 758439, 1, 20.0),
(15, 'Bruna Souza', '82f080ef2d8ec61e700461fa90e3c382', 'foto_35.jpg', 'bruna.souza@live.com', 20231085261, '92045718360', 926374, 1, 20.0),
(16, 'Guilherme Oliveira', 'd92db32236e8b44bf3c9bafb9fcecd68', 'foto_36.jpg', 'guilherme.oliveira@gmail.com', 20230572384, '73498129561', 328641, 1, 20.0),
(17, 'Karina Lima', '8adb69f36e6aac35036c73da858a97f5', 'foto_37.jpg', 'karina.lima@outlook.com', 20231493685, '38927456120', 467532, 1, 20.0),
(18, 'Rodrigo Alves', '8bb62823622f2257f3ae67e9859ac0a9', 'foto_38.jpg', 'rodrigo.alves@gmail.com', 20231215679, '52603948123', 912389, 1, 20.0),
(19, 'Camila Freitas', '17fde2a4e385d752573e75fda08138fe', 'foto_39.jpg', 'camila.freitas@uol.com.br', 20231134876, '67492038476', 239847, 1, 20.0),
(20, 'Sérgio Santos', 'ea102e4136048dbd47bf0779e6fedf9e', 'foto_40.jpg', 'sergio.santos@live.com', 20230678459, '81237509462', 148725, 0, 20.0),
(21, 'Sofia Martins', 'e6b5696296bffb1fd13adb2d4990450b', 'foto_20.jpg', 'sofia.martins@outlook.com', 20231023761, '86049726322', 100020, 1, 20.0),
(22, 'Rafael Souza', 'f38b1b98bf89fe9ac0fc16bf0147856a', 'foto_19.jpg', 'rafael.souza@uol.com.br', 20230847210, '47325018906', 100019, 1, 20.0);


DROP TABLE IF EXISTS `precadastros`;
CREATE TABLE IF NOT EXISTS `precadastros` (
  `id` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `matricula` bigint NOT NULL,
  `cpf` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Ana Faria-> abc123def456!   
-- Beatriz -> capricornio*   
INSERT INTO `precadastros` (`id`, `nome`, `senha`, `foto`, `email`, `matricula`, `cpf`) VALUES
(1, 'Ana Faria', 'a3b46d2d6faa292a499616261d3093f6', 'foto_1.jpg', 'ana.faria2104@gmail.com', 20232030123, '73291008030'),
(2, 'Beatriz Ferreira', '7a71f3a7f8d5bc6442592f9cee9b28d1', 'foto_2.jpg', 'biaaferreir@hotmail.com', 20231231253, '92445426090'),
(3, 'Bernardo Almeida', '526065c06c87cdb8a67d26e9ccd61712', 'foto_3.jpg', 'braico@outlook.com', 20239785308, '67966291081'),
(4, 'Carlos Oliveira', '78ea762f40f7799a0ec072b84cb49567', 'foto_4.jpg', 'carlos.oliveira@yahoo.com', 20230517145, '87342179022'),
(5, 'Daniela Costa', 'c98fa386d37ffcf3fd901cac26ec3fa9', 'foto_5.jpg', 'daniela.costa@gmail.com', 20230812975, '86901427021'),
(6, 'Eduardo Pinto Silva', 'b9b426b5af252f4c2303d619b97443ee', 'foto_6.jpg', 'edu.pinto@outlook.com', 20231245100, '76258023015'),
(7, 'Fernanda Silva', '2751d593927037579c7403800adc69bb', 'foto_7.jpg', 'fernanda.silva@email.com', 20231567192, '58301572049'),
(8, 'Gustavo Pereira', '290bd1955c09d62d8b21d572dbcb2bbe', 'foto_8.jpg', 'gustavo.pereira@gmail.com', 20230813204, '49567891065'),
(9, 'Heloisa Souza', '5fcd7e7ef812998926f7220741eb6585', 'foto_9.jpg', 'helo.souza@live.com', 20231105720, '31549023763'),
(10, 'Isabela Lima', '10e0d1a6fbf585d247b7423f48357c92', 'foto_10.jpg', 'isa.lima@uol.com.br', 20230964783, '58437291014'),
(11, 'Juliana Rocha', '9f86f6a97d22c23e2da791671af5e0cc', 'foto_11.jpg', 'j.rocha@outlook.com', 20231284090, '67958452039'),
(12, 'Kleber Santos', '5c4405ccdc9cbe9dd807050949c47d25', 'foto_12.jpg', 'kleber.santos@hotmail.com', 20231093481, '91302657071'),
(13, 'Luciana Martins', '62ae708d05ee323dce5238e925e621cf', 'foto_13.jpg', 'luciana.martins@gmail.com', 20231200411, '21409785021'),
(14, 'Marcelo Silva', 'e87ad7f842f2e54aba62b287ca49cf31', 'foto_14.jpg', 'marcelo.silva@live.com', 20231788599, '12039854218'),
(15, 'Natália Freitas', '5b8c1b4e5d607990bf3cd812672ac450', 'foto_15.jpg', 'nat.frietas@outlook.com', 20230650978, '33472801098'),
(16, 'Otávio Costa', 'a77d6a0b3bddbee86d5fbfacdcdd85bd', 'foto_16.jpg', 'otavio.costa@yahoo.com', 20231224854, '94715078356'),
(17, 'Paula Rocha', '34f1dc5afbfc8d91a559c9e09bc68d6a', 'foto_17.jpg', 'paula.rocha@gmail.com', 20230975342, '20984635072'),
(18, 'Quelly Almeida', 'cc492994abdc43bc0256d471c70dd63d', 'foto_18.jpg', 'quelyssa.a@live.com', 20231230111, '68092405314');


DROP TABLE IF EXISTS `gestores`;
CREATE TABLE IF NOT EXISTS `gestores` (
  `id` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cpf` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `gestores` (`id`, `nome`, `senha`, `email`, `cpf`) VALUES
(1, 'Marcos Fernando', 'c5292975de7059d632489fa881f9f920', 'marcosfernando972@gmail.com', '14612161688'),
(2, 'Juliana Torres', '00f62144a0290b7afb29e34001b6643c', 'julianaptorres@gmail.com', '72192356072'),
(3, 'Joao Antonio Silva', 'ec490362ac0c5010dee7aafb58c4dfd1', 'joaoantoniosi12@gmail.com', '41120355001'),
-- Marcos Fernando: Asd123!@

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cpf` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `funcionarios` (`id`, `nome`, `senha`, `email`, `cpf`) VALUES
(1, 'Patricio Pereira', '07f759326c06d32afb6189b3e41f2206', 'patriciopereira@gmail.com', '47874207041'),
(2, 'Clarice Chagas', '3a7ed29b16f3e2578b6cb70c51e731a2', 'claricechagas@gmail.com', '57585997000'),
(3, 'Amanda Lopes', '8b3a0bcd49cc3f6e66a25ea4ce304ed4', 'amandaLopes@gmail.com', '83719548082'),
-- Patricio Pereira: Patr1cio$

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