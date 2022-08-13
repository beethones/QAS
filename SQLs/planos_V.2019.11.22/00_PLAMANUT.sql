/*-------------------------------------------------------------------------------------------------------------------------------*/
/*  INSERÇÃO AUTOMÁTICA DE PLANOS BASEADO NOS PLANOS BASE - USAR APENAS UM PLANO COMO BASE E PASSAR FILIAIS NO WHERE             */
/*  BEETHOVEN SANTOS NUNES                                                                                                       */
/*-------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO ENGEMAN.ENGEMAN.PLAMANUT 
(ATIVO,CODEMP,CODEMP_1,CODTIPMAN,DATALT,DESCRICAO,OBS,TAG,TAGGRU,U_TRIP,U_INDIS,U_PERIODIC,U_REVISAO,U_RESP,U_DATREV,U_EXIGETES) 
/*-------------------------------------------------------------------------------------------------------------------------------*/
/* BLOCO DE SELECT                                                                                                               */
/*-------------------------------------------------------------------------------------------------------------------------------*/
 SELECT PLAMANUT.ATIVO, PLAMANUT.CODEMP, PLAMANUT.CODEMP_1, PLAMANUT.CODTIPMAN, PLAMANUT.DATALT, PLAMANUT.DESCRICAO
      , PLAMANUT.OBS, FILIAL.TAG+SUBSTRING(PLAMANUT.TAG,4,LEN(PLAMANUT.TAG)) 'PLANO', TAGGRU,PLAMANUT.U_TRIP, PLAMANUT.U_INDIS
      , PLAMANUT.U_PERIODIC, PLAMANUT.U_REVISAO, PLAMANUT.U_RESP, PLAMANUT.U_DATREV, PLAMANUT.U_EXIGETES  
FROM ENGEMAN.ENGEMAN.PLAMANUT
  INNER JOIN FILIAL ON 3=3 
  
WHERE PLAMANUT.TAG LIKE 'XXX'
AND  FILIAL.TAG+SUBSTRING(PLAMANUT.TAG,4,LEN(PLAMANUT.TAG)) NOT IN (SELECT TAG FROM PLAMANUT)
AND FILIAL.TAG IN ('AIR','AME','ARV','BV2','DIA','DOU','ECH','CGR','GOE','GPE','JAG','LUD','FIG','PLA','POL','NIA','NHZ','SGO','SJO','SLU','VAE','VGA')