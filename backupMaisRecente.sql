-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.2.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para lanchonete_2d_2024
DROP DATABASE IF EXISTS `lanchonete_2d_2024`;
CREATE DATABASE IF NOT EXISTS `lanchonete_2d_2024` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lanchonete_2d_2024`;

-- Copiando estrutura para tabela lanchonete_2d_2024.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tabela` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataHora` datetime NOT NULL,
  `usuario` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registrar as ações importantes do sistema. Exemplos: venda de produtos, inserção de marcas, atualização de preços, etc.';

-- Copiando dados para a tabela lanchonete_2d_2024.auditoria: ~7 rows (aproximadamente)
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Venda de produto', 'itensVenda', '2024-12-04 07:52:05', 'root@localhost'),
	(2, 'Venda de produto=Fandangos Quantidade vendida=2.00', 'itensVenda', '2024-12-04 08:05:44', 'root@localhost'),
	(3, 'Devolução de produto= Fandangos Quantidade devolvida= 2.00', 'ItensVenda', '2024-12-05 10:03:17', 'root@localhost'),
	(4, 'Venda de produto=Doritos Quantidade vendida=3.00', 'itensVenda', '2024-12-11 07:26:16', 'root@localhost'),
	(5, 'Devolução de produto= Doritos Quantidade devolvida= 3.00', 'ItensVenda', '2024-12-11 07:29:35', 'root@localhost'),
	(6, 'Venda de produto=Doritos Quantidade vendida=7.00', 'itensVenda', '2024-12-11 07:56:20', 'root@localhost'),
	(7, 'Marca cadastrada: BONAFORT', 'marca', '2024-12-11 08:15:40', 'root@localhost');

-- Copiando estrutura para tabela lanchonete_2d_2024.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `codCargo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) NOT NULL,
  `salarioInicial` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.cargo: ~4 rows (aproximadamente)
INSERT INTO `cargo` (`codCargo`, `nome`, `salarioInicial`) VALUES
	(1, 'Gerente', 3850.77),
	(2, 'Atendente', 1650.88),
	(3, 'Cozinheira', 2310.28),
	(5, 'Administrativo', NULL);

-- Copiando estrutura para tabela lanchonete_2d_2024.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.categoria: ~5 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nome`) VALUES
	(1, 'Refrigerante em lata'),
	(2, 'Salgados'),
	(4, 'Água'),
	(5, 'Sucos naturais'),
	(6, 'Salgadinhos industrializados');

-- Copiando estrutura para tabela lanchonete_2d_2024.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.cliente: ~5 rows (aproximadamente)
INSERT INTO `cliente` (`codCliente`, `nome`, `cpf`, `email`, `dataNascimento`, `telefone`, `endereco`, `bairro`, `cidade`, `cep`, `uf`) VALUES
	(1, 'Cliente à vista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Flávio Teixeira', '222.222.222-22', 'flaviot@gmail.com', '1980-11-25', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Ana Margarida Silva', '333.333.333-33', 'anasilva@yahoo.com', '2008-04-14', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Anderson Telles', '444.444.444-44', 'andersontelles2024@gmail.com', '1989-03-12', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Rose Gonçalves', '555.555.555-55', 'roseg@gmail.com', '1985-10-05', '(35)98810-1010', 'Praça Antônio Carlos, 50', 'Centro', 'Machado', '37750-000', 'MG');

-- Copiando estrutura para tabela lanchonete_2d_2024.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) NOT NULL,
  `carTrab` varchar(90) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `salarioAtual` decimal(10,2) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `dataAdmissao` date DEFAULT NULL,
  `cargo_codCargo` int NOT NULL,
  PRIMARY KEY (`codFuncionario`,`cargo_codCargo`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_codCargo`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_codCargo`) REFERENCES `cargo` (`codCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.funcionario: ~3 rows (aproximadamente)
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `carTrab`, `cpf`, `salarioAtual`, `email`, `dataAdmissao`, `cargo_codCargo`) VALUES
	(1, 'Felipe Xavier', 'AB123', '111.111.111-11', 4000.00, 'felipexavier@gmail.com', '2024-02-15', 1),
	(2, 'Amanda Silva', 'XY222', '222.222.222-22', 1650.88, NULL, '2016-07-02', 2),
	(3, 'Francisca Telles', 'BFG999', '333.333.333-33', 2310.28, 'telles_francisca@hotmail.com', '2019-12-20', 3);

-- Copiando estrutura para tabela lanchonete_2d_2024.itensvenda
DROP TABLE IF EXISTS `itensvenda`;
CREATE TABLE IF NOT EXISTS `itensvenda` (
  `codItemVenda` int NOT NULL AUTO_INCREMENT,
  `produto_codProduto` int NOT NULL,
  `venda_codVenda` int NOT NULL,
  `quantVenda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codItemVenda`,`produto_codProduto`,`venda_codVenda`),
  KEY `fk_produto_has_venda_venda1_idx` (`venda_codVenda`),
  KEY `fk_produto_has_venda_produto1_idx` (`produto_codProduto`),
  CONSTRAINT `fk_produto_has_venda_produto1` FOREIGN KEY (`produto_codProduto`) REFERENCES `produto` (`codProduto`),
  CONSTRAINT `fk_produto_has_venda_venda1` FOREIGN KEY (`venda_codVenda`) REFERENCES `venda` (`codVenda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.itensvenda: ~0 rows (aproximadamente)
INSERT INTO `itensvenda` (`codItemVenda`, `produto_codProduto`, `venda_codVenda`, `quantVenda`) VALUES
	(3, 4, 1, 5.00);

-- Copiando estrutura para tabela lanchonete_2d_2024.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int NOT NULL AUTO_INCREMENT COMMENT 'codMarca será a Primary Key (Chave Primária) da entidade (tabela) MARCA. Foi atribuído o tipo INT para que seja um número inteiro gerado automaticamente (AI = auto increment) e não pode ser nulo (NN = not null), ou seja, tem que ser preenchido.',
  `nome` varchar(50) NOT NULL,
  `observacoes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela lanchonete_2d_2024.marca: ~10 rows (aproximadamente)
INSERT INTO `marca` (`codMarca`, `nome`, `observacoes`) VALUES
	(1, 'Nestlé', NULL),
	(2, 'Lacta', NULL),
	(3, 'Frutty', NULL),
	(4, 'Coca-Cola', NULL),
	(5, 'Elma Chips', 'Salgadinhos diversos'),
	(6, 'Ferrero', 'Chocolates'),
	(8, 'Kopenhagen', NULL),
	(9, 'Bauducco', NULL),
	(10, 'CACAU SHOW', NULL),
	(11, 'BONAFORT', NULL);

-- Copiando estrutura para tabela lanchonete_2d_2024.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `ingredientes` varchar(500) DEFAULT NULL,
  `quantidade` decimal(10,2) DEFAULT NULL,
  `precoCusto` float DEFAULT NULL,
  `precoVenda` float NOT NULL,
  `marca_codMarca` int NOT NULL,
  `categoria_codCategoria` int NOT NULL,
  PRIMARY KEY (`codProduto`,`marca_codMarca`,`categoria_codCategoria`),
  KEY `fk_produto_marca_idx` (`marca_codMarca`),
  KEY `fk_produto_categoria1_idx` (`categoria_codCategoria`),
  CONSTRAINT `fk_produto_categoria1` FOREIGN KEY (`categoria_codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `fk_produto_marca` FOREIGN KEY (`marca_codMarca`) REFERENCES `marca` (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.produto: ~4 rows (aproximadamente)
INSERT INTO `produto` (`codProduto`, `nome`, `ingredientes`, `quantidade`, `precoCusto`, `precoVenda`, `marca_codMarca`, `categoria_codCategoria`) VALUES
	(1, 'Coca-cola', NULL, 48.00, 4.2, 5.2, 4, 1),
	(3, 'Cheetos', NULL, 22.00, 3.9, 5, 5, 6),
	(4, 'Doritos', NULL, 73.00, 7.35, 9, 5, 6),
	(5, 'Fandangos', NULL, 17.00, 4, 4.5, 5, 6);

-- Copiando estrutura para tabela lanchonete_2d_2024.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipoPagamento` enum('À vista','Cartão de crédito','Cartão de débito','PIX','Cheque','Ticket Alimentação','Convênio') NOT NULL,
  `cliente_codCliente` int NOT NULL,
  `funcionario_codFuncionario` int NOT NULL,
  PRIMARY KEY (`codVenda`,`cliente_codCliente`,`funcionario_codFuncionario`),
  KEY `fk_venda_cliente1_idx` (`cliente_codCliente`),
  KEY `fk_venda_funcionario1_idx` (`funcionario_codFuncionario`),
  CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`),
  CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`funcionario_codFuncionario`) REFERENCES `funcionario` (`codFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela lanchonete_2d_2024.venda: ~3 rows (aproximadamente)
INSERT INTO `venda` (`codVenda`, `dataHora`, `tipoPagamento`, `cliente_codCliente`, `funcionario_codFuncionario`) VALUES
	(1, '2024-08-22 10:18:00', 'PIX', 5, 2),
	(2, '2024-08-22 10:30:04', 'Convênio', 3, 2),
	(3, '2024-12-04 07:31:58', 'À vista', 2, 2);

-- Copiando estrutura para view lanchonete_2d_2024.vi_anoscontrato
DROP VIEW IF EXISTS `vi_anoscontrato`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_anoscontrato` (
	`codFuncionario` INT(10) NOT NULL,
	`nome` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`cpf` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`dataContrato` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`anosContrato` BIGINT(19) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_cardapio
DROP VIEW IF EXISTS `vi_cardapio`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_cardapio` (
	`nomeProduto` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`precoVenda` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nomeMarca` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`Categoria` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_cargosalariodecrescente
DROP VIEW IF EXISTS `vi_cargosalariodecrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_cargosalariodecrescente` (
	`nome` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`salarioinicial` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_controlefuncionarios
DROP VIEW IF EXISTS `vi_controlefuncionarios`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_controlefuncionarios` (
	`nome` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`cpf` VARCHAR(20) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`inicioContrato` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`anosContrato` BIGINT(19) NULL,
	`salarioInicial` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_controleproduto
DROP VIEW IF EXISTS `vi_controleproduto`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_controleproduto` (
	`codProduto` INT(10) NOT NULL,
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`precoCusto` VARCHAR(48) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`precoVenda` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_funcionarioscargos
DROP VIEW IF EXISTS `vi_funcionarioscargos`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_funcionarioscargos` (
	`nome` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`codFuncionario` INT(10) NOT NULL,
	`carTrab` VARCHAR(90) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nomeCargo` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`salarioInicial` DECIMAL(10,2) NULL,
	`admissao` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_idadeclientes
DROP VIEW IF EXISTS `vi_idadeclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_idadeclientes` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(150) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`idade` BIGINT(19) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_notinhadetalhada
DROP VIEW IF EXISTS `vi_notinhadetalhada`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_notinhadetalhada` (
	`venda_codVenda` INT(10) NOT NULL,
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`quantVenda` DECIMAL(10,2) NOT NULL,
	`precoUnitario` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`totalPorItem` VARCHAR(61) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_totalpagarporvenda
DROP VIEW IF EXISTS `vi_totalpagarporvenda`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_totalpagarporvenda` (
	`codVenda` INT(10) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipoPagamento` ENUM('À vista','Cartão de crédito','Cartão de débito','PIX','Cheque','Ticket Alimentação','Convênio') NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`sum(format(i.quantVenda * p.precoVenda,2))` DOUBLE NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view lanchonete_2d_2024.vi_vendaspix
DROP VIEW IF EXISTS `vi_vendaspix`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vi_vendaspix` (
	`codVenda` INT(10) NOT NULL,
	`referenciaData` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tipoPagamento` ENUM('À vista','Cartão de crédito','Cartão de débito','PIX','Cheque','Ticket Alimentação','Convênio') NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nome` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`carTrab` VARCHAR(90) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para trigger lanchonete_2d_2024.tri_atualizaEstoque
DROP TRIGGER IF EXISTS `tri_atualizaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaEstoque` AFTER UPDATE ON `itensvenda` FOR EACH ROW BEGIN

	if (NEW.quantVenda > OLD.quantVenda)
		then UPDATE produto SET quantidade = quantidade - 
				(NEW.quantVenda - OLD.quantVenda) WHERE codProduto = NEW.produto_codProduto;
	
		ELSE if (NEW.quantVenda < OLD.quantVenda)
				then UPDATE produto SET quantidade = quantidade + 
				(OLD.quantVenda - NEW.quantVenda) WHERE codProduto = NEW.produto_codProduto;
			END if;
	END if;	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete_2d_2024.tri_baixaEstoque
DROP TRIGGER IF EXISTS `tri_baixaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_baixaEstoque` AFTER INSERT ON `itensvenda` FOR EACH ROW BEGIN
#Atualizar o estoque do produto 
	UPDATE produto SET produto.quantidade = produto.quantidade
	- NEW.quantVenda WHERE produto.codProduto = NEW.produto_codProduto;
#Buscar o nome do produto para informar na Auditoria
	SELECT nome INTO @nomeProd FROM produto WHERE codProduto = NEW.produto_codProduto;
#Configurar uma mensagem concatenando (juntando) vários trechos
	SET @mensagem = CONCAT("Venda de produto=", @nomeProd,
 " Quantidade vendida=", NEW.quantVenda);
#Gravar / inserir um log (informação importante) na auditoria
	INSERT INTO auditoria VALUES(NULL, @mensagem, "itensVenda", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete_2d_2024.tri_devolveEstoque
DROP TRIGGER IF EXISTS `tri_devolveEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_devolveEstoque` AFTER DELETE ON `itensvenda` FOR EACH ROW BEGIN
#atualizar o estoque do produto devolvendo a quantidade que foi excluída
	UPDATE produto SET quantidade = quantidade + old.quantVenda
	WHERE codProduto = old.produto_codProduto;

	SELECT nome INTO @nomeProd FROM produto WHERE codProduto = old.produto_codProduto;

	SET @mensagem = CONCAT("Devolução de produto= ", @nomeProd, " Quantidade devolvida= ", old.quantVenda);

#inserir um log na auditoia
	INSERT INTO auditoria VALUES (NULL, @mensagem , "ItensVenda", NOW(), USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete_2d_2024.tri_novaMarca
DROP TRIGGER IF EXISTS `tri_novaMarca`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_novaMarca` BEFORE INSERT ON `marca` FOR EACH ROW BEGIN

	#Configurar nome da marca para letras maiúsculas
	SET NEW.nome = UPPER(NEW.nome);
	
	#Configurar uma mensaagem para ser gravada na AUDITORIA
	SET @mensagem = CONCAT("Marca cadastrada: " , NEW.nome);
	
	#Inserir a mensagem e demais dados na AUDITORIA
	INSERT INTO auditoria VALUES(NULL, @mensagem, "marca", NOW(), USER());
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_anoscontrato`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_anoscontrato` AS select `funcionario`.`codFuncionario` AS `codFuncionario`,`funcionario`.`nome` AS `nome`,`funcionario`.`cpf` AS `cpf`,date_format(`funcionario`.`dataAdmissao`,'%d/%m/%Y') AS `dataContrato`,floor(((to_days(curdate()) - to_days(`funcionario`.`dataAdmissao`)) / 365)) AS `anosContrato` from `funcionario`;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_cardapio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_cardapio` AS select `p`.`nome` AS `nomeProduto`,format(`p`.`precoVenda`,2) AS `precoVenda`,`m`.`nome` AS `nomeMarca`,`c`.`nome` AS `Categoria` from ((`produto` `p` join `marca` `m`) join `categoria` `c` on(((`p`.`marca_codMarca` = `m`.`codMarca`) and (`p`.`categoria_codCategoria` = `c`.`codCategoria`))));

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_cargosalariodecrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_cargosalariodecrescente` AS select `cargo`.`nome` AS `nome`,`cargo`.`salarioInicial` AS `salarioinicial` from `cargo` order by `cargo`.`salarioInicial` desc;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_controlefuncionarios`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_controlefuncionarios` AS select `f`.`nome` AS `nome`,`f`.`cpf` AS `cpf`,date_format(`f`.`dataAdmissao`,'%d/%m/%Y') AS `inicioContrato`,floor(((to_days(curdate()) - to_days(`f`.`dataAdmissao`)) / 365)) AS `anosContrato`,`c`.`salarioInicial` AS `salarioInicial` from (`funcionario` `f` join `cargo` `c` on((`f`.`cargo_codCargo` = `c`.`codCargo`))) where (`c`.`salarioInicial` < 2000);

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_controleproduto`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_controleproduto` AS select `produto`.`codProduto` AS `codProduto`,`produto`.`nome` AS `nome`,format(`produto`.`precoCusto`,2) AS `precoCusto`,format(`produto`.`precoVenda`,2) AS `precoVenda` from `produto`;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_funcionarioscargos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_funcionarioscargos` AS select `f`.`nome` AS `nome`,`f`.`codFuncionario` AS `codFuncionario`,`f`.`carTrab` AS `carTrab`,`c`.`nome` AS `nomeCargo`,`c`.`salarioInicial` AS `salarioInicial`,date_format(`f`.`dataAdmissao`,'%d/%m/%Y') AS `admissao` from (`cargo` `c` join `funcionario` `f` on((`c`.`codCargo` = `f`.`cargo_codCargo`)));

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_idadeclientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_idadeclientes` AS select `c`.`nome` AS `nome`,`c`.`email` AS `email`,date_format(`c`.`dataNascimento`,'%d/%m/%Y') AS `nascimento`,floor(((to_days(curdate()) - to_days(`c`.`dataNascimento`)) / 365)) AS `idade` from `cliente` `c`;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_notinhadetalhada`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_notinhadetalhada` AS select `i`.`venda_codVenda` AS `venda_codVenda`,`p`.`nome` AS `nome`,`i`.`quantVenda` AS `quantVenda`,format(`p`.`precoVenda`,2) AS `precoUnitario`,format((`i`.`quantVenda` * `p`.`precoVenda`),2) AS `totalPorItem` from (`itensvenda` `i` join `produto` `p` on((`i`.`produto_codProduto` = `p`.`codProduto`)));

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_totalpagarporvenda`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_totalpagarporvenda` AS select `v`.`codVenda` AS `codVenda`,`c`.`nome` AS `nome`,`v`.`tipoPagamento` AS `tipoPagamento`,sum(format((`i`.`quantVenda` * `p`.`precoVenda`),2)) AS `sum(format(i.quantVenda * p.precoVenda,2))` from (((`venda` `v` join `cliente` `c` on((`v`.`cliente_codCliente` = `c`.`codCliente`))) join `itensvenda` `i` on((`i`.`venda_codVenda` = `v`.`codVenda`))) join `produto` `p` on((`p`.`codProduto` = `i`.`produto_codProduto`))) group by `v`.`codVenda`,`c`.`nome`,`v`.`tipoPagamento`;

-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vi_vendaspix`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vi_vendaspix` AS select `v`.`codVenda` AS `codVenda`,date_format(`v`.`dataHora`,'%d/%m/%Y') AS `referenciaData`,`v`.`tipoPagamento` AS `tipoPagamento`,`f`.`nome` AS `nome`,`f`.`carTrab` AS `carTrab` from (`venda` `v` join `funcionario` `f` on((`v`.`funcionario_codFuncionario` = `f`.`codFuncionario`))) where (`v`.`tipoPagamento` = 'pix');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
