/*Crianco Index*/
alter table `bd_caso_estudo_vendas`.`tb_func`
add index `fk_func_depto_idx`(`func_depto` ASC);

/*Criando a chave estrangeira*/
alter table `bd_caso_estudo_vendas`.`tb_func`
add constraint `fk_func_depto`
foreign key (`func_depto`)
references `bd_caso_estudo_vendas`.`tb_depto`(`depto_cod`)
on delete no action
on update no action;