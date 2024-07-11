/* Transações e Integridade de Dados - TCL*/
/*Iniciando a transação */
start transaction;
/*Inserindo Cliente */
insert into `bd_caso_estudo_vendas`.`tb_cli`(cli_cod, cli_nome, cli_cpf,cli_end_rua, cli_end_num ,cli_end_bairro,cli_end_cep)
values
(10, 'Cliente  Dois', '548147852222','Rua Teste', '199' ,'Bairro Teste','70000000');
/*Inserindo a compra */
insert into `bd_caso_estudo_vendas`.`tb_compra`(compra_cod,compra_cli_cod,compra_func_cod,compra_qtd_cod)
values
(10,10,1,10);
/*Inserindo os produtos*/
insert into `bd_caso_estudo_vendas`.`tb_prod`(prod_cod,prod_forn_cod,prod_desc,prod_vlr)
values
(10,1,'Produto um',15),
(11,2,'Produto dois',17),
(12,1,'Produto tres',19);
/*Numero da venda inserida = 10*/
/*Atualização da tabela de produtos, inserindo produtos associados a uma venda*/
insert into `bd_caso_estudo_vendas`.`tb_func`(func_cod, func_depto, func_nome, func_cpf)
values
(10, 1, 'Iolanda', '99999999999'),
(11, 2, 'Martin', '88888888888'),
(12, 3, 'Hudson', '88888888888');
/* Comitando os comandos executados para que sejam efetivamente salvos no banco*/
commit;




