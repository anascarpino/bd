-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: ingressos
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
INSERT INTO `ambiente` VALUES (1,'Clube dos Oficiais','Clube',200,'Av. Dante Michelini','Clube com 2 piscinas e Área de Lazer.','Praia'),(2,'MOVE','CasaShow',300,'Av. Adalberto Simão Náder','Boate para todos os públicos','Aeroporto'),(3,'Arena Vitória','Ginásio',10000,'Av. Beira Mar','Ginásio Poliesportivo com Palco','Prefeitura de Vitória'),(4,'Kléber Andrade','Estádio',50000,'Rua do Buraco sem Fundo','Estádio esportivo','Faculdade Pio XII'),(5,'Auditório do CT1','Auditório',50,'Av. Fernando Ferrari, UFES, CT1','Auditório estudantil','Dentro da UFES'),(6,'Teatro Universitário','Teatro',250,'Av. Fernando Ferrari','Teatro com Palco, Luzes e Acústica.','Dentro da UFES.'),(7,'Cinemark','Cinema',100,'Av. Américo Buaiz','Cinema com Cadeiras Reclináveis.','Assembléia Legislativa'),(8,'Centro de Convenções de Vitória','Auditório',200,'Av. Leitão da Silva','Auditório com palco e data show.','SETPES'),(9,'AERT','Clube',1000,'Av. José Rato','Clube com duas piscinas e quatro churrasqueiras.',''),(10,'Cinemagic','Cinema',100,'Av. Belmiro Texeira Pimenta','Cinema 3D com Poltronas Reclináveis','Estácio de Sá');
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
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
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
  `ambiente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_tipo_idx` (`id_tipo`),
  KEY `fk_ambiente_1_idx` (`ambiente`),
  CONSTRAINT `fk_ambiente_1` FOREIGN KEY (`ambiente`) REFERENCES `ambiente` (`id_ambiente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
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
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `fk_filme_1_idx` (`evento`),
  CONSTRAINT `fk_filme_1` FOREIGN KEY (`evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
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
  `situacao` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ingresso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso_compra`
--

DROP TABLE IF EXISTS `ingresso_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresso_compra` (
  `id_compra` int(11) NOT NULL,
  `id_ingresso` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`,`id_ingresso`),
  KEY `fk_ingresso_idx` (`id_ingresso`),
  CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresso` FOREIGN KEY (`id_ingresso`) REFERENCES `ingresso` (`id_ingresso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso_compra`
--

LOCK TABLES `ingresso_compra` WRITE;
/*!40000 ALTER TABLE `ingresso_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresso_compra` ENABLE KEYS */;
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
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id_peca`),
  KEY `fk_peca_1_idx` (`evento`),
  CONSTRAINT `fk_peca_1` FOREIGN KEY (`evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
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
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id_show`),
  KEY `fk_show_1_idx` (`evento`),
  CONSTRAINT `fk_show_1` FOREIGN KEY (`evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
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

-- Dump completed on 2017-06-01 14:27:15
