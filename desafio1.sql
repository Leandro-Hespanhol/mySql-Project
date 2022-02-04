-- Desafio 1 - Normalize as tabelas para a 3ª Forma Normal e monte o banco de dados

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
	id_plano INT AUTO_INCREMENT NOT NULL,
    tipo_plano VARCHAR(30) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(id_plano)
);

INSERT INTO planos(tipo_plano, valor_plano)
VALUES
	('gratuito',	0.00),
	('familiar',	7.99),
	('universitário',	5.99),
	('pessoal', 6.99);

CREATE TABLE artistas(
  id_artista INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(50) NOT NULL
);

INSERT INTO artistas(nome)
VALUES ('Walter Phoenix'),
('Fog'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle');

CREATE TABLE usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES `planos`(`id_plano`)
);

INSERT INTO usuarios(usuario, idade, id_plano)
VALUES
('Thati',	23,	1),
('Cintia',	35,	2),
('Bill',	20,	3),
('Roger',	45,	4),
('Norman',	58,	4),
('Patrick',33,	2),
('Vivian',	26,	3),
('Carol',	19,	3),
('Angelina',	42,	2),
('Paul',	46,	2);

CREATE TABLE usuario_seg_artistas(
  id_usuario INT NOT NULL,
  seguindo_artistas VARCHAR(50),
  id_artista INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES `usuarios`(`id_usuario`),
  FOREIGN KEY (id_artista) REFERENCES `artistas`(`id_artista`),
  PRIMARY KEY (id_usuario, id_artista)
);

INSERT INTO usuario_seg_artistas(id_usuario, seguindo_artistas, id_artista)
VALUES 
(1,'Walter Phoenix',1),
(1,'Freedie Shannon',5),
(1,'Lance Day',4),
(2,'Walter Phoenix',1),
(2,'Lance Day',4),
(3,'Peter Strong',3),
(3,'Walter Phoenix',1),
(4,'Freedie Shannon',5),
(5,'Tyler Isle',6),
(5,'Fog',2),
(6,'Fog',2),
(6,'Lance Day',4),
(6,'Walter Phoenix',1),
(7,'Peter Strong',3),
(7,'Tyler Isle',6),
(8,'Walter Phoenix',1),
(8,'Tyler Isle',6),
(9,'Fog',2),
(9,'Freedie Shannon',5),
(9,'Lance Day',4),
(10,'Peter Strong',3),
(10,'Fog',2);

CREATE TABLE albums(
  id_album INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  album VARCHAR(40) NOT NULL,
  id_artista INT NOT NULL,
  ano_lancamento YEAR NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES `artistas`(`id_artista`)
);

USE SpotifyClone;

INSERT INTO albums(album, id_artista, ano_lancamento)
VALUES ('Envious', 1, 1990),
('Exuberant', 1, 1993),
('Hallowed Steam', 3, 1995),
('Incandescent', 4, 1998),
('Temporary Culture', 5, 2001),
('Library of liberty', 5, 2003),
('Chained Down', 6, 2007),
('Cabinet of fools', 6, 2012),
('No guarantees', 6, 2015),
('Apparatus', 2, 2015);

CREATE TABLE musicas(
  id_musica INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_artista INT NOT NULL,
  musica VARCHAR(40) NOT NULL,
  duracao_segundos INT NOT NULL,
  id_album INT NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES `artistas`(`id_artista`),
  FOREIGN KEY (id_album) REFERENCES `albums`(`id_album`)
);

INSERT INTO musicas(id_artista, musica, duracao_segundos, id_album)
VALUES (2, 'Baby', 136, 10),
(4, 'Celebration Of More', 146, 4),
(1, 'Dance With Her Own', 116, 1),
(4, 'Diamond Power', 241, 4),
(4, 'Fantasy For Me', 100, 4),
(6, 'Finding My Traditions', 179, 7),
(6, 'Hard And Time', 135, 7),
(6, "He Heard You're Bad For Me", 154, 8),
(6, "He Hopes We Can't Stay", 210, 8),
(6, "He's Trouble", 138, 9),
(6, "He's Walking Away", 159, 9),
(5, 'History Of My Roses', 222, 6),
(4, 'Home Forever', 231, 4),
(2, 'Honey', 79, 10),
(6, "Honey, I'm A Lone Wolf", 150, 7),
(3, 'Honey, So Do I', 207, 3),
(6, 'I Heard I Want To Bo Alone', 120, 9),
(6, 'I Know I Know', 117, 8),
(6, 'I Ride Alone', 151, 9),
(4, "Let's Be Silly", 132, 4),
(3, 'Magic Circus', 105, 3),
(5, 'Need Of The Evening', 190, 6),
(1, 'Reflections Of Magic', 163, 1),
(4, 'Rock His Everything', 223, 4),
(3, 'She Knows', 244, 3),
(6, "She Thinks I Won't Stay Tonight", 166, 8),
(1, 'Soul For Us', 200, 1),
(3, "Sweetie, Let's Go Wild", 139, 3),
(5, 'Thang Of Thunder', 240, 5),
(1, 'Time Fireworks', 152, 2),
(1, 'Troubles Of My Inner Fire', 203, 2),
(5, 'Walking And Game', 123, 6),
(6, 'Walking And Man', 229, 7),
(5, 'Without My Love', 111, 6),
(5, 'Without My Streets', 176, 5),
(5, 'Words Of Her Life', 185, 5),
(2, "Wouldn't It Be Nice", 213, 10),
(2, 'You Cheated On Me', 95, 10),
(2, 'You Make Me Feel So..', 83, 10),
(5, 'Young And Father', 197, 6);

CREATE TABLE reproducoes(
    historico_de_reproducoes VARCHAR(50) NOT NULL,
    data_reproducao DATETIME NOT NULL,
    id_usuario INT NOT NULL,
    id_musica INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES `usuarios`(`id_usuario`),
    FOREIGN KEY (id_musica) REFERENCES `musicas`(`id_musica`),
    PRIMARY KEY(id_usuario, id_musica)
);

INSERT INTO reproducoes(historico_de_reproducoes, data_reproducao, id_usuario, id_musica)
VALUES ('Baby','2020-09-21 13:14:4', 2,1),
('Baby','2018-03-21 16:56:40', 8,1),
('Celebration Of More','2018-01-16 18:40:43', 7,2),
('Dance With Her Own','2020-12-05 18:38:30', 3,3),
('Diamond Power','2020-08-05 08:05:17', 1,4),
('Diamond Power','2020-08-06 15:23:43', 5,4),
('Finding My Traditions','2020-05-16 06:16:22', 2,6),
('Hard And Time','2020-07-30 10:00:00', 3,7),
("He Heard You're Bad For Me",'2017-01-24 00:31:17', 6,8),
("He Hopes We Can't Stay",'2017-10-12 12:35:20', 6,9),
("He's Trouble",'2021-08-15 21:37:09', 8,10),
("He's Walking Away",'2019-05-25 08:14:03', 8,11),
('History Of My Roses','2017-02-06 08:21:34', 10,12),
('Home Forever','2017-12-25 01:03:57', 10,13),
('Honey','2020-02-28 10:45:55', 1,14),
("Honey, I'm A Lone Wolf",'2021-01-09 01:44:33', 4,15),
('Honey, So Do I','2020-07-03 19:33:28', 5,16),
('I Heard I Want To Bo Alone','2020-01-02 07:40:33', 2,17),
('I Ride Alone','2021-07-10 15:20:30', 4,19),
("Let's Be Silly",'2020-09-14 16:32:22', 1,20),
('Magic Circus','2020-11-13 16:55:13', 3,21),
('Reflections Of Magic','2021-08-15 17:10:10', 4,23),
('Rock His Everything','2017-02-24 21:14:22', 5,24),
('Rock His Everything','2017-07-27 05:24:49', 10,24),
('She Knows','2020-04-01 03:36:00', 9,25),
('Soul For Us','2020-11-10 13:52:27', 5,27),
("Sweetie, Let's Go Wild",'2021-03-14 06:14:26', 9,28),
('Thang Of Thunder','2021-05-24 17:23:45', 9,29),
('Time Fireworks','2018-05-09 22:30:49', 7,30),
('Troubles Of My Inner Fire','2020-07-27 12:52:58', 7,31),
('Walking And Game','2018-05-29 14:56:41', 6,32),
('Walking And Man','2020-05-02 05:30:35', 1,33),
('Without My Love','2020-10-09 12:27:48', 2,34),
('Without My Love','2017-12-04 05:33:43', 10,34),
('Words Of Her Life','2018-12-07 22:48:52', 9,36),
("Wouldn't It Be Nice",'2019-02-07 20:33:48', 6,37),
('You Make Me Feel So..','2020-10-18 13:38:05', 8,39),
('Young And Father','2020-03-06 11:22:33', 1,40);


