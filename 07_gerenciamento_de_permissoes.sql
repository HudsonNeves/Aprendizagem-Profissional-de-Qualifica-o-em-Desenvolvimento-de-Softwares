/*Criando novo usuario no servidor*/
/*Criando novo usuario no servidor*/
create user 'lara.rodrigues'@'localhost'identified by'123456';
create user 'izabella.oliveira'@'localhost'identified by'123456';
create user 'luane.gabrielly'@'localhost'identified by'123456';
create user 'tiago.lima'@'localhost'identified by'123456';
create user 'danielgomes'@'localhost'identified by'123456';

/*Gerenciamento de permissões e usuários, concedendo permissão de inserção, 
atualização e remoção de registros em uma tabela*/
grant insert, update, delete
ON `bd_caso_estudo_vendas`.`tb_func`
TO `hudson_silva@localhost`;
/*Removendo permissão concedida*/
revoke insert, update
ON `bd_caso_estudo_vendas`.`tb_func`
from `hudson_silva@localhost`;
/*Gerenciamento de permissões e usuários, concedendo permissão para
remover registros em uma tabela especifica*/
grant delete
ON `bd_caso_estudo_vendas`.`tb_func`
TO `hudson_silva@localhost`;
/*Removendo permissão de consulta*/
revoke select
ON `bd_caso_estudo_vendas`.`tb_func`
from `hudson_silva@localhost`;
/*Gerenciamento de permissões e usuários, concedendo permissão para
inserir registros em uma tabela especifica*/
grant insert
ON `bd_caso_estudo_vendas`.`tb_func`
TO `hudson_silva@localhost`;
