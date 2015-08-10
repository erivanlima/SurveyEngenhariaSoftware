
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------------------------------------------------------
-- Schema mysurvey
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `mysurvey` ;
CREATE SCHEMA IF NOT EXISTS `mysurvey` ;

-- ----------------------------------------------------------------------------
-- Table TB_ENTREVISTADO
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_ENTREVISTADO` (
  `idTB_ENTREVISTADO` INT NOT NULL AUTO_INCREMENT ,
  `NOME` VARCHAR(45) NULL ,
  `EMAIL` VARCHAR(45) NULL ,
  `SOBRENOME` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTB_ENTREVISTADO`) ,
  INDEX `TB_RESPOSTA_FKIndex2` (`idTB_ENTREVISTADO` ASC) );

-- ----------------------------------------------------------------------------
-- Table TB_RESPONSAVEL
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_RESPONSAVEL` (
  `id_Responsavel` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `sobrenome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_Responsavel`) ,
  INDEX `TB_SURVEY_FKIndex1` (`id_Responsavel` ASC) );

-- ----------------------------------------------------------------------------
-- Table TB_SURVEY
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_SURVEY` (
  `id_Survey` INT NOT NULL AUTO_INCREMENT ,
  `TB_RESPONSAVEL_id_Responsavel` INT NOT NULL ,
  `Titulo` VARCHAR(45) NOT NULL ,
  `Subtitulo` VARCHAR(45) NOT NULL ,
  `Data_Criacao` DATETIME NOT NULL ,
  `Data_fim` DATETIME NULL ,
  `flag_ativo` TINYINT(1) NOT NULL ,
  `UnicaResposta` TINYINT(1) NOT NULL ,
  `RandomizeQuestoes` TINYINT(1) NOT NULL ,
  `SenhaAcesso` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_Survey`) ,
  INDEX `TB_QUESTAO_FKIndex1` (`id_Survey` ASC) ,
  CONSTRAINT `TB_SURVEY_FKIndex1`
    FOREIGN KEY (`TB_RESPONSAVEL_id_Responsavel` )
    REFERENCES `mysurvey`.`TB_RESPONSAVEL` (`id_Responsavel` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table TB_QUESTAO
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_QUESTAO` (
  `id_Questao` INT NOT NULL AUTO_INCREMENT ,
  `TB_SURVEY_id_Survey` INT NOT NULL ,
  `Tipo` VARCHAR(10) NULL ,
  `Escolha` TINYINT(1) NOT NULL ,
  `TemOutro` TINYINT(1) NOT NULL ,
  `Pergunta` LONGTEXT NOT NULL ,
  `Img` LONGBLOB NULL ,
  `Randomica` TINYINT(1) NULL ,
  `Obrigatoria` TINYINT(1) NULL ,
  `EhCodigo` TINYINT(1) NULL ,
  `Linguagem` VARCHAR(10) NULL ,
  PRIMARY KEY (`id_Questao`) ,
  INDEX `TB_CLASSE_FKIndex1` (`id_Questao` ASC) ,
  INDEX `TB_ITENS_DA_QUESTAO_FKIndex1` (`id_Questao` ASC) ,
  INDEX `TB_RESPOSTA_FKIndex1` (`id_Questao` ASC) ,
  CONSTRAINT `TB_QUESTAO_FKIndex1`
    FOREIGN KEY (`TB_SURVEY_id_Survey` )
    REFERENCES `mysurvey`.`TB_SURVEY` (`id_Survey` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table TB_CLASSE
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_CLASSE` (
  `id_Classe` INT NOT NULL AUTO_INCREMENT ,
  `TB_QUESTAO_id_Questao` INT NOT NULL ,
  `Codigo` LONGTEXT NULL ,
  PRIMARY KEY (`id_Classe`) ,
  CONSTRAINT `TB_CLASSE_FKIndex1`
    FOREIGN KEY (`TB_QUESTAO_id_Questao` )
    REFERENCES `mysurvey`.`TB_QUESTAO` (`id_Questao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table TB_ITENS_DA_QUESTAO
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_ITENS_DA_QUESTAO` (
  `idTB_ITENS_DA_QUESTAO` INT NOT NULL AUTO_INCREMENT ,
  `TB_QUESTAO_id_Questao` INT NOT NULL ,
  `Item` LONGTEXT NULL ,
  PRIMARY KEY (`idTB_ITENS_DA_QUESTAO`) ,
  CONSTRAINT `TB_ITENS_DA_QUESTAO_FKIndex1`
    FOREIGN KEY (`TB_QUESTAO_id_Questao` )
    REFERENCES `mysurvey`.`TB_QUESTAO` (`id_Questao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table TB_RESPOSTA
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `TB_RESPOSTA` (
  `id_Resposta` INT NOT NULL AUTO_INCREMENT ,
  `TB_ENTREVISTADO_idTB_ENTREVISTADO` INT NOT NULL ,
  `TB_QUESTAO_id_Questao` INT NOT NULL ,
  `Resposta` LONGTEXT NULL ,
  `Item` LONGTEXT NULL ,
  `OutroTxt` LONGTEXT NULL ,
  PRIMARY KEY (`id_Resposta`) ,
  CONSTRAINT `TB_RESPOSTA_FKIndex1`
    FOREIGN KEY (`TB_QUESTAO_id_Questao` )
    REFERENCES `mysurvey`.`TB_QUESTAO` (`id_Questao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TB_RESPOSTA_FKIndex2`
    FOREIGN KEY (`TB_ENTREVISTADO_idTB_ENTREVISTADO` )
    REFERENCES `mysurvey`.`TB_ENTREVISTADO` (`idTB_ENTREVISTADO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
SET FOREIGN_KEY_CHECKS = 1;;
