-- Script de consultas para o banco de dados `bd_caso_estudo_vendas`

-- 1. Selecionar todos os fornecedores
SELECT * FROM `bd_caso_estudo_vendas`.`tb_forn`;

-- 2. Listar os departamentos disponíveis
SELECT * FROM `bd_caso_estudo_vendas`.`tb_depto`;

-- 3. Listar o nome e CEP dos clientes
SELECT `cli_nome`, `cli_end_cep` FROM `bd_caso_estudo_vendas`.`tb_cli`;

-- 4. Selecionar produtos e seus respectivos preços
SELECT `prod_desc`, `prod_vlr` FROM `bd_caso_estudo_vendas`.`tb_prod`;

-- 5. Listar todos os funcionários
SELECT * FROM `bd_caso_estudo_vendas`.`tb_func`;

-- 6. Obter o nome do cliente e o número de telefone de cada cliente
SELECT `cli_nome`, `tel_num` 
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_cli_tel` 
ON `tb_cli`.`cli_cod` = `tb_cli_tel`.`tel_cli_cod`;

-- 7. Obter o nome dos funcionários e o nome do departamento em que trabalham
SELECT `func_nome`, `depto_desc`
FROM `bd_caso_estudo_vendas`.`tb_func`
JOIN `bd_caso_estudo_vendas`.`tb_depto`
ON `tb_func`.`func_depto` = `tb_depto`.`depto_cod`;

-- 8. Exibir o nome do cliente e a descrição do produto que ele comprou
SELECT `cli_nome`, `prod_desc`
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_cli`.`cli_cod` = `tb_compra`.`compra_cli_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod_comp`
ON `tb_compra`.`compra_cod` = `tb_prod_comp`.`compra_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod`
ON `tb_prod_comp`.`prod_cod` = `tb_prod`.`prod_cod`;

-- 9. Listar todas as compras realizadas por cada cliente com a quantidade comprada
SELECT `cli_nome`, `compra_qtd_cod`
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_cli`.`cli_cod` = `tb_compra`.`compra_cli_cod`;

-- 10. Listar os produtos fornecidos por um fornecedor específico
SELECT `prod_desc`
FROM `bd_caso_estudo_vendas`.`tb_prod`
WHERE `prod_forn_cod` = 1;  -- Substituir conforme necessário

-- 11. Obter a soma total das compras realizadas por um cliente específico
SELECT `cli_nome`, SUM(`compra_qtd_cod`) AS `total_compras`
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_cli`.`cli_cod` = `tb_compra`.`compra_cli_cod`
WHERE `cli_cod` = 1  -- Substituir conforme necessário
GROUP BY `cli_nome`;

-- 12. Exibir o número de funcionários em cada departamento
SELECT `depto_desc`, COUNT(`func_cod`) AS `num_funcionarios`
FROM `bd_caso_estudo_vendas`.`tb_depto`
JOIN `bd_caso_estudo_vendas`.`tb_func`
ON `tb_depto`.`depto_cod` = `tb_func`.`func_depto`
GROUP BY `depto_desc`;

-- 13. Listar clientes que não têm telefone registrado
SELECT `cli_nome`
FROM `bd_caso_estudo_vendas`.`tb_cli`
LEFT JOIN `bd_caso_estudo_vendas`.`tb_cli_tel`
ON `tb_cli`.`cli_cod` = `tb_cli_tel`.`tel_cli_cod`
WHERE `tel_cli_cod` IS NULL;

-- 14. Calcular o valor total de todas as compras realizadas por cada cliente
SELECT `cli_nome`, SUM(`prod_vlr`) AS `total_gasto`
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_cli`.`cli_cod` = `tb_compra`.`compra_cli_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod_comp`
ON `tb_compra`.`compra_cod` = `tb_prod_comp`.`compra_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod`
ON `tb_prod_comp`.`prod_cod` = `tb_prod`.`prod_cod`
GROUP BY `cli_nome`;

-- 15. Exibir o nome do funcionário com a maior quantidade de vendas
SELECT `func_nome`, COUNT(`compra_cod`) AS `qtd_vendas`
FROM `bd_caso_estudo_vendas`.`tb_func`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_func`.`func_cod` = `tb_compra`.`compra_func_cod`
GROUP BY `func_nome`
ORDER BY `qtd_vendas` DESC
LIMIT 1;

-- 16. Identificar quais fornecedores estão fornecendo produtos com valor acima de R$100
SELECT `forn_nome`, `prod_desc`, `prod_vlr`
FROM `bd_caso_estudo_vendas`.`tb_forn`
JOIN `bd_caso_estudo_vendas`.`tb_prod`
ON `tb_forn`.`forn_cod` = `tb_prod`.`prod_forn_cod`
WHERE `prod_vlr` > 100;

-- 17. Exibir o cliente que realizou o maior número de compras
SELECT `cli_nome`, COUNT(`compra_cod`) AS `qtd_compras`
FROM `bd_caso_estudo_vendas`.`tb_cli`
JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_cli`.`cli_cod` = `tb_compra`.`compra_cli_cod`
GROUP BY `cli_nome`
ORDER BY `qtd_compras` DESC
LIMIT 1;

-- 18. Listar os funcionários que não realizaram nenhuma venda
SELECT `func_nome`
FROM `bd_caso_estudo_vendas`.`tb_func`
LEFT JOIN `bd_caso_estudo_vendas`.`tb_compra`
ON `tb_func`.`func_cod` = `tb_compra`.`compra_func_cod`
WHERE `compra_func_cod` IS NULL;

-- 19. Calcular a média de valores de produtos vendidos por um fornecedor específico
SELECT AVG(`prod_vlr`) AS `media_valor`
FROM `bd_caso_estudo_vendas`.`tb_prod`
WHERE `prod_forn_cod` = 1;  -- Substituir conforme necessário

-- 20. Exibir os detalhes da compra e do produto para compras realizadas acima de 5 unidades
SELECT `cli_nome`, `prod_desc`, `compra_qtd_cod`
FROM `bd_caso_estudo_vendas`.`tb_compra`
JOIN `bd_caso_estudo_vendas`.`tb_cli`
ON `tb_compra`.`compra_cli_cod` = `tb_cli`.`cli_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod_comp`
ON `tb_compra`.`compra_cod` = `tb_prod_comp`.`compra_cod`
JOIN `bd_caso_estudo_vendas`.`tb_prod`
ON `tb_prod_comp`.`prod_cod` = `tb_prod`.`prod_cod`
WHERE `compra_qtd_cod` > 5;
