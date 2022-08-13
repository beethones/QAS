DELETE 
FROM USER_FUNAPA 
WHERE R_USER_CADAPA_U_PK_REDUZIDO 
                                  IN (
                                    SELECT  U_PK_REDUZIDO 
                                    FROM USER_CADAPA 
                                    WHERE R_ORDSERV_CODORD IN (
                                                                SELECT CODORD FROM ORDSERV WHERE CODFIL=3
                                                               )
                                       )
!
DELETE 
FROM USER_CADAPA 
WHERE R_ORDSERV_CODORD IN (SELECT CODORD from ORDSERV WHERE CODFIL=3)
!
DELETE FROM ORDSERV WHERE CODFIL=3 