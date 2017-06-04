-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ingressos
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambiente` (
  `id_ambiente` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `tipo` enum('Estádio','Auditório','Ginásio','Clube','Cinema','CasaShow','Teatro') NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `endereco` varchar(50) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `pontoRef` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_ambiente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
INSERT INTO `ambiente` VALUES (1,'Clube dos Oficiais','Clube',200,'Av. Dante Michelini','Clube com 2 piscinas e Área de Lazer.','Praia'),(2,'MOVE','CasaShow',300,'Av. Adalberto Simão Náder','Boate para todos os públicos','Aeroporto'),(3,'Arena Vitória','Ginásio',10000,'Av. Beira Mar','Ginásio Poliesportivo com Palco','Prefeitura de Vitória'),(4,'Kléber Andrade','Estádio',50000,'Rua do Buraco sem Fundo','Estádio esportivo','Faculdade Pio XII'),(5,'Auditório do CT1','Auditório',50,'Av. Fernando Ferrari, UFES, CT1','Auditório estudantil','Dentro da UFES'),(6,'Teatro Universitário','Teatro',250,'Av. Fernando Ferrari','Teatro com Palco, Luzes e Acústica.','Dentro da UFES.'),(7,'Cinemark','Cinema',100,'Av. Américo Buaiz','Cinema com Cadeiras Reclináveis.','Assembléia Legislativa'),(8,'Centro de Convenções de Vitória','Auditório',200,'Av. Leitão da Silva','Auditório com palco e data show.','SETPES'),(9,'AERT','Clube',1000,'Av. José Rato','Clube com duas piscinas e quatro churrasqueiras.',''),(10,'Cinemagic','Cinema',100,'Av. Belmiro Texeira Pimenta','Cinema 3D com Poltronas Reclináveis','Estácio de Sá'),(11,'Ginásio Alvares Cabral','Ginásio',10000,'Av. Beira Mar',NULL,'Prefeitura de Vitória'),(12,'Maracanã','Estádio',30000,'São Paulo',NULL,NULL);
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autenticacao`
--

DROP TABLE IF EXISTS `autenticacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autenticacao` (
  `id_autenticacao` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `senha` varchar(8) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_autenticacao`),
  KEY `fk_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacao`
--

LOCK TABLES `autenticacao` WRITE;
/*!40000 ALTER TABLE `autenticacao` DISABLE KEYS */;
INSERT INTO `autenticacao` VALUES (1,'joana69','69696969',1),(2,'silasloucampos','beatriz5',10),(3,'lcouto','kendra69',2),(4,'anascarpino','12345678',3),(5,'luanav','joaoluis',6),(6,'cerzinha','princesa',8);
/*!40000 ALTER TABLE `autenticacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `valor_unitario` double DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '1',
  `id_usuario` int(11) DEFAULT NULL,
  `dCompra` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,12.5,37.5,3,9,'2017-08-02 23:59:00'),(2,119.99,359.97,3,2,'2017-07-01 10:51:00'),(3,49.9,49.9,1,6,'2017-03-03 12:15:00'),(4,25.5,76.5,3,4,'2017-09-12 03:33:00'),(5,100,200,2,10,'2017-06-02 06:52:13'),(6,90,90,1,5,'2017-01-06 13:47:00'),(7,40,40,1,9,'2017-03-04 12:56:23'),(8,70,70,1,11,'2017-05-10 11:17:38'),(9,35,35,1,6,'2017-07-17 18:10:58'),(10,12,12,1,6,'2017-06-07 23:59:00');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esporte`
--

DROP TABLE IF EXISTS `esporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esporte` (
  `id_esporte` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `equipe1` varchar(30) DEFAULT NULL,
  `equipe2` varchar(45) DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_esporte`),
  KEY `fk_evento_idx` (`id_evento`),
  CONSTRAINT `fk_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esporte`
--

LOCK TABLES `esporte` WRITE;
/*!40000 ALTER TABLE `esporte` DISABLE KEYS */;
INSERT INTO `esporte` VALUES (1,'Futebol','Flamengo','Vasco',3),(2,'Futebol','Rio Branco','Desportiva',8),(3,'Basquete','Cleveland Cavaliers','Golden State Warriors',9),(4,'Futebol','Bahia','Atlético-GO',12),(5,'Futebol','Grêmio','Vasco',13),(6,'Futebol','Flamengo','Botafogo',15),(7,'Volei','Brasil','Franca',22),(8,'Volei','Alemanha','Italia',23),(9,'Tenis','Federer','Dadal',24),(10,'Polo-Aquatico','Vasco','Flamengo',25);
/*!40000 ALTER TABLE `esporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `dataEvento` datetime DEFAULT NULL,
  `dataInclusao` datetime DEFAULT NULL,
  `sinopse` varchar(50) DEFAULT NULL,
  `id_ambiente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_tipo_idx` (`id_tipo`),
  KEY `fk_ambiente_1_idx` (`id_ambiente`),
  CONSTRAINT `fk_ambiente` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id_ambiente`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Tour Diva',3,'2017-08-26 22:00:00','2017-04-11 12:30:00',NULL,2),(2,'Humberto Gessinger',3,'2017-06-10 21:30:00','2017-03-20 07:00:00',NULL,3),(3,'Flamengo x Vasco ',4,'2017-06-17 18:00:00','2017-06-01 11:55:00',NULL,4),(4,'Os Barbixas',2,'2017-04-02 21:00:00','2017-01-13 21:00:00',NULL,6),(5,'Melhores do Mundo',2,'2017-09-21 19:30:00','2017-02-02 08:49:00',NULL,8),(6,'Maratona de Filmes Saga Senhor dos Anéis',1,'2017-10-07 10:00:00','2017-06-01 06:00:00',NULL,7),(7,'Estréia filme A Múmia',1,'2017-06-08 00:00:00','2016-11-30 09:05:00','Uma antiga rainha está mumificada',10),(8,'Rio Branco x Desportiva',4,'2017-09-10 10:00:00','2017-07-16 08:00:00',NULL,4),(9,'Cleveland Cavaliers x Golden State Warriors',4,'2017-06-01 18:00:00','2017-03-14 23:00:00',NULL,11),(10,'Estreia Um Tio Quase Perfeito',1,'2017-06-15 00:00:00','2017-04-25 14:00:00','',7),(11,'Estreia Um Tio Quase Perfeito',1,'2017-06-15 00:00:00','2017-04-25 14:00:00',NULL,10),(12,'Bahia x Atlético-GO',4,'2017-06-03 21:00:00','2017-05-20 05:40:00',NULL,4),(13,'Grêmio x Vasco',4,'2017-06-04 16:00:00','2017-05-20 18:30:00',NULL,12),(14,'Estreia Meu Malvado Favorito 3',1,'2017-06-29 00:00:00','2016-12-12 00:00:00',NULL,10),(15,'Flamengo x Botafogo',4,'2017-06-04 15:00:00','2017-05-20 09:28:00',NULL,4),(16,'Show Ed Sheeran',3,'2017-08-30 22:00:00','2014-04-05 00:26:00',NULL,12),(17,'Anitta',3,'2017-12-24 23:00:00','2017-07-01 10:50:00',NULL,2),(18,'Capital Inicial',3,'2017-03-14 21:00:00','2016-11-16 03:04:00',NULL,3),(19,'Skank',3,'2017-02-03 20:00:00','2016-11-25 15:25:00',NULL,11),(20,'Estreia Planeta dos Macacos: A Guerra',1,'2017-08-03 00:00:00','2017-04-16 12:30:25',NULL,10),(21,'Show Nx Zero',3,'2017-11-25 21:00:00','2017-06-01 11:24:00',NULL,3),(22,'Brasil x Franca',4,'2017-06-25 15:00:00','2017-06-25 17:00:00',NULL,4),(23,'Alemanha x Italia',4,'2017-06-25 17:00:00','2017-06-25 19:00:00',NULL,4),(24,'Federer x Nadal',4,'2017-07-01 13:00:00','2017-07-01 17:00:00',NULL,4),(25,'Vasco x Flamengo',4,'2017-07-10 13:00:00','2017-07-10 15:00:00',NULL,4),(26,'Estreia Peppa Pig',1,'2017-08-01 15:00:00','2017-08-01 16:00:00',NULL,10),(27,'Estreia Logan',1,'2017-08-01 19:00:00','2017-08-01 20:50:00',NULL,10),(28,'Cada um Com o Seu Problema',2,'2017-04-02 21:00:00','2017-04-02 22:00:00',NULL,6),(29,'Purpose',3,'2017-11-05 20:00:00','2017-02-01 12:25:05',NULL,12),(30,'Pabblo Vittar',3,'2017-02-25 23:00:00','2016-05-26 06:21:38',NULL,2),(31,'Essencial',3,'2017-06-08 21:00:00','2017-03-21 11:14:50',NULL,3),(32,'Peppa Pig',2,'2018-01-01 17:00:00','2017-06-06 10:25:06',NULL,11),(33,'Whinderson Nunes',2,'2017-07-18 21:00:00','2017-03-14 12:32:00',NULL,6),(34,'Meu Passado me Condena',2,'2017-01-24 21:00:00','2016-12-02 14:51:43',NULL,6),(35,'A Bela e a Fera',2,'2016-09-10 18:30:00','2016-07-23 04:52:21',NULL,11),(36,'Boca Rosa',2,'2017-11-17 19:30:00','2017-06-04 11:56:08',NULL,6),(37,'Harry Potter e a Criança Amaldiçoada',2,'2017-11-25 20:00:00','2016-08-26 15:54:21',NULL,11),(38,'Os Miseráveis',2,'2016-12-24 22:00:00','2017-10-10 17:16:30',NULL,8),(39,'Assassinato no Expresso do Oriente',1,'2017-11-23 00:00:00','2017-06-04 12:04:03',NULL,7);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filme` (
  `id_filme` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `censura` varchar(45) DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `fk_filme_1_idx` (`id_evento`),
  CONSTRAINT `fk_filme` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'A Múmia','Suspense','14','01:41:20',7),(2,'O Senhor Dos Anéis: A Sociedade do Anel','Fantasia','10','02:57:01',6),(3,'O Senhor Dos Anéis: As Duas Torres','Fantasia','10','02:42:29',6),(4,'O Senhor Dos Anéis: O Retorno do Rei','Fantasia','10','03:01:10',6),(5,'Meu Malvado Favorito 3','Animação','Livre','01:29:00',14),(6,'Um Tio Quase Perfeito','Comédia',NULL,NULL,10),(7,'Planeta dos Macacos: A Guerra','Ação','14',NULL,20),(8,'Peppa Pig','Animado','0','00:00:01',26),(9,'Logan','Ação','18','01:50:00',27),(10,'Assassinato no Expresso do Oriente','Suspense','14',NULL,39);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int(11) NOT NULL,
  `setor` varchar(10) DEFAULT NULL,
  `cadeira` int(11) DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_ingresso`),
  KEY `fk_evento_idx` (`id_evento`),
  KEY `fk_compra_idx` (`id_compra`),
  CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,'A',1,6,4),(2,'A',13,6,4),(3,'3',50,20,1),(4,'Azul',100,5,3),(5,'Vermelho',2,17,2),(6,'B',5,6,4),(7,'Azul',87,17,2),(8,'Amarelo',17,17,2),(9,'1',1,20,1),(10,'2',1,20,1),(11,'Prata',5,37,5),(12,'Prata',6,37,5),(13,'Dourado',65,29,6),(14,'B',180,2,7),(15,'Vip',9,9,8),(16,'Amarelo',125,1,9),(17,'C',12,7,10);
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peca` (
  `id_peca` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `companhia` varchar(45) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_peca`),
  KEY `fk_peca_1_idx` (`id_evento`),
  CONSTRAINT `fk_peca` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Improvável','Os Barbixas','Comédia',4),(2,'Hermanoteu na Terra de Godah','Melhores do Mundo','Comédia',5),(3,'Cada um Com o Seu Problema','Marcelo Medici','Comédia',28),(4,'Peppa Pig',NULL,'Infantil',32),(5,'Whinderson Nunes',NULL,'Comédia',33),(6,'Meu Passado Me Condena',NULL,'Comédia',34),(7,'A Bela e a Fera',NULL,'Infantil',35),(8,'Boca Rosa',NULL,NULL,36),(9,'Harry Potter e a Criança Amaldiçoada',NULL,'Fantasia',37),(10,'Os Miseráveis',NULL,'Drama',38);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `show` (
  `id_show` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `artista` varchar(30) DEFAULT NULL,
  `estilo` varchar(45) DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id_show`),
  KEY `fk_show_1_idx` (`id_evento`),
  CONSTRAINT `fk_show_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
INSERT INTO `show` VALUES (1,'Desde Aquele Dia','Humberto Gessinger','Rock',2),(2,'Divide','Ed Sheeran','Pop',16),(3,'Anitta','Anitta','Pop',17),(4,'Capital Inicial','Capital Inicial','Rock',18),(5,'Skank','Skank','Pop Rock',19),(6,'Nx Zero','Nx Zero','Pop Rock',21),(7,'Tour Diva','Beyonce',NULL,1),(8,'Purpose','Justin Bieber','Pop',29),(9,'Pabblo Vittar','Pabblo Vittar','Pop',30),(10,'Essencial','Rosa de Saron',NULL,31);
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'filme'),(2,'peça'),(3,'show'),(4,'esporte');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `dNascimento` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Joana da Silva','13815889632','Rua da Baleia','33439090','joanasilva@mail.com','1973-05-12'),(2,'Luiz Meirelles','13585245698','Paschoal Del Maestro','33375669','lcoutojunior@gmail.com','1991-07-12'),(3,'Ana Beatriz Scarpino','15935725856','',NULL,'anascarpino@gmail.com','1991-11-25'),(4,'João Mário Soares','23647815923','Rua da Fiação, 73','33401236','jmoicano@gmail.com','1989-07-14'),(5,'Rodrigo Biancard','21423647859','Rua Esperança, 34, apto 101.',NULL,'rb@gmail.com',NULL),(6,'Luana Vettler','25814736926',NULL,'33694569','luanavetler@gmail.com','1993-02-20'),(7,'Lucas Augusto Santos',NULL,'Rua Teixeira de Freitas','998521236','lucasaugsantos@gmail.com','1992-04-11'),(8,'César Bernabé','98754427812','Rua Marilândia',NULL,NULL,NULL),(9,'Celso Celante','12345678912','Rua Bairro República','985692424','celsocelante@gmail.com','1994-05-26'),(10,'Silas Campos',NULL,'Rua Cachoeiro de Itapemirim, 76',NULL,'silascampos@gmail.com','1993-07-13'),(11,'Breno Zupeli',NULL,NULL,'998123456',NULL,'1995-07-18');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-04 17:02:54
