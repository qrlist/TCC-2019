-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE usuario (
sobrenome varchar(50) not null,
senha varchar(50) not null,
email varchar(60) not null,
primeiro_nome varchar(50) not null,
cpf char(14) not null PRIMARY KEY,
telefone char(13) not null,
cod_tip_usu_cod int(3) not null
);

CREATE TABLE lista (
cod_lista int(3) auto_increment not null PRIMARY KEY,
valor_lista varchar(60) not null,
cpf_lista char(14) not null,
FOREIGN KEY(cpf_lista) REFERENCES usuario (cpf)
);

CREATE TABLE item_lista (
cod_produto_cod int(3) not null,
cod_lista_cod int(3) not null,
cod_tem_lista int(3) auto_increment not null PRIMARY KEY,
qtd_item_lista int(10) not null,
FOREIGN KEY(cod_lista_cod) REFERENCES lista (cod_lista)
);

CREATE TABLE produtos (
peso_liq varchar(10) not null,
qtd_item_est int(10) not null,
marca varchar(80) not null,
foto_produto varchar(300) not null,
nome_produto varchar(200) not null,
desc_prod varchar(800) not null,
preco_prod float(6,2) not null,
cod_produto int(3) not null PRIMARY KEY,
cod_cat_cod int(5) not null
);

CREATE TABLE categoria_prod (
cod_cat int(5) auto_increment not null PRIMARY KEY,
nome_cat varchar(50) not null
);

CREATE TABLE produto_mercado (
cod_produto_merc_cod int(3) not null,
cnpj_prod char(18) not null,
FOREIGN KEY(cod_produto_merc_cod) REFERENCES produtos (cod_produto)
);

CREATE TABLE tipo_end (
cod_tipo_end int(3) auto_increment not null PRIMARY KEY,
desc_tipo_end varchar(80) not null
);

CREATE TABLE bairro (
nome_bairro varchar(80) not null,
cod_bairro int(3) auto_increment not null PRIMARY KEY,
cod_cidade_cod int(3) not null
);

CREATE TABLE cidade (
nome_cidade varchar(80) not null,
cod_cidade int(3) auto_increment not null PRIMARY KEY,
cod_uf_cod int(3) not null
);

CREATE TABLE uf (
cod_uf int(3) auto_increment not null PRIMARY KEY,
nome_uf varchar(80) not null
);

CREATE TABLE endereco (
cod_end int(3) PRIMARY KEY not null auto_increment,
rua varchar(50) not null,
numero int(6) not null,
cod_bairro_cod int(3) not null,
cnpj_end char(18) not null,
cod_tipo_end_cod int(3) not null,
cep char(9) not null,
FOREIGN KEY(cod_bairro_cod) REFERENCES bairro (cod_bairro),
FOREIGN KEY(cod_tipo_end_cod) REFERENCES tipo_end (cod_tipo_end)
);

CREATE TABLE tipo_usu (
desc_tip_usu varchar(20) not null,
cod_tip_usu int(3) auto_increment not null PRIMARY KEY
);

CREATE TABLE mercado (
nome_mercado varchar(500) not null,
cnpj char(18) not null PRIMARY KEY,
senha_mercado varchar(100) not null,
email_mercado varchar(150) not null,
telefone_mercado char(13) not null,
ie char(11) not null,
cod_tip_usu_cod int(3) not null,
FOREIGN KEY(cod_tip_usu_cod) REFERENCES tipo_usu (cod_tip_usu)
);

ALTER TABLE usuario ADD FOREIGN KEY(cod_tip_usu_cod) REFERENCES tipo_usu (cod_tip_usu);
ALTER TABLE item_lista ADD FOREIGN KEY(cod_produto_cod) REFERENCES produtos (cod_produto);
ALTER TABLE produtos ADD FOREIGN KEY(cod_cat_cod) REFERENCES categoria_prod (cod_cat);
ALTER TABLE produto_mercado ADD FOREIGN KEY(cnpj_prod) REFERENCES mercado (cnpj);
ALTER TABLE bairro ADD FOREIGN KEY(cod_cidade_cod) REFERENCES cidade (cod_cidade);
ALTER TABLE cidade ADD FOREIGN KEY(cod_uf_cod) REFERENCES uf (cod_uf);
ALTER TABLE endereco ADD FOREIGN KEY(cnpj_end) REFERENCES mercado (cnpj);

INSERT INTO `tipo_end` (`desc_tipo_end`, `cod_tipo_end`) VALUES
('Comum', 1),
('Mercado', 2);
INSERT INTO `tipo_usu` (`desc_tip_usu`, `cod_tip_usu`) VALUES ('Comum', 1), ('Admin', 2), ('Mercado', 3),
('Produto', 4),
('Lista', 5);
INSERT INTO `usuario` (`primeiro_nome`, `telefone`, `sobrenome`, `senha`, `cpf`, `email`, `cod_tip_usu_cod`) VALUES
('teste', '(47)991961459', 'teste', '202cb962ac59075b964b07152d234b70', '101.213.189-07', 'teste@teste.com', 1);
INSERT INTO `uf` (`cod_uf`, `nome_uf`) VALUES
(1, 'SC');
INSERT INTO `cidade` (`nome_cidade`, `cod_cidade`, `cod_uf_cod`) VALUES
('Joinville', 1, 1),
('Araquari', 2, 1);
INSERT INTO `bairro` (`nome_bairro`, `cod_bairro`, `cod_cidade_cod`) VALUES
('Profipo', 1, 1);
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Enlatados');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Carnes e Derivados');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Horti Fruti');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Mercearia');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Limpeza');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Higiene Pessoal');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Bebidas');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Padaria');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Temperos');
INSERT INTO `categoria_prod` (`cod_cat`, `nome_cat`) VALUES (NULL, 'Produtos dia-dia');