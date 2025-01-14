
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estrutura para tabela `cadastros`
--

DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE IF NOT EXISTS `cadastros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `matricula` bigint NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `codigoCartao` int NOT NULL,
  `statusCartao` tinyint(1) NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4; 

--
-- Despejando dados para a tabela `cadastros`
--

INSERT INTO `cadastros` (`id`, `nome`, `senha`, `foto`, `email`, `matricula`, `cpf`, `codigoCartao`, `statusCartao`, `saldo`) VALUES
(1, 'Caio Lopes', '0910lopess123%#*', 'foto_21.jpg', 'caioSilvaaaLope@gmail.com', 20230263912, '23483874097', 654321, 1, 20.0),
(2, 'Larissa Oliveira', '1234567!@#', 'foto_22.jpg', 'larissa.oliveira@gmail.com', 20230587943, '10928374615', 123456, 1, 20.0),
(3, 'Joaquim Almeida', 'j0aquiM1234!', 'foto_23.jpg', 'joaquim.almeida@outlook.com', 20231294856, '40957286111', 789012, 1, 20.0),
(4, 'Paula Ribeiro', 'r1beiro@321', 'foto_24.jpg', 'paula.ribeiro@hotmail.com', 20230918377, '57392018461', 112233, 1, 20.0),
(5, 'Fábio Silva', 'fabio12@ss!', 'foto_25.jpg', 'fabio.silva@live.com', 20231798421, '98571234601', 221133, 1, 20.0),
(6, 'Letícia Mendes', 'letmendes123#', 'foto_26.jpg', 'leticia.mendes@outlook.com', 20231240589, '82739162410', 987654, 1, 20.0),
(7, 'Vitor Souza', 'vitorSOZa@321', 'foto_27.jpg', 'vitor.souza@gmail.com', 20231122345, '76250491837', 354879, 1, 20.0),
(8, 'Renata Costa', 'renatacosta!@#', 'foto_28.jpg', 'renata.costa@uol.com.br', 20231437650, '35958274109', 543210, 1, 20.0),
(9, 'Ricardo Martins', 'ricardom!1t@345', 'foto_29.jpg', 'ricardo.martins@outlook.com', 20230945781, '62483501724', 675849, 1, 20.0),
(10, 'Tatiane Rocha', 'tati@1234', 'foto_30.jpg', 'tatiane.rocha@live.com', 20231359862, '57192083650', 987321, 1, 20.0),
(11, 'Juliana Costa', 'ju@123456', 'foto_31.jpg', 'juliana.costa@gmail.com', 20231648572, '46739258090', 112489, 1, 20.0),
(12, 'Lucas Almeida', 'lucasA21@#', 'foto_32.jpg', 'lucas.almeida@outlook.com', 20231049560, '39648020359', 314159, 1, 20.0),
(13, 'Mariana Pinto', 'maripinto!@#', 'foto_33.jpg', 'mariana.pinto@yahoo.com', 20231274214, '71094685310', 625781, 1, 20.0),
(14, 'Rogério Ferreira', 'rogerioF@2021', 'foto_34.jpg', 'rogerio.ferreira@uol.com.br', 20230126480, '86243150907', 758439, 1, 20.0),
(15, 'Bruna Souza', 'brunaSOZ@2023', 'foto_35.jpg', 'bruna.souza@live.com', 20231085261, '92045718360', 926374, 1, 20.0),
(16, 'Guilherme Oliveira', 'guilherme2023#', 'foto_36.jpg', 'guilherme.oliveira@gmail.com', 20230572384, '73498129561', 328641, 1, 20.0),
(17, 'Karina Lima', 'karinaL@567', 'foto_37.jpg', 'karina.lima@outlook.com', 20231493685, '38927456120', 467532, 1, 20.0),
(18, 'Rodrigo Alves', 'rodrigoA@111', 'foto_38.jpg', 'rodrigo.alves@gmail.com', 20231215679, '52603948123', 912389, 1, 20.0),
(19, 'Camila Freitas', 'camilaF@2024', 'foto_39.jpg', 'camila.freitas@uol.com.br', 20231134876, '67492038476', 239847, 1, 20.0),
(20, 'Sérgio Santos', 'sergi0!321', 'foto_40.jpg', 'sergio.santos@live.com', 20230678459, '81237509462', 148725, 1, 20.0);


--
-- Estrutura para tabela `precadastros`
--

DROP TABLE IF EXISTS `precadastros`;
CREATE TABLE IF NOT EXISTS `precadastros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `matricula` bigint NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `precadastros`
--

INSERT INTO `precadastros` (`id`, `nome`, `senha`, `foto`, `email`, `matricula`, `cpf`) VALUES
(1, 'Ana Silva Faria', 'abc123def456!', 'foto_1.jpg', 'ana.faria2104@gmail.com', 20232030123, '73291008030'),
(2, 'Beatriz Ferreira', 'capricornio*', 'foto_2.jpg', 'biaaferreir@hotmail.com', 20231231253, '92445426090'),
(3, 'Bernardo Almeida', 'jkSAGsf986!@#', 'foto_3.jpg', 'braico@outlook.com', 20239785308, '67966291081'),
(4, 'Carlos Oliveira', 'qwerty12345!', 'foto_4.jpg', 'carlos.oliveira@yahoo.com', 20230517145, '87342179022'),
(5, 'Daniela Costa', 'danielaf123!', 'foto_5.jpg', 'daniela.costa@gmail.com', 20230812975, '86901427021'),
(6, 'Eduardo Pinto Silva', 'eduardo$321', 'foto_6.jpg', 'edu.pinto@outlook.com', 20231245100, '76258023015'),
(7, 'Fernanda Silva', 'fer1235!@#', 'foto_7.jpg', 'fernanda.silva@email.com', 20231567192, '58301572049'),
(8, 'Gustavo Pereira', 'gustav0_789', 'foto_8.jpg', 'gustavo.pereira@gmail.com', 20230813204, '49567891065'),
(9, 'Heloisa Souza', 'helo1234!', 'foto_9.jpg', 'helo.souza@live.com', 20231105720, '31549023763'),
(10, 'Isabela Lima', 'isabela12@56', 'foto_10.jpg', 'isa.lima@uol.com.br', 20230964783, '58437291014'),
(11, 'Juliana Rocha', 'julianar@123', 'foto_11.jpg', 'j.rocha@outlook.com', 20231284090, '67958452039'),
(12, 'Kleber Santos', 'kleber!@#789', 'foto_12.jpg', 'kleber.santos@hotmail.com', 20231093481, '91302657071'),
(13, 'Luciana Martins', 'luciana.123', 'foto_13.jpg', 'luciana.martins@gmail.com', 20231200411, '21409785021'),
(14, 'Marcelo Silva', 'marcel0!321', 'foto_14.jpg', 'marcelo.silva@live.com', 20231788599, '12039854218'),
(15, 'Natália Freitas', 'natalia!f09', 'foto_15.jpg', 'nat.frietas@outlook.com', 20230650978, '33472801098'),
(16, 'Otávio Costa', 'otavio@123', 'foto_16.jpg', 'otavio.costa@yahoo.com', 20231224854, '94715078356'),
(17, 'Paula Rocha', 'paula1234!', 'foto_17.jpg', 'paula.rocha@gmail.com', 20230975342, '20984635072'),
(18, 'Quelly Almeida', 'quelyssa@321', 'foto_18.jpg', 'quelyssa.a@live.com', 20231230111, '68092405314'),
(19, 'Rafael Souza', 'rafael01@#35', 'foto_19.jpg', 'rafael.souza@uol.com.br', 20230847210, '47325018906'),
(20, 'Sofia Martins', 'sofia12!@3', 'foto_20.jpg', 'sofia.martins@outlook.com', 20231023761, '86049726322');


DROP TABLE IF EXISTS `cartoes`;
CREATE TABLE IF NOT EXISTS `cartoes` (
    `id` int NOT NULL AUTO_INCREMENT,
    `numCartao` bigint NOT NULL,
    `codigo` int NOT NULL,
    /*`validade` VARCHAR(7) NOT NULL,*/
    `senha` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`numCartao`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*
DROP TABLE IF EXISTS `historico`;
CREATE TABLE IF NOT EXISTS `historico` (
  `matricula` bigint NOT NULL,
  `valor` int NOT NULL,
  `data` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `historico` (`matricula`, `valor`, `data`, `funcionario`, `saldo`) VALUES
(20232009818, 5000, '2025-01-09 12:05:22', 'Marcia Almeida Carvalho', 5000),
(20225678908, 3000, '2025-01-09 12:15:20', 'Marcia Almeida Carvalho', 3000),
(20232009818, -320, '2025-02-09 13:25:11', 'João Silva Pereira', 4680),
(20225678908, -320, '2025-03-09 11:05:24', 'Joana Cabral Orvalho', 2680),
(20232009818, -320, '2025-04-09 12:27:01', 'Joana Cabral Orvalho', 4360),
(20225678908, -320, '2025-05-09 10:55:12', 'João Silva Pereira', 24360)
*/