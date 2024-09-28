SELECT * FROM exercicio2.tb_dados2;

#label encoding a variavel menopausa
SELECT DISTINCT menopausa FROM exercicio2.tb_dados2;

SELECT 
	CASE
    WHEN menopausa = 'premeno' THEN 1
    WHEN menopausa = 'ge40' THEN 2
    WHEN menopausa = 'lt40'THEN 3
    END as menopausa
FROM exercicio2.tb_dados2;

#Criando a coluna piscao_tumor com a concatenacao das colunas inv_nodes e posicao_tumor
SELECT concat(inv_nodes, '-', quadrante) 'posicao_tumor'
FROM exercicio2.tb_dados2;

#One-hot encoding na variavel deg_malig
SELECT DISTINCT deg_malig FROM exercicio2.tb_dados2;

SELECT deg_malig,
	CASE
		WHEN deg_malig = '1' THEN 1
        ELSE 0
    END as deg_malig_1,
    CASE
		WHEN deg_malig = '2' THEN 1
        ELSE 0
    END as deg_malig_2,
    CASE
		WHEN deg_malig = '3' THEN 1
        ELSE 0
    END as deg_malig_3
FROM exercicio2.tb_dados2;

#Criando DATASET FINAL

CREATE TABLE exercicio2.tb_dados3
AS
SELECT
	Classe,
    idade,
    CASE
    WHEN menopausa = 'premeno' THEN 1
    WHEN menopausa = 'ge40' THEN 2
    WHEN menopausa = 'lt40'THEN 3
    END as menopausa,
    tamanho_tumor,
    concat(inv_nodes, '-', quadrante) AS posicao_tumor,
    node_caps,
    CASE
		WHEN deg_malig = '1' THEN 1
        ELSE 0
    END as deg_malig_1,
    CASE
		WHEN deg_malig = '2' THEN 1
        ELSE 0
    END as deg_malig_2,
    CASE
		WHEN deg_malig = '3' THEN 1
        ELSE 0
    END as deg_malig_3,
    seio,
    irradiando
FROM exercicio2.tb_dados2;