-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema practica_spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema practica_spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica_spotify` DEFAULT CHARACTER SET utf8 ;
USE `practica_spotify` ;

-- -----------------------------------------------------
-- Table `practica_spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`artista` (
  `idartista` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `imagen` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idartista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`pais` (
  `idpais` INT NOT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`discografica` (
  `iddiscografica` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`iddiscografica`),
  INDEX `fk_discografica_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_discografica_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `practica_spotify`.`pais` (`idpais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`album` (
  `idalbum` INT NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `imagenportada` VARCHAR(45) NULL DEFAULT NULL,
  `artista_idartista` INT NOT NULL,
  `discografica_iddiscografica` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  INDEX `fk_album_artista1_idx` (`artista_idartista` ASC) VISIBLE,
  INDEX `fk_album_discografica1_idx` (`discografica_iddiscografica` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_idartista`)
    REFERENCES `practica_spotify`.`artista` (`idartista`),
  CONSTRAINT `fk_album_discografica1`
    FOREIGN KEY (`discografica_iddiscografica`)
    REFERENCES `practica_spotify`.`discografica` (`iddiscografica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`cancion` (
  `idcancion` INT NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `duracion` DOUBLE NULL DEFAULT NULL,
  `cantreproduccion` INT NULL DEFAULT NULL,
  `cantlikes` INT NULL DEFAULT NULL,
  `album_idalbum` INT NOT NULL,
  PRIMARY KEY (`idcancion`),
  INDEX `fk_cancion_album1_idx` (`album_idalbum` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `practica_spotify`.`album` (`idalbum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`genero` (
  `idgenero` INT NOT NULL,
  `genero` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`genero_cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`genero_cancion` (
  `idgenero_cancion` INT NOT NULL,
  `cancion_idcancion` INT NOT NULL,
  `genero_idgenero` INT NOT NULL,
  PRIMARY KEY (`idgenero_cancion`),
  INDEX `fk_genero_cancion_cancion_idx` (`cancion_idcancion` ASC) VISIBLE,
  INDEX `fk_genero_cancion_genero1_idx` (`genero_idgenero` ASC) VISIBLE,
  CONSTRAINT `fk_genero_cancion_cancion`
    FOREIGN KEY (`cancion_idcancion`)
    REFERENCES `practica_spotify`.`cancion` (`idcancion`),
  CONSTRAINT `fk_genero_cancion_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `practica_spotify`.`genero` (`idgenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`usuario` (
  `idusuario` INT NOT NULL,
  `nombreusuario` VARCHAR(45) NULL DEFAULT NULL,
  `nyap` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nac` DATE NULL DEFAULT NULL,
  `sexo` VARCHAR(45) NULL DEFAULT NULL,
  `CP` VARCHAR(8) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `fechapassword` DATE NULL DEFAULT NULL,
  `tipousuario` VARCHAR(45) NULL DEFAULT NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `practica_spotify`.`pais` (`idpais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`playlist` (
  `idplaylist` INT NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `cantcanciones` INT NULL DEFAULT NULL,
  `fechacreacion` DATETIME NULL DEFAULT NULL,
  `fechaeliminada` DATETIME NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idplaylist`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `practica_spotify`.`usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `practica_spotify`.`playlist_cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica_spotify`.`playlist_cancion` (
  `idplaylist_cancion` INT NOT NULL,
  `playlist_idplaylist` INT NOT NULL,
  `cancion_idcancion` INT NOT NULL,
  PRIMARY KEY (`idplaylist_cancion`),
  INDEX `fk_playlist_cancion_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  INDEX `fk_playlist_cancion_cancion1_idx` (`cancion_idcancion` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_cancion_cancion1`
    FOREIGN KEY (`cancion_idcancion`)
    REFERENCES `practica_spotify`.`cancion` (`idcancion`),
  CONSTRAINT `fk_playlist_cancion_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `practica_spotify`.`playlist` (`idplaylist`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
