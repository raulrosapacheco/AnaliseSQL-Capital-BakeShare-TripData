# 1- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
SELECT tipo_membro, ROUND(AVG(duracao_segundos),2) media_tempo_segundos
FROM bikeshare.tb_bikes2
GROUP BY tipo_membro;

# 2- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e
# por estação fim (onde as bikes são entregues após o aluguel)?
SELECT tipo_membro, estacao_fim, ROUND(AVG(duracao_segundos),2) media_tempo_segundos
FROM bikeshare.tb_bikes2
GROUP BY tipo_membro, estacao_fim;

# 3- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e
# por estação fim (onde as bikes são entregues após o aluguel) ao longo do tempo?
SELECT 
	tipo_membro, 
    estacao_fim, 
    sum(duracao_segundos) OVER(PARTITION BY tipo_membro, estacao_fim 
		ORDER BY data_fim) media_tempo
FROM bikeshare.tb_bikes2;

# 4- Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de
# aluguéis considerando a data de início?
SELECT
	EXTRACT(HOUR FROM data_inicio) hora,
    numero_bike,
    COUNT(*) numero_alugueis 
FROM bikeshare.tb_bikes2
WHERE numero_bike = 'W01182'
GROUP BY EXTRACT(HOUR FROM data_inicio), numero_bike
ORDER BY numero_alugueis DESC;

# 5- Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a
# data de início?
SELECT 
	numero_bike,
    COUNT(*) OVER(PARTITION BY numero_bike ORDER BY data_inicio) numero_alugueis
FROM bikeshare.tb_bikes2
WHERE numero_bike = 'W01182';

# 6- Retornar:
# Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo
# Somente os registros quando a data fim foi no mês de Abril
SELECT 
	estacao_fim,
    data_fim,
    duracao_segundos,
    COUNT(*) OVER(ORDER BY data_fim) numero_alugueis
FROM bikeshare.tb_bikes2
WHERE EXTRACT(MONTH FROM data_fim) = 04; 

# 7- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# Retornar os dados para os aluguéis entre 7 e 11 da manhã
SELECT 
	estacao_fim,
    DATE_FORMAT(data_fim, "%d/%M%Y %H:%i:%S") data_fim,
    duracao_segundos,
	RANK() OVER(ORDER BY CAST(data_fim AS DATE)) ranking
FROM bikeshare.tb_bikes2
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 07 AND 11;

# 8- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para
# outro, considerando data de início do aluguel e estação de início?
# A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana
# abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã	

# 9- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos os registros divididos em 4 grupos ao longo do tempo por partição
# Retornar os dados para os aluguéis entre 8 e 10 da manhã
# Qual critério usado pela função NTILE para dividir os grupos?

# 10- Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do
# tempo considerando a data fim e estação fim?
# Retorne os dados entre os dias '2012-04-01' e '2012-04-02'