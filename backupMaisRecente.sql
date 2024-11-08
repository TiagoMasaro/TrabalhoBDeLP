-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.36 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para tiago_victoria_clinica
DROP DATABASE IF EXISTS `tiago_victoria_clinica`;
CREATE DATABASE IF NOT EXISTS `tiago_victoria_clinica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tiago_victoria_clinica`;

-- Copiando estrutura para tabela tiago_victoria_clinica.agendamentos
DROP TABLE IF EXISTS `agendamentos`;
CREATE TABLE IF NOT EXISTS `agendamentos` (
  `codAgendamentos` int NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `pacientes_codPaciente` int NOT NULL,
  `medicos_codMedico` int NOT NULL,
  PRIMARY KEY (`codAgendamentos`,`pacientes_codPaciente`,`medicos_codMedico`),
  KEY `fk_agendamentos_pacientes1_idx` (`pacientes_codPaciente`),
  KEY `fk_agendamentos_medicos1_idx` (`medicos_codMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.agendamentos: ~2 rows (aproximadamente)
DELETE FROM `agendamentos`;
INSERT INTO `agendamentos` (`codAgendamentos`, `dataHora`, `pacientes_codPaciente`, `medicos_codMedico`) VALUES
	(1, '2024-11-08 09:30:00', 1, 2),
	(2, '2025-01-23 12:25:00', 2, 3);

-- Copiando estrutura para tabela tiago_victoria_clinica.atendimento
DROP TABLE IF EXISTS `atendimento`;
CREATE TABLE IF NOT EXISTS `atendimento` (
  `codAtendimento` int NOT NULL AUTO_INCREMENT,
  `pacientes_codPaciente` int NOT NULL,
  `medicos_codMedico` int NOT NULL,
  `dataAtendimento` date NOT NULL,
  `dataPagamento` date NOT NULL,
  `tipoPagamento` varchar(50) NOT NULL,
  PRIMARY KEY (`codAtendimento`,`pacientes_codPaciente`,`medicos_codMedico`),
  KEY `fk_pacientes_has_medicos_medicos1_idx` (`medicos_codMedico`),
  KEY `fk_pacientes_has_medicos_pacientes1_idx` (`pacientes_codPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.atendimento: ~2 rows (aproximadamente)
DELETE FROM `atendimento`;
INSERT INTO `atendimento` (`codAtendimento`, `pacientes_codPaciente`, `medicos_codMedico`, `dataAtendimento`, `dataPagamento`, `tipoPagamento`) VALUES
	(1, 1, 1, '2024-11-06', '2024-11-07', 'Crédito'),
	(2, 1, 2, '2024-12-10', '2024-12-15', 'Débito');

-- Copiando estrutura para tabela tiago_victoria_clinica.cargofuncionario
DROP TABLE IF EXISTS `cargofuncionario`;
CREATE TABLE IF NOT EXISTS `cargofuncionario` (
  `codCargo` int NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(50) NOT NULL,
  PRIMARY KEY (`codCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.cargofuncionario: ~4 rows (aproximadamente)
DELETE FROM `cargofuncionario`;
INSERT INTO `cargofuncionario` (`codCargo`, `nomeCargo`) VALUES
	(1, 'Faxineiro'),
	(2, 'Recepcionista'),
	(3, 'Segurança'),
	(4, 'Enfermeiro');

-- Copiando estrutura para tabela tiago_victoria_clinica.dadosconsulta
DROP TABLE IF EXISTS `dadosconsulta`;
CREATE TABLE IF NOT EXISTS `dadosconsulta` (
  `codConsulta` int NOT NULL AUTO_INCREMENT,
  `diagnostica` varchar(300) NOT NULL,
  `receita_codReceita` int NOT NULL,
  `atendimento_codAtendimento` int NOT NULL,
  PRIMARY KEY (`codConsulta`,`receita_codReceita`,`atendimento_codAtendimento`),
  KEY `fk_dadosConsulta_receita1_idx` (`receita_codReceita`),
  KEY `fk_dadosConsulta_atendimento1_idx` (`atendimento_codAtendimento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.dadosconsulta: ~3 rows (aproximadamente)
DELETE FROM `dadosconsulta`;
INSERT INTO `dadosconsulta` (`codConsulta`, `diagnostica`, `receita_codReceita`, `atendimento_codAtendimento`) VALUES
	(1, 'Tosse', 1, 1),
	(2, 'Dor de cabeça', 2, 2),
	(3, 'Tumor', 1, 2);

-- Copiando estrutura para tabela tiago_victoria_clinica.especialidade
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `codEspecialidade` int NOT NULL AUTO_INCREMENT,
  `nomeEspecialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`codEspecialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.especialidade: ~5 rows (aproximadamente)
DELETE FROM `especialidade`;
INSERT INTO `especialidade` (`codEspecialidade`, `nomeEspecialidade`) VALUES
	(1, 'Plástica'),
	(2, 'Dermatologista'),
	(3, 'Pediatra'),
	(4, 'Psiquiatria'),
	(5, 'Gastroenterologia');

-- Copiando estrutura para tabela tiago_victoria_clinica.funcionarios
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(150) NOT NULL,
  `salarioFuncionario` double(5,2) NOT NULL,
  `cargoFuncionario_codCargo` int NOT NULL,
  PRIMARY KEY (`codFuncionario`,`cargoFuncionario_codCargo`),
  KEY `fk_funcionarios_cargoFuncionario_idx` (`cargoFuncionario_codCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.funcionarios: ~3 rows (aproximadamente)
DELETE FROM `funcionarios`;
INSERT INTO `funcionarios` (`codFuncionario`, `nomeFuncionario`, `salarioFuncionario`, `cargoFuncionario_codCargo`) VALUES
	(1, 'Flávia Costa', 2000.00, 1),
	(2, 'Elisa Silva', 1050.50, 2),
	(3, 'Elias Franco', 1500.00, 3);

-- Copiando estrutura para tabela tiago_victoria_clinica.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `codMedico` int NOT NULL AUTO_INCREMENT,
  `nomeMedico` varchar(150) NOT NULL,
  `cpfMedico` varchar(30) NOT NULL,
  `crmMedico` varchar(20) NOT NULL,
  `emailMedico` varchar(100) DEFAULT NULL,
  `especialidade_codEspecialidade` varchar(20) NOT NULL,
  PRIMARY KEY (`codMedico`,`especialidade_codEspecialidade`),
  KEY `fk_medicos_especialidades1_idx` (`especialidade_codEspecialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.medicos: ~3 rows (aproximadamente)
DELETE FROM `medicos`;
INSERT INTO `medicos` (`codMedico`, `nomeMedico`, `cpfMedico`, `crmMedico`, `emailMedico`, `especialidade_codEspecialidade`) VALUES
	(4, 'Luciana Vieira', '124.786.097-97', 'CRM/SP 123773', 'luciana.vieira@yahoo.com', '1'),
	(5, 'Flávio Vilhena', '342.796.808-01', 'CRM/MG 352521', 'flavio.vilhena@yahoo.com', '2'),
	(6, 'Leonardo Negretti', '341.736.345-00', 'CRM/MG 563673', 'leonardo.negretti@yahoo.com', '2');

-- Copiando estrutura para procedure tiago_victoria_clinica.p_inseredadosconsulta
DROP PROCEDURE IF EXISTS `p_inseredadosconsulta`;
DELIMITER //
CREATE PROCEDURE `p_inseredadosconsulta`(
	IN `diagnosticaNovo` VARCHAR(300),
	IN `receita_codReceitaNovo` INT,
	IN `atendimento_codAtendimentoNovo` INT
)
BEGIN
		INSERT INTO dadosconsulta(diagnostica, receita_codReceita, atendimento_codAtendimento) VALUES(diagnosticaNovo, receita_codReceitaNovo, atendimento_codAtendimentoNovo);
	SELECT * FROM dadosconsulta;
END//
DELIMITER ;

-- Copiando estrutura para tabela tiago_victoria_clinica.pacientes
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `codPaciente` int NOT NULL AUTO_INCREMENT,
  `nomePaciente` varchar(150) NOT NULL,
  `cpfPaciente` varchar(30) NOT NULL,
  `telefonePaciente` varchar(40) DEFAULT NULL,
  `emailPaciente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.pacientes: ~3 rows (aproximadamente)
DELETE FROM `pacientes`;
INSERT INTO `pacientes` (`codPaciente`, `nomePaciente`, `cpfPaciente`, `telefonePaciente`, `emailPaciente`) VALUES
	(1, 'Tiago Masaro', '12968505602', '99956-7856', 'tiago.masaro@yahoo.com'),
	(2, 'Victória Caixeta', '13658915632', '99975-6854', 'victoria.caixeta@email.com'),
	(3, 'Priscila Santos', '12945863202', '99685-2634', 'priscila.santos@hotmail.com');

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraMedico
DROP PROCEDURE IF EXISTS `p_alteraMedico`;
DELIMITER //
CREATE PROCEDURE `p_alteraMedico`(
	IN `codMedicoAltera` INT,
	IN `nomeMedicoAltera` VARCHAR(150),
	IN `cpfMedicoAltera` VARCHAR(30),
	IN `crmMedicoAltera` VARCHAR(20),
	IN `emailMedicoAltera` VARCHAR(100),
	IN `especialidade_codEspecialidadeAltera` VARCHAR(20)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM medicos WHERE codMedico = codMedicoAltera;
	
	if (@contador = 0)
		then SELECT "Médico não encontrado!" AS erro;
		ELSE UPDATE medicos SET nomeMedico = nomeMedicoAltera, cpfMedico = cpfMedicoAltera, crmMedico = crmMedicoAltera, 
		emailMedico = emailMedicoAltera, especialidade_codEspecialidade = especialidade_codEspecialidadeAltera
				WHERE codMedico = codMedicoAltera;
			
	END if;
		SELECT * FROM medicos;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraPaciente
DROP PROCEDURE IF EXISTS `p_alteraPaciente`;
DELIMITER //
CREATE PROCEDURE `p_alteraPaciente`(
	IN `codPacienteAltera` INT,
	IN `nomePacienteAltera` VARCHAR(150),
	IN `cpfPacienteAltera` VARCHAR(30),
	IN `telefonePacienteAltera` VARCHAR(40),
	IN `emailPacienteAltera` VARCHAR(100)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM pacientes WHERE codPaciente = codPacienteAltera;
	
	if (@contador = 0)
		then SELECT "Paciente não encontrado!" AS erro;
		ELSE UPDATE pacientes SET nomePaciente = nomePacienteAltera, cpfPaciente = cpfPacienteAltera, telefonePaciente = telefonePacienteAltera, 
		emailPaciente = emailPacienteAltera
				WHERE codPaciente = codPacienteAltera;
			
	END if;
		SELECT * FROM pacientes;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereAgendamento
DROP PROCEDURE IF EXISTS `p_insereAgendamento`;
DELIMITER //
CREATE PROCEDURE `p_insereAgendamento`(
	IN `dataHoraNovo` DATETIME,
	IN `pacientes_codPacienteNovo` INT,
	IN `medicos_codMedicoNovo` INT
)
BEGIN
	INSERT INTO agendamentos(dataHora, pacientes_codPaciente, medicos_codMedico) 
	VALUES(dataHoraNovo, pacientes_codPacienteNovo, medicos_codMedicoNovo);
	SELECT * FROM agendamentos;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereAtendimento
DROP PROCEDURE IF EXISTS `p_insereAtendimento`;
DELIMITER //
CREATE PROCEDURE `p_insereAtendimento`(
	IN `pacientes_codPacienteNovo` INT,
	IN `medicos_codMedicoNovo` INT,
	IN `dataAtendimentoNovo` DATE,
	IN `dataPagamentoNovo` DATE,
	IN `tipoPagamentoNovo` VARCHAR(50)
)
BEGIN
	INSERT INTO atendimento(pacientes_codPaciente, medicos_codMedico, dataAtendimento, dataPagamento, tipoPagamento) 
	VALUES(pacientes_codPacienteNovo, medicos_codMedicoNovo, dataAtendimentoNovo, dataPagamentoNovo, tipoPagamentoNovo);
	SELECT * FROM atendimento;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereCargoFuncionario
DROP PROCEDURE IF EXISTS `p_insereCargoFuncionario`;
DELIMITER //
CREATE PROCEDURE `p_insereCargoFuncionario`(
	IN `nomeNovo` VARCHAR(50)
)
BEGIN
	INSERT INTO cargofuncionario(nomeCargo) VALUES(nomeNovo);
	SELECT * FROM cargofuncionario ;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereEspecialidade
DROP PROCEDURE IF EXISTS `p_insereEspecialidade`;
DELIMITER //
CREATE PROCEDURE `p_insereEspecialidade`(
	IN `nomeNovo` VARCHAR(50)
)
BEGIN
	INSERT INTO especialidade(nomeEspecialidade) VALUES(nomeNovo);
	SELECT * FROM especialidade;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereFuncionario
DROP PROCEDURE IF EXISTS `p_insereFuncionario`;
DELIMITER //
CREATE PROCEDURE `p_insereFuncionario`(
	IN `nomeFuncionarioNovo` VARCHAR(150),
	IN `salarioFuncionarioNovo` DOUBLE,
	IN `cargoFuncionario_codCargoNovo` INT
)
BEGIN
	INSERT INTO funcionarios(nomeFuncionario, salarioFuncionario, cargoFuncionario_codCargo) VALUES(nomeFuncionarioNovo, salarioFuncionarioNovo, cargoFuncionario_codCargoNovo);
	SELECT * FROM funcionarios;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereMedico
DROP PROCEDURE IF EXISTS `p_insereMedico`;
DELIMITER //
CREATE PROCEDURE `p_insereMedico`(
	IN `nomeNovo` VARCHAR(150),
	IN `cpfNovo` VARCHAR(30),
	IN `crmNovo` VARCHAR(20),
	IN `emailNovo` VARCHAR(100),
	IN `especialidade_codEspecialidadeNovo` VARCHAR(20)
)
BEGIN

	INSERT INTO medicos(nomeMedico, cpfMedico, crmMedico, emailMedico, especialidade_codEspecialidade) VALUES(nomeNovo, cpfNovo, crmNovo, emailNovo, especialidade_codEspecialidadeNovo);
	SELECT * FROM medicos;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_inserePaciente
DROP PROCEDURE IF EXISTS `p_inserePaciente`;
DELIMITER //
CREATE PROCEDURE `p_inserePaciente`(
	IN `nomeNovo` VARCHAR(150),
	IN `cpfNovo` VARCHAR(30),
	IN `telefoneNovo` VARCHAR(40),
	IN `emailNovo` VARCHAR(100)
)
BEGIN
		INSERT INTO pacientes(nomePaciente, cpfPaciente, telefonePaciente, emailPaciente) VALUES(nomeNovo, cpfNovo, telefoneNovo, emailNovo);
		SELECT * FROM pacientes;
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereReceita
DROP PROCEDURE IF EXISTS `p_insereReceita`;
DELIMITER //
CREATE PROCEDURE `p_insereReceita`(
	IN `remediosPrescritosNovo` VARCHAR(250)
)
BEGIN
	INSERT INTO receita(remediosPrescritos) VALUES(remediosPrescritosNovo);
	SELECT * FROM receita ;
END//
DELIMITER ;

-- Copiando estrutura para tabela tiago_victoria_clinica.receita
DROP TABLE IF EXISTS `receita`;
CREATE TABLE IF NOT EXISTS `receita` (
  `codReceita` int NOT NULL AUTO_INCREMENT,
  `remediosPrescritos` varchar(250) NOT NULL,
  PRIMARY KEY (`codReceita`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.receita: ~3 rows (aproximadamente)
DELETE FROM `receita`;
INSERT INTO `receita` (`codReceita`, `remediosPrescritos`) VALUES
	(1, 'Dipirona'),
	(2, 'Amoxicilina'),
	(3, 'Aspirina');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
