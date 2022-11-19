# CRIANDO TABELA
CREATE TABLE bikeshare.tb_bikes2 (
  `duracao_segundos` int DEFAULT NULL,
  `data_inicio` text,
  `data_fim` text,
  `numero_estacao_inicio` int DEFAULT NULL,
  `estacao_inicio` text,
  `numero_estacao_fim` int DEFAULT NULL,
  `estacao_fim` text,
  `numero_bike` text,
  `tipo_membro` text);

# CARGA DE DADOS VIA LINHA DE COMANDO DO ARQUIVO: 2012Q2-capitalbikeshare-tripdata.csv
# LOAD DATA LOCAL INFILE 'D:/SQL-DS-rr/06-WindowFunctios-Subqueries-TratamentoDatas/2012-capitalbikeshare-tripdata/2012Q2-capitalbikeshare-tripdata.csv' INTO TABLE `bikeshare`.`tb_bikes2` CHARACTER SET UTF8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
