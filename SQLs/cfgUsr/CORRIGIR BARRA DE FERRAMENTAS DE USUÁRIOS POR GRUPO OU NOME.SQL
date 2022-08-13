/* COMANDO PARA CRIAR OU CORRIGIR REPOR BARRAS DE FERRAMENTAS DE USUÁRIOS BASEADA EM GRUPO DE ACESSO */ 
/*  OS NOMES DOS GRUPOS SÃO:                                                                         */
/* PCM                                                                                               */
/* TECNICO                                                                                           */
/* COG                                                                                               */
/* SUPERVISOR                                                                                        */
/* ENGENHARIA                                                                                        */
/* OPERACAO                                                                                          */
/* GESTAO                                                                                            */
/* SEGURANCA                                                                                         */
/* SOLICITANTES - PESSOAL QUE ACESSA APENAS O SSW                                                    */
/*IMPORTANTE - NUNCA SELECIONE NENHUMA PARTE DO TEXTO A SER EXECUTADO                                */
DELETE FROM USERBAR 
WHERE NOME IN ( SELECT NOME 
                FROM CFGUSR 
                WHERE NOMEGRUPO = 'ENGENHARIA'             /*===> NOME DO GRUPO SEMPRE ENTRE 'ASPAS SIMPLES'*/ 
               )
!
INSERT INTO USERBAR (CHAVE,NOME,VALOR) 

SELECT B.CHAVE, U.NOME, B.VALOR 
FROM USERBAR B
INNER JOIN CFGUSR U ON 0=0 AND ATIVO = 'S'
  WHERE B.NOME = 'ENGENHARIA'                              /*===> NOME DO GRUPO SEMPRE ENTRE 'ASPAS SIMPLES'*/ 
  AND U.NOMEGRUPO ='ENGENHARIA'                            /*===> NOME DO GRUPO SEMPRE ENTRE 'ASPAS SIMPLES'*/ 
  ORDER BY U.NOME
/*IMPORTANTE - NUNCA SELECIONE NENHUMA PARTE DO TEXTO A SER EXECUTADO                                */


DELETE FROM USERBAR WHERE NOME IN (SELECT NOME FROM CFGUSR WHERE ATIVO = 'N')