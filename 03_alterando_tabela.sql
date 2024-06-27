alter table `bd_caso_estudo_vendas`.`tb_forn`
add column `forn_obs` varchar(200) null after `forn_tel`;

describe `tb_forn`