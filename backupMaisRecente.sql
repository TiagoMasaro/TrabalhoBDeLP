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
  `dataHora` varchar(50) NOT NULL DEFAULT '',
  `pacientes_codPaciente` int NOT NULL,
  `medicos_codMedico` int NOT NULL,
  PRIMARY KEY (`codAgendamentos`) USING BTREE,
  KEY `fk_agendamentos_pacientes1_idx` (`pacientes_codPaciente`),
  KEY `fk_agendamentos_medicos1_idx` (`medicos_codMedico`),
  CONSTRAINT `FKMedico` FOREIGN KEY (`medicos_codMedico`) REFERENCES `medicos` (`codMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKPaciente` FOREIGN KEY (`pacientes_codPaciente`) REFERENCES `pacientes` (`codPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.agendamentos: ~1 rows (aproximadamente)
DELETE FROM `agendamentos`;
INSERT INTO `agendamentos` (`codAgendamentos`, `dataHora`, `pacientes_codPaciente`, `medicos_codMedico`) VALUES
	(3, '12/12/2024  08:24', 7, 24);

-- Copiando estrutura para tabela tiago_victoria_clinica.atendimento
DROP TABLE IF EXISTS `atendimento`;
CREATE TABLE IF NOT EXISTS `atendimento` (
  `codAtendimento` int NOT NULL AUTO_INCREMENT,
  `pacientes_codPaciente` int NOT NULL,
  `medicos_codMedico` int NOT NULL,
  `dataAtendimento` varchar(50) NOT NULL DEFAULT '',
  `dataPagamento` varchar(50) NOT NULL DEFAULT '',
  `tipoPagamento` varchar(50) NOT NULL,
  PRIMARY KEY (`codAtendimento`) USING BTREE,
  KEY `fk_pacientes_has_medicos_medicos1_idx` (`medicos_codMedico`),
  KEY `fk_pacientes_has_medicos_pacientes1_idx` (`pacientes_codPaciente`),
  CONSTRAINT `FK_medico` FOREIGN KEY (`medicos_codMedico`) REFERENCES `medicos` (`codMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paciente` FOREIGN KEY (`pacientes_codPaciente`) REFERENCES `pacientes` (`codPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.atendimento: ~0 rows (aproximadamente)
DELETE FROM `atendimento`;

-- Copiando estrutura para tabela tiago_victoria_clinica.cargofuncionario
DROP TABLE IF EXISTS `cargofuncionario`;
CREATE TABLE IF NOT EXISTS `cargofuncionario` (
  `codCargo` int NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`codCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.cargofuncionario: ~0 rows (aproximadamente)
DELETE FROM `cargofuncionario`;

-- Copiando estrutura para tabela tiago_victoria_clinica.dadosconsulta
DROP TABLE IF EXISTS `dadosconsulta`;
CREATE TABLE IF NOT EXISTS `dadosconsulta` (
  `codConsulta` int NOT NULL AUTO_INCREMENT,
  `diagnostica` varchar(300) NOT NULL,
  `receita_codReceita` int NOT NULL,
  `atendimento_codAtendimento` int NOT NULL,
  PRIMARY KEY (`codConsulta`) USING BTREE,
  KEY `fk_dadosConsulta_receita1_idx` (`receita_codReceita`),
  KEY `fk_dadosConsulta_atendimento1_idx` (`atendimento_codAtendimento`),
  CONSTRAINT `fk_atendimento` FOREIGN KEY (`atendimento_codAtendimento`) REFERENCES `atendimento` (`codAtendimento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_receita` FOREIGN KEY (`receita_codReceita`) REFERENCES `receita` (`codReceita`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.dadosconsulta: ~0 rows (aproximadamente)
DELETE FROM `dadosconsulta`;

-- Copiando estrutura para tabela tiago_victoria_clinica.especialidade
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `codEspecialidade` int NOT NULL AUTO_INCREMENT,
  `nomeEspecialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`codEspecialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.especialidade: ~1 rows (aproximadamente)
DELETE FROM `especialidade`;
INSERT INTO `especialidade` (`codEspecialidade`, `nomeEspecialidade`) VALUES
	(9, 'Dermatologista');

-- Copiando estrutura para tabela tiago_victoria_clinica.funcionarios
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(150) NOT NULL,
  `salarioFuncionario` double(5,2) NOT NULL,
  `cargoFuncionario_codCargo` int NOT NULL,
  PRIMARY KEY (`codFuncionario`) USING BTREE,
  KEY `fk_funcionarios_cargoFuncionario_idx` (`cargoFuncionario_codCargo`),
  CONSTRAINT `fkFuncionario` FOREIGN KEY (`cargoFuncionario_codCargo`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.funcionarios: ~0 rows (aproximadamente)
DELETE FROM `funcionarios`;

-- Copiando estrutura para tabela tiago_victoria_clinica.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `codMedico` int NOT NULL AUTO_INCREMENT,
  `nomeMedico` varchar(150) NOT NULL,
  `cpfMedico` varchar(30) NOT NULL,
  `crmMedico` varchar(20) NOT NULL,
  `emailMedico` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `especialidadeMedico` int NOT NULL,
  PRIMARY KEY (`codMedico`) USING BTREE,
  KEY `FK_especialidadeMedico` (`especialidadeMedico`) USING BTREE,
  CONSTRAINT `FK_especialidadeMedico` FOREIGN KEY (`especialidadeMedico`) REFERENCES `especialidade` (`codEspecialidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.medicos: ~1 rows (aproximadamente)
DELETE FROM `medicos`;
INSERT INTO `medicos` (`codMedico`, `nomeMedico`, `cpfMedico`, `crmMedico`, `emailMedico`, `especialidadeMedico`) VALUES
	(24, 'caio', '111111111111111111111', '33333333333333333', 'teste', 9);

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
  `telefonePaciente` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `emailPaciente` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`codPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela tiago_victoria_clinica.pacientes: ~1 rows (aproximadamente)
DELETE FROM `pacientes`;
INSERT INTO `pacientes` (`codPaciente`, `nomePaciente`, `cpfPaciente`, `telefonePaciente`, `emailPaciente`) VALUES
	(7, 'pietra', '6868868', '6666666666666666', 'teste2');

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraAgendamento
DROP PROCEDURE IF EXISTS `p_alteraAgendamento`;
DELIMITER //
CREATE PROCEDURE `p_alteraAgendamento`(
	IN `codAgendamentosAltera` INT,
	IN `pacientes_codPacienteAltera` INT,
	IN `medicos_codMedicoAltera` INT,
	IN `dataHoraAltera` DATETIME
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM agendamentos WHERE codAgendamentos = codAgendamentosAltera;
	
	if (@contador = 0)
		then SELECT "Agendamento não existe!" AS erro;
		ELSE UPDATE agendamentos SET pacientes_codPaciente = pacientes_codPacienteAltera, medicos_codMedico = medicos_codMedicoAltera,
		dataHora = dataHoraAltera
				WHERE codAgendamentos = codAgendamentosAltera  ;
			
	END if;
		SELECT * FROM agendamentos;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraAtendimento
DROP PROCEDURE IF EXISTS `p_alteraAtendimento`;
DELIMITER //
CREATE PROCEDURE `p_alteraAtendimento`(
	IN `codAtendimentoAltera` INT,
	IN `pacientes_codPacienteAltera` INT,
	IN `medicos_codMedicoAltera` INT,
	IN `dataAtendimentoAltera` DATE,
	IN `dataPagamentoAltera` DATE,
	IN `tipoPagamentoAltera` VARCHAR(50)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM atendimento WHERE codAtendimento = codAtendimentoAltera;
	
	if (@contador = 0)
		then SELECT "Atendimento não existe!" AS erro;
		ELSE UPDATE atendimento SET pacientes_codPaciente = pacientes_codPacienteAltera, medicos_codMedico = medicos_codMedicoAltera, 
		dataAtendimento = dataAtendimentoAltera, dataPagamento = dataPagamentoAltera, tipoPagamento = tipoPagamentoAltera
		
				WHERE codAtendimento = codAtendimentoAltera  ;
			
	END if;
		SELECT * FROM atendimento;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraCargoFuncionario
DROP PROCEDURE IF EXISTS `p_alteraCargoFuncionario`;
DELIMITER //
CREATE PROCEDURE `p_alteraCargoFuncionario`(
	IN `codCargoAltera` INT,
	IN `nomeCargoAltera` VARCHAR(50)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM cargofuncionario WHERE codCargo = codCargoAltera;
	
	if (@contador = 0)
		then SELECT "Cargo não encontrado!" AS erro;
		ELSE UPDATE cargofuncionario SET nomeCargo = nomeCargoAltera
				WHERE codCargo = codCargoAltera  ;
			
	END if;
		SELECT * FROM cargofuncionario;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraDadosConsulta
DROP PROCEDURE IF EXISTS `p_alteraDadosConsulta`;
DELIMITER //
CREATE PROCEDURE `p_alteraDadosConsulta`(
	IN `codConsultaAltera` INT,
	IN `dignosticoAltera` VARCHAR(300),
	IN `codReceitaAltera` INT,
	IN `codAtendimentoAltera` INT
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM dadosConsulta WHERE codConsulta = codConsultaAltera;
	
	if (@contador = 0)
		then SELECT "Consulta não existe!" AS erro;
		ELSE UPDATE dadosConsulta SET diagnostica = dignosticoAltera, receita_codReceita = codReceitaAltera, atendimento_codAtendimento = codAtendimentoAltera
		
				WHERE codConsulta = codConsultaAltera  ;
			
	END if;
		SELECT * FROM dadosConsulta;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraEspecialidade
DROP PROCEDURE IF EXISTS `p_alteraEspecialidade`;
DELIMITER //
CREATE PROCEDURE `p_alteraEspecialidade`(
	IN `codEspecialidadeAltera` INT,
	IN `nomeEspecialidadeAltera` VARCHAR(50)
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM especialidade WHERE codEspecialidade = codEspecialidadeAltera;
	
	if (@contador = 0)
		then SELECT "Especialidade não encontrada!" AS erro;
		ELSE UPDATE especialidade SET nomeEspecialidade = nomeEspecialidadeAltera
				WHERE codEspecialidade = codEspecialidadeAltera  ;
			
	END if;
		SELECT * FROM especialidade;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraFuncionario
DROP PROCEDURE IF EXISTS `p_alteraFuncionario`;
DELIMITER //
CREATE PROCEDURE `p_alteraFuncionario`(
	IN `funcionarioAltera` INT,
	IN `nomeFuncionarioAltera` VARCHAR(150),
	IN `salarioFuncionarioAltera` DOUBLE,
	IN `cargoFuncionarioAltera` INT
)
BEGIN
		SELECT COUNT(*) INTO @contador FROM funcionarios WHERE codFuncionario = funcionarioAltera;
	
	if (@contador = 0)
		then SELECT "Funcionário não encontrado!" AS erro;
		ELSE UPDATE funcionarios SET nomeFuncionario = nomeFuncionarioAltera, salarioFuncionario = salarioFuncionarioAltera, cargoFuncionario_codCargo = cargoFuncionarioAltera
		
				WHERE codFuncionario = funcionarioAltera  ;
			
	END if;
		SELECT * FROM funcionarios;
	
END//
DELIMITER ;

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

-- Copiando estrutura para procedure tiago_victoria_clinica.p_alteraReceita
DROP PROCEDURE IF EXISTS `p_alteraReceita`;
DELIMITER //
CREATE PROCEDURE `p_alteraReceita`(
	IN `receitaAltera` INT,
	IN `remediosAltera` VARCHAR(250)
)
BEGIN

		SELECT COUNT(*) INTO @contador FROM receita WHERE codReceita = receitaAltera ;
	
	if (@contador = 0)
		then SELECT "Receita não prescrita!" AS erro;
		ELSE UPDATE receita  SET remediosPrescritos = remediosAltera
				WHERE codReceita = receitaAltera ;
			
	END if;
		SELECT * FROM receita ;
	
END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaAgendamento
DROP PROCEDURE IF EXISTS `p_apagaAgendamento`;
DELIMITER //
CREATE PROCEDURE `p_apagaAgendamento`(
	IN `codAgendamentosApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM agendamentos WHERE codAgendamentos = codAgendamentosApagar;
	if (@contador = 0)
		then SELECT "Agendamento não existe!" AS erro;
		else
			DELETE FROM agendamentos WHERE codAgendamentos = codAgendamentosApagar;
			SELECT * FROM agendamentos;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaAtendimento
DROP PROCEDURE IF EXISTS `p_apagaAtendimento`;
DELIMITER //
CREATE PROCEDURE `p_apagaAtendimento`(
	IN `codAtendimentoApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM atendimento WHERE codAtendimento = codAtendimentoApagar;
	if (@contador = 0)
		then SELECT "Atendimento não existe!" AS erro;
		else
			DELETE FROM atendimento WHERE codAtendimento = codAtendimentoApagar;
			SELECT * FROM atendimento;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaCargo
DROP PROCEDURE IF EXISTS `p_apagaCargo`;
DELIMITER //
CREATE PROCEDURE `p_apagaCargo`(
	IN `codCargoApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM cargofuncionario WHERE codCargo = codCargoApagar;
	if (@contador = 0)
		then SELECT "Cargo não existe!" AS erro;
		else
			DELETE FROM cargofuncionario WHERE codCargo = codCargoApagar;
			SELECT * FROM cargofuncionario;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaDadosConsulta
DROP PROCEDURE IF EXISTS `p_apagaDadosConsulta`;
DELIMITER //
CREATE PROCEDURE `p_apagaDadosConsulta`(
	IN `codConsultaApaga` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM dadosconsulta WHERE codConsulta = codConsultaApaga;
	if (@contador = 0)
		then SELECT "Consulta não existe!" AS erro;
		else
			DELETE FROM dadosconsulta WHERE codConsulta = codConsultaApaga;
			SELECT * FROM dadosconsulta;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaEspecialidade
DROP PROCEDURE IF EXISTS `p_apagaEspecialidade`;
DELIMITER //
CREATE PROCEDURE `p_apagaEspecialidade`(
	IN `codEspecialidadeApaga` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM especialidade WHERE codEspecialidade = codEspecialidadeApaga;
	if (@contador = 0)
		then SELECT "Especialidade não cadastrada!" AS erro;
		else
			DELETE FROM especialidade WHERE codEspecialidade = codEspecialidadeApaga;
			SELECT * FROM especialidade;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaFuncionario
DROP PROCEDURE IF EXISTS `p_apagaFuncionario`;
DELIMITER //
CREATE PROCEDURE `p_apagaFuncionario`(
	IN `codFuncionarioApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM funcionarios WHERE codFuncionario = codFuncionarioApagar;
	if (@contador = 0)
		then SELECT "Funcionário não cadastrado!" AS erro;
		else
			DELETE FROM funcionarios WHERE codFuncionario = codFuncionario;
			SELECT * FROM funcionarios;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaMedico
DROP PROCEDURE IF EXISTS `p_apagaMedico`;
DELIMITER //
CREATE PROCEDURE `p_apagaMedico`(
	IN `codMedicoApaga` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM medicos WHERE codMedico = codMedicoApaga;
	if (@contador = 0)
		then SELECT "Médico não cadastrado!" AS erro;
		else
			DELETE FROM medicos WHERE codMedico = codMedicoApaga;
			SELECT * FROM medicos;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaPaciente
DROP PROCEDURE IF EXISTS `p_apagaPaciente`;
DELIMITER //
CREATE PROCEDURE `p_apagaPaciente`(
	IN `codPacienteApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM pacientes WHERE codPaciente = codPacienteApagar;
	if (@contador = 0)
		then SELECT "Paciente não existe!" AS erro;
		else
			DELETE FROM pacientes WHERE codPaciente = codPacienteApagar;
			SELECT * FROM pacientes;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure tiago_victoria_clinica.p_apagaReceita
DROP PROCEDURE IF EXISTS `p_apagaReceita`;
DELIMITER //
CREATE PROCEDURE `p_apagaReceita`(
	IN `codReceitaApagar` INT
)
BEGIN

	SELECT COUNT(*) INTO @contador FROM receita WHERE codReceita = codReceitaApagar;
	if (@contador = 0)
		then SELECT "Receita não existe!" AS erro;
		else
			DELETE FROM receita WHERE codReceita = codReceitaApagar;
			SELECT * FROM receita;
	END if;

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

-- Copiando estrutura para procedure tiago_victoria_clinica.p_insereDadosConsulta
DROP PROCEDURE IF EXISTS `p_insereDadosConsulta`;
DELIMITER //
CREATE PROCEDURE `p_insereDadosConsulta`(
	IN `diagnosticoInsere` VARCHAR(300),
	IN `codReceitaInsere` INT,
	IN `codAtendimentoInsere` INT
)
BEGIN
	INSERT INTO dadosconsulta(diagnostica, receita_codReceita, atendimento_codAtendimento) VALUES(diagnosticoInsere, codReceitaInsere, codAtendimentoInsere);
	SELECT * FROM dadosconsulta;
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

-- Copiando dados para a tabela tiago_victoria_clinica.receita: ~0 rows (aproximadamente)
DELETE FROM `receita`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
