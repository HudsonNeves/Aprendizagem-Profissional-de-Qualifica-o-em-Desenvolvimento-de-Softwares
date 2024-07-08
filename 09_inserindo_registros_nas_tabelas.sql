/*Inserindo registros a tabela funcionario*/
insert into `bd_caso_estudo_vendas`.`tb_func`(func_cod, func_depto, func_nome, func_cpf)
values
(1, 1, 'Iolanda', '99999999999'),
(2, 2, 'Martin', '88888888888'),
(3, 3, 'Hudson', '88888888888'),
(4, 4, 'Cesar', '77777777777'),
(5, 5, 'Carlos', '66666666666');
insert into `bd_caso_estudo_vendas`.`tb_forn`(forn_cod,forn_name,forn_tel)
values
(1,'Fornecedor um','111111111'),
(2,'Fornecedor dois','112222222');
insert into `bd_caso_estudo_vendas`.`tb_prod`(prod_cod,prod_forn_cod,prod_desc,prod_vlr)
values
(1,1,'Produto um',10),
(2,2,'Produto dois',20),
(3,1,'Produto tres',30);
insert into `bd_caso_estudo_vendas`.`tb_cli`(cli_cod, cli_nome, cli_cpf,cli_end_rua, cli_end_num ,cli_end_bairro,cli_end_cep)
values
(1, 'Maria das Dores', '888888888','Rua 7 de Setembro', '2024' ,'Centro','70000000');
select * from tb_cli;
insert into `bd_caso_estudo_vendas`.`tb_cli_tel`(tel_cod,tel_cli_cod,tel_num)
values
(1,1,'1122223333');
insert into `bd_caso_estudo_vendas`.`tb_compra`(compra_cod,compra_cli_cod,compra_func_cod,compra_qtd_cod)
values
(1,1,1,2);
insert into `bd_caso_estudo_vendas`.`tb_prod_comp`(prod_cod,compra_cod)
values
(1,1),
(2,1);





















