-- MySQL Script generated by MySQL Workbench
-- Fri Apr 12 10:35:10 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema acolhimento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema acolhimento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `acolhimento` DEFAULT CHARACTER SET utf8 ;
USE `acolhimento` ;

-- -----------------------------------------------------
-- Table `acolhimento`.`residencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acolhimento`.`residencia` ;

CREATE TABLE IF NOT EXISTS `acolhimento`.`residencia` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(150) NULL,
  `numero` VARCHAR(45) NULL,
  `bairro` VARCHAR(150) NULL,
  `cidade` VARCHAR(150) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acolhimento`.`cartaosus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acolhimento`.`cartaosus` ;

CREATE TABLE IF NOT EXISTS `acolhimento`.`cartaosus` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `cgs` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC),
  UNIQUE INDEX `cgs_UNIQUE` (`cgs` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acolhimento`.`profissao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acolhimento`.`profissao` ;

CREATE TABLE IF NOT EXISTS `acolhimento`.`profissao` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `cbo` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `cbo_UNIQUE` (`cbo` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acolhimento`.`paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acolhimento`.`paciente` ;

CREATE TABLE IF NOT EXISTS `acolhimento`.`paciente` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `naturalidade` VARCHAR(150) NOT NULL,
  `nomemae` VARCHAR(150) NOT NULL,
  `datanascimento` VARCHAR(45) NOT NULL,
  `cartaosus_codigo` INT NOT NULL,
  `residencia_codigo` INT NOT NULL,
  `profissao_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  INDEX `fk_paciente_cartaosus_idx` (`cartaosus_codigo` ASC),
  INDEX `fk_paciente_residencia1_idx` (`residencia_codigo` ASC),
  INDEX `fk_paciente_profissao1_idx` (`profissao_codigo` ASC),
  CONSTRAINT `fk_paciente_cartaosus`
    FOREIGN KEY (`cartaosus_codigo`)
    REFERENCES `acolhimento`.`cartaosus` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_residencia1`
    FOREIGN KEY (`residencia_codigo`)
    REFERENCES `acolhimento`.`residencia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_profissao1`
    FOREIGN KEY (`profissao_codigo`)
    REFERENCES `acolhimento`.`profissao` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
