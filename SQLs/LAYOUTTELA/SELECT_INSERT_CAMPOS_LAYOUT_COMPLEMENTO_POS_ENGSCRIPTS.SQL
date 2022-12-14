/* ----------------------------------- USRXCAM ---------------------------------------------------*/
 
INSERT INTO USRXCAM (ISOWNER, NOMCAM, U.NOME, NOMTAB, CODCFGUSR, CODNOVOSCAMPOS)                --*/
--SELECT
SELECT UXC.ISOWNER, UXC.NOMCAM, U.NOME, UXC.NOMTAB, U.CODCFGUSR, NC.CODNOVOSCAMPOS              
FROM USRXCAM UXC
INNER JOIN NOVOSCAMPOS NC ON  UXC.NOMCAM = NC.NOMCAM
INNER JOIN CFGUSR U ON U.TIPO = 'G' 
WHERE NC.NOMCAM='U_PREVNORM' 
AND NC.NOMTAB='USER_OCORRE'
AND UXC.NOME = 'BEETHOVEN.NUNES'
AND NC.NOMTAB+NC.NOMCAM+U.NOME NOT IN (SELECT NOMTAB+NOMCAM+NOME FROM USRXCAM)
!

/* ----------------------------------- CAMPOSTELA ------------------------------------------------*/ 

INSERT INTO CAMPOSTELA(CODEMP, COMPONENTE, NOMCAM, NOME, NOMTAB, NOMTEL, CODUSRXCAM)            --*/
--SELECT 
SELECT DISTINCT C.CODEMP, C.COMPONENTE, C.NOMCAM, UXC.NOME, C.NOMTAB, C.NOMTEL, UXC.CODUSRXCAM  
FROM CAMPOSTELA C
INNER JOIN USRXCAM UXC ON C.NOMCAM = UXC.NOMCAM AND C.NOMTAB = UXC.NOMTAB 
WHERE C.NOME='BEETHOVEN.NUNES'
AND UXC.NOMCAM='U_PREVNORM' 
AND UXC.NOMTAB='USER_OCORRE'
AND UXC.NOMTAB+UXC.NOMCAM+UXC.NOME NOT IN (SELECT NOMTAB+NOMCAM+NOME FROM CAMPOSTELA)
--FIM DO SELECT
!

/* ------------------------------------ LAYOUTTELA -----------------------------------------------*/ 
/
INSERT INTO LAYOUTTELA (CODEMP, COR, CORFONTE, DESCRICAO, HEIGHT, HINT, INDICE, LEFTCONTROL, 
                        LEFTLABEL, MASCARA, NOMCAM, NOME, NOMELABEL, NOMTAB, OBRIG, TOPCONTROL,
                        TOPLABEL, VISIVEL, WIDTHCONTROL, CHARCASE, DESCRICAO_ENG, DESCRICAO_ESP,
                        HINT_ENG,  HINT_ESP, CODCFGUSR)                                         --*/
--SELECT
SELECT L.CODEMP, L.COR, L.CORFONTE, L.DESCRICAO, L.HEIGHT, L.HINT, L.INDICE, L.LEFTCONTROL, 
                        L.LEFTLABEL, L.MASCARA, L.NOMCAM, U.NOME, L.NOMELABEL, L.NOMTAB, L.OBRIG, 
                        L.TOPCONTROL, L.TOPLABEL, L.VISIVEL, L.WIDTHCONTROL, L.CHARCASE, 
                        L.DESCRICAO_ENG, L.DESCRICAO_ESP, L.HINT_ENG, L.HINT_ESP, U.CODCFGUSR   
FROM LAYOUTTELA L 
INNER JOIN CFGUSR  U ON U.TIPO = 'G' 
WHERE L.NOME='BEETHOVEN.NUNES'
AND L.NOMCAM='U_PREVNORM' 
AND L.NOMTAB='USER_OCORRE'
AND L.NOMTAB+L.NOMCAM+U.NOME NOT IN (SELECT NOMTAB+NOMCAM+NOME FROM LAYOUTTELA)
--FIM DO SELECT
                         
