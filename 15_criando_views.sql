/* Trabalhando com views*/
create view `VIEW_COMPRA_PRODUTO_CLIENTE`
AS
select tb_compra.compra_cod, prod_desc, cli_nome
from `bd_caso_estudo_vendas`.`tb_compra`
	inner join `bd_caso_estudo_vendas`.`tb_prod_comp`
		on tb_compra.compra_cod = tb_prod_comp.compra_cod
	inner join `bd_caso_estudo_vendas`.`tb_prod`
		on tb_prod.prod_cod = tb_prod_comp.prod_cod
	inner join `bd_caso_estudo_vendas`.`tb_cli`
        on compra_cli_cod = cli_cod;

select * from `VIEW_COMPRA_PRODUTO_CLIENTE`