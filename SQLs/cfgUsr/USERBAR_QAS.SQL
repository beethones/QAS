DELETE FROM [172.26.1.49\ENG_QAS].[ENGEMAN_QAS].ENGEMAN].[USERBAR] WHERE NOME = 'BEETHOVEN.NUNES'
!

INSERT INTO [172.26.1.49\ENG_QAS].[ENGEMAN_QAS].[ENGEMAN].[USERBAR] (CHAVE,NOME,VALOR) 

SELECT B.CHAVE, B.NOME, B.VALOR 
FROM [ENGEMAN].[ENGEMAN].[USERBAR] B
WHERE B.NOME='BEETHOVEN.NUNES'