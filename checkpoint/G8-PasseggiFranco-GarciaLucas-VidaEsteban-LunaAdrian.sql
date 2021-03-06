-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DHTube` DEFAULT CHARACTER SET utf8 ;
USE `DHTube` ;

-- -----------------------------------------------------
-- Table `DHTube`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`pais` (
  `idpais` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`avatar` (
  `idavatar` INT NOT NULL,
  `url_avatar` VARCHAR(100) NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idavatar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`usuario` (
  `idusuario` INT NOT NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `nombre_usuario` VARCHAR(70) NULL,
  `fecha_nac` DATE NULL,
  `codigo_postal` VARCHAR(45) NULL,
  `pais_idpais` INT NOT NULL,
  `avatar_idavatar` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  INDEX `fk_usuario_avatar1_idx` (`avatar_idavatar` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `DHTube`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_avatar1`
    FOREIGN KEY (`avatar_idavatar`)
    REFERENCES `DHTube`.`avatar` (`idavatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`videos` (
  `idvideos` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `tamanio` DOUBLE NULL,
  `nombre_archivo` VARCHAR(45) NULL,
  `duracion` TIME NULL,
  `imagen` VARCHAR(100) NULL,
  `num_reproducciones` INT NULL,
  `usuario_idusuario` INT NOT NULL,
  `publico_privado` TINYINT NULL,
  `fecha_publicacion` DATE NULL,
  PRIMARY KEY (`idvideos`),
  INDEX `fk_videos_usuario_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_videos_usuario`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `DHTube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`reacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`reacciones` (
  `idreacciones` INT NOT NULL,
  `descripcion` VARCHAR(8) NULL,
  PRIMARY KEY (`idreacciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`video_reacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`video_reacciones` (
  `idvideo_reacciones` INT NOT NULL,
  `cantidad` INT NULL,
  `videos_idvideos` INT NOT NULL,
  `reacciones_idreacciones` INT NOT NULL,
  PRIMARY KEY (`idvideo_reacciones`),
  INDEX `fk_video_reacciones_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  INDEX `fk_video_reacciones_reacciones1_idx` (`reacciones_idreacciones` ASC) VISIBLE,
  CONSTRAINT `fk_video_reacciones_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `DHTube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_reacciones_reacciones1`
    FOREIGN KEY (`reacciones_idreacciones`)
    REFERENCES `DHTube`.`reacciones` (`idreacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`etiqueta` (
  `idetiqueta` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idetiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`etiqueta_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`etiqueta_videos` (
  `idetiqueta_videos` INT NOT NULL,
  `etiqueta_idetiqueta` INT NOT NULL,
  `videos_idvideos` INT NOT NULL,
  PRIMARY KEY (`idetiqueta_videos`),
  INDEX `fk_etiqueta_videos_etiqueta1_idx` (`etiqueta_idetiqueta` ASC) VISIBLE,
  INDEX `fk_etiqueta_videos_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_etiqueta_videos_etiqueta1`
    FOREIGN KEY (`etiqueta_idetiqueta`)
    REFERENCES `DHTube`.`etiqueta` (`idetiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_etiqueta_videos_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `DHTube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`likes_dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`likes_dislikes` (
  `idlikes_dislikes` INT NOT NULL,
  `descripcion` TINYINT NOT NULL,
  `videos_idvideos` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idlikes_dislikes`),
  INDEX `fk_likes_dislikes_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  UNIQUE INDEX `usuario_idusuario_UNIQUE` (`usuario_idusuario` ASC) VISIBLE,
  UNIQUE INDEX `videos_idvideos_UNIQUE` (`videos_idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_likes_dislikes_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `DHTube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `DHTube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`canales` (
  `idcanales` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `fecha_creacion` DATE NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idcanales`),
  INDEX `fk_canales_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_canales_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `DHTube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`playlist` (
  `idplaylist` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `usuario_idusuario` INT NOT NULL,
  `estado` TINYTEXT NULL,
  PRIMARY KEY (`idplaylist`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `DHTube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`playlist_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`playlist_video` (
  `idplaylist_video` INT NOT NULL,
  `videos_idvideos` INT NOT NULL,
  `playlist_idplaylist` INT NOT NULL,
  PRIMARY KEY (`idplaylist_video`),
  INDEX `fk_playlist_video_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  INDEX `fk_playlist_video_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_video_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `DHTube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_video_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `DHTube`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`video_reaccion_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`video_reaccion_usuario` (
  `idvideo_reaccion_usuario` INT NOT NULL,
  `fecha` DATE NULL,
  `reacciones_idreacciones` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `videos_idvideos` INT NOT NULL,
  PRIMARY KEY (`idvideo_reaccion_usuario`),
  INDEX `fk_video_reaccion_usuario_reacciones1_idx` (`reacciones_idreacciones` ASC) VISIBLE,
  INDEX `fk_video_reaccion_usuario_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_video_reaccion_usuario_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_video_reaccion_usuario_reacciones1`
    FOREIGN KEY (`reacciones_idreacciones`)
    REFERENCES `DHTube`.`reacciones` (`idreacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_reaccion_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `DHTube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_reaccion_usuario_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `DHTube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
