/* Alterando os registro das tabelaas*/
update  `bd_caso_estudo_vendas`.`tb_cli`
set cli_nome = 'Novo Nome Cliente'
where cli_cod = 1;
select * from tb_cli;
/*Deletando Registros do Banco de Dados*/
delete from `bd_caso_estudo_vendas`.`tb_prod`
where prod_cod = 3;
/*Consultado Registro e selecionando colunas*/
select prod_cod, prod_forn_cod, prod_desc,prod_vlr
from `bd_caso_estudo_vendas`.`tb_prod`;