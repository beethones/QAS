/*INSERT AUTOM�TICO USERBAR MULTI-USER - POR GRUPO*/
DELETE FROM ENGEMAN.USERBAR WHERE NOME IN (SELECT NOME FROM ENGEMAN.CFGUSR WHERE NOMEGRUPO IS NOT NULL )

INSERT INTO ENGEMAN.USERBAR (CHAVE,NOME,VALOR) 

SELECT B.CHAVE, U.NOME, B.VALOR 
FROM ENGEMAN.USERBAR B
INNER JOIN ENGEMAN.CFGUSR U ON 0=0
WHERE U.NOMEGRUPO IS NOT NULL
AND U.ATIVO='S'

ORDER BY U.NOME 
 