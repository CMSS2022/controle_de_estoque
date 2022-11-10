CREATE DATABASE bd_estoque DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE bd_estoque;

-- Criação da Estrutura da Tabela colaboradores-----------------------------------------------
CREATE TABLE  IF NOT EXISTS`bd_estoque`.`tb_colaborador` ( 
	`id_colaborador` INT NOT NULL AUTO_INCREMENT,
	`nome_colaborador` VARCHAR(30) NOT NULL, 
	`senha_colaborador` VARCHAR(10) NOT NULL, 
	`nivel_colaborador` enum('adm','entrada','saida') NOT NULL,
	`img_colaborador` VARCHAR(50) NOT NULL,
PRIMARY KEY (id_colaborador)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
 DESCRIBE tb_colaborador;
 
 -- Inserindo Dados na Tabela colaborador--------------------------------------------------------
INSERT INTO `tb_colaborador` 
	(`nome_colaborador`,`senha_colaborador`,`nivel_colaborador`,`img_colaborador`) 
VALUES
		('claudio milton',1234,'adm','perfil-2.jpg'),
		('Samuel',123,'entrada','perfil-1.jpeg'),
		('maria',123,'saida','perfil-1.jpeg');	   
      
SELECT * FROM bd_estoque.tb_colaborador;
  
-- Criação da Estrutura tabela produtos-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS`bd_estoque`.`tb_produto` (
     `id_produto` INT NOT NULL AUTO_INCREMENT, 
	 `descri_produto`  VARCHAR(300) NOT NULL , 
     `uni_por_caixa_produto` VARCHAR(4) NOT NULL,
   	 `uni_por_fardo_produto`  VARCHAR(4) NOT NULL,
	 `uni_caixa_por_palete_produto`  VARCHAR(4) NOT NULL,
     `obs_produto`  VARCHAR(100) NOT NULL,
PRIMARY KEY (`id_produto`)) ENGINE = InnoDB;
     
DESCRIBE tb_produto; 
SELECT * FROM bd_estoque.tb_produto;
        
-- Inserindo dados na Tabela produtos---------------------------------------------
INSERT INTO `tb_produto` ( `descri_produto`,`uni_por_caixa_produto`,`uni_por_fardo_produto`,`uni_caixa_por_palete_produto`,`obs_produto`)
VALUES
     ('BATATA CHISP LISA 145Gr',15,0,30,'incolor'),
	 ('BATATA CHIPS LISA 450Gr',6,0,30,'incolor'),
	 ('BATATA CHIPS LISA 60Gr',20,0,50,'incolor'),
	 ('BATATA CHIPS LISA COSTELAO 144Gr',15,0,30,'incolor'),
	 ('BATATA CHIPS LISA COSTELAO 450Gr',6,0,30,'incolor'),
     ('BATATA CHIPS LISA COSTELÃO 60Gr',20,0,50,'incolor'), 
     ('BATATA CHIPS LISA REQUEIJÃO 144Gr',15,0,30,'incolor'),  
     ('BATATA CHIPS LISA REQUEIJÃO 450Gr',6,0,30,'incolor'),
	 ('BATATA CHIPS LISA REQUEIJÃO 60Gr',20,0,50,'incolor'); 
      
      
  
  
-- Criação da Estrutura tabela Produto Entrada----------------------
CREATE TABLE IF NOT EXISTS`bd_estoque`.`tb_entrada` (
	 `id_entrada` INT NOT NULL AUTO_INCREMENT,
     `data_hora_entrada` DATETIME,
     `id_colaborador_entrada`INT NOT NULL,
     `nivel_colaborador_entrada` VARCHAR(100),
     `id_produto_entrada`  INT NOT NULL,
     `descri_produto_entrada` VARCHAR(100),
     `quanti_caixa_entrada` VARCHAR(5) NOT NULL,
     `quanti_palete_entrada`  VARCHAR(5) NOT NULL,
PRIMARY KEY (`id_entrada`)) ENGINE = InnoDB;  
    
DESCRIBE tb_entrada;

-- Inserindo dados na Tabela Produto Entrada---------------------------------------------
INSERT INTO `tb_entrada` (`data_hora_entrada`,`id_colaborador_entrada`,`nivel_colaborador_entrada`,`id_produto_entrada`,`descri_produto_entrada`,`quanti_caixa_entrada`,`quanti_palete_entrada`)
VALUES
     ('2022-10-10 12:13:14',2,'entrada',1,'BATATA CHISP LISA 145Gr',15,1),
	 ('2022-10-10 12:13:14',2,'entrada',2,'BATATA CHIPS LISA 450Gr',6,1),
	 ('2022-10-10 12:13:14',2,'entrada',3,'BATATA CHIPS LISA 60Gr',20,1),
	 ('2022-10-10 12:13:14',2,'entrada',4,'BATATA CHIPS LISA COSTELAO 144Gr',15,1),
	 ('2022-10-10 12:13:14',2,'entrada',5,'BATATA CHIPS LISA COSTELÃO 60Gr',6,1),
	 ('2022-10-10 12:13:14',2,'entrada',6,'BATATA CHIPS LISA REQUEIJÃO 144Gr',20,1),
	 ('2022-10-10 12:13:14',2,'entrada',7,'BATATA CHIPS LISA REQUEIJÃO 144Gr',15,1),
	 ('2022-10-10 12:13:14',2,'entrada',8,'BATATA CHIPS LISA REQUEIJÃO 450Gr',6,1),
	 ('2022-10-10 12:13:14',2,'entrada',9,'BATATA CHIPS LISA REQUEIJÃO 60Gr',20,1);
         
SELECT * FROM bd_estoque.tb_entrada;


-- Criação da Estrutura tabela Produto Saida----------------------
CREATE TABLE IF NOT EXISTS`bd_estoque`.`tb_saida` (
	 `id_saida` INT NOT NULL AUTO_INCREMENT,
     `data_hora_saida` DATETIME,
     `id_colaborador_saida` INT NOT NULL,
     `nivel_colaborador_saida`VARCHAR(50),
     `id_produto_entrada_saida`  INT NOT NULL,
	 `descri_produto_entrada_saida` VARCHAR(100),
     `quanti_caixa_entrada_saida` VARCHAR(5) NOT NULL,
     `quanti_palete_entrada_saida`  VARCHAR(5) NOT NULL,
PRIMARY KEY (`id_saida`)) ENGINE = InnoDB;  
    
DESCRIBE tb_saida;

  -- Inserindo dados na Tabela Produto Entrada---------------------------------------------
INSERT INTO `tb_saida` ( `data_hora_saida`,`id_colaborador_saida`,`nivel_colaborador_saida`,`id_produto_entrada_saida`,
`descri_produto_entrada_saida`,`quanti_caixa_entrada_saida`, `quanti_palete_entrada_saida` )
VALUES
     ('2022-10-10 12:13:14',3,'saida',1,'BATATA CHISP LISA 145Gr',15,1),
	 ('2022-10-10 12:13:14',3,'saida',2,'BATATA CHIPS LISA 450Gr',6,1),
	 ('2022-10-10 12:13:14',3,'saida',3,'BATATA CHIPS LISA 60Gr',20,1),
	 ('2022-10-10 12:13:14',3,'saida',4,'BATATA CHIPS LISA COSTELAO 144Gr',15,1),
	 ('2022-10-10 12:13:14',3,'saida',5,'BATATA CHIPS LISA COSTELÃO 60Gr',6,1),
	 ('2022-10-10 12:13:14',3,'saida',6,'BATATA CHIPS LISA REQUEIJÃO 144Gr',20,1),
	 ('2022-10-10 12:13:14',3,'saida',7,'BATATA CHIPS LISA REQUEIJÃO 144Gr',15,1),
	 ('2022-10-10 12:13:14',3,'saida',8,'BATATA CHIPS LISA REQUEIJÃO 450Gr',6,1),
	 ('2022-10-10 12:13:14',3,'saida',9,'BATATA CHIPS LISA REQUEIJÃO 60Gr',20,1);
         
SELECT * FROM bd_estoque.tb_saida;
  
 -- Criação da Estrutura tabela estoque----------------------
CREATE TABLE IF NOT EXISTS`bd_estoque`.`tb_estoque` (
	 `id_estoque` INT NOT NULL AUTO_INCREMENT,
     `data_hora_estoque` DATETIME,
     `id_entrada_estoque`  INT NOT NULL,
     `data_hora_entrada_estoque` INT NOT NULL,
     `id_colaborador_entrada_estoque` INT NOT NULL,
     `nome_colaborador_entrada_estoque` VARCHAR(50),
     `nivel_colaborador_entrada_estoque` VARCHAR(50),
     `id_produto_entrada_estoque` INT NOT NULL,
     `descri_produto_entrada_estoque`VARCHAR(100),
     `quanti_caixa_entrada_estoque` VARCHAR(10),
	 `quanti_palete_entrada_estoque` VARCHAR(10),
     `id_saida_estoque` INT NOT NULL,
     `data_hora_saida_estoque` DATETIME,
     `id_produto_entrada_saida_estoque` INT NOT NULL,
     `descri_produto_entrada_saida_estoque`VARCHAR(100),
     `quanti_caixa_entrada_saida_estoque` VARCHAR(10),
	 `quanti_palete_entrada_saida_estoque` VARCHAR(10),
     `id_colaborador_saida_estoque`INT NOT NULL,
     `nome_colaborador_saida_estoque` VARCHAR(100),
     `nivel_colaborador_saida_estoque`VARCHAR(50),
     `saldo_caixa_estoque` VARCHAR(50),
     `saldo_palete_estoque` VARCHAR(50),
PRIMARY KEY (`id_estoque`)) ENGINE = InnoDB;  
    
DESCRIBE tb_estoque;  
  
-- Inserindo dados na Tabela estoque---------------------------------------------
INSERT INTO `tb_estoque` ( `data_hora_estoque`,`id_entrada_estoque`,`data_hora_entrada_estoque`,
`id_colaborador_entrada_estoque`,`nome_colaborador_entrada_estoque`,`nivel_colaborador_entrada_estoque`,
`id_produto_entrada_estoque`,`descri_produto_entrada_estoque`,`quanti_caixa_entrada_estoque`, `quanti_palete_entrada_estoque`,
`id_saida_estoque`,`data_hora_saida_estoque`, `id_produto_entrada_saida_estoque`,`descri_produto_entrada_saida_estoque`,`quanti_caixa_entrada_saida_estoque`, `quanti_palete_entrada_saida_estoque`,
`id_colaborador_saida_estoque`,`nome_colaborador_saida_estoque`,`nivel_colaborador_saida_estoque`,
`saldo_caixa_estoque`,`saldo_palete_estoque`)
VALUES
	('2022-10-10 12:13:14',1,'2022-10-10 12:13:14',2,'Samuel','entrada',1,'BATATA CHISP LISA 145Gr',15,1,1,'2022-12-12 15:13:14',1,'BATATA CHISP LISA 145Gr',15,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',2,'2022-10-10 12:13:14',2,'Samuel','entrada',2,'BATATA CHIPS LISA 450Gr',6,1,2,'2022-12-12 15:13:14',2,'BATATA CHIPS LISA 450Gr',6,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',3,'2022-10-10 12:13:14',2,'Samuel','entrada',3,'BATATA CHIPS LISA 60Gr',20,1,3,'2022-12-12 15:13:14',3,'BATATA CHIPS LISA 60Gr',20,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',4,'2022-10-10 12:13:14',2,'Samuel','entrada',4,'BATATA CHIPS LISA COSTELAO 144Gr',15,1,4,'2022-12-12 15:13:14',4,'BATATA CHIPS LISA COSTELAO 144Gr',15,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',5,'2022-10-10 12:13:14',2,'Samuel','entrada',5,'BATATA CHIPS LISA COSTELAO 450Gr',6,1,5,'2022-12-12 15:13:14',5,'BATATA CHIPS LISA COSTELAO 450Gr',6,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',6,'2022-10-10 12:13:14',2,'Samuel','entrada',6,'BATATA CHIPS LISA COSTELÃO 60Gr',20,1,6,'2022-12-12 15:13:14',6,'BATATA CHIPS LISA COSTELÃO 60Gr',20,1,2,'maria','saida',0,0), 
	('2022-10-10 12:13:14',7,'2022-10-10 12:13:14',2,'Samuel','entrada',7,'BATATA CHIPS LISA REQUEIJÃO 144Gr',15,1,7,'2022-12-12 15:13:14',7,'BATATA CHIPS LISA REQUEIJÃO 144Gr',15,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',8,'2022-10-10 12:13:14',2,'Samuel','entrada',8,'BATATA CHIPS LISA REQUEIJÃO 450Gr',6,1,8,'2022-12-12 15:13:14',8,'BATATA CHIPS LISA REQUEIJÃO 450Gr',6,1,2,'maria','saida',0,0),
	('2022-10-10 12:13:14',9,'2022-10-10 12:13:14',2,'Samuel','entrada',9,'BATATA CHIPS LISA REQUEIJÃO 60Gr',20,1,9,'2022-12-12 15:13:14',9,'BATATA CHIPS LISA REQUEIJÃO 60Gr',20,1,2,'maria','saida',0,0); 
         
SELECT * FROM bd_estoque.tb_estoque;
  
  
-- Caso ja tenha dados adicionado colocar AUTO_INCREMENT= para comecar a auto numeraçao apartir desse id
ALTER TABLE `tb_colaborador`
MODIFY `id_colaborador` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
    
ALTER TABLE `tb_produto`
MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
  
ALTER TABLE `tb_entrada`
MODIFY `id_entrada` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `tb_saida`
MODIFY `id_saida` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
  
ALTER TABLE `tb_estoque`
MODIFY `id_estoque` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- Adicionar Chave Primária tabela colaborador------------------------------------------------------------
ALTER TABLE `tb_colaborador`
ADD UNIQUE KEY `nome_colaborador_uniq`(`nome_colaborador`);

-- Indicando chave Estrangeira tb_entrada ---------------------------------------------------------------------------
ALTER TABLE `tb_entrada`
ADD CONSTRAINT `id_colaborador_entrada_fk` FOREIGN KEY (`id_colaborador_entrada`)
REFERENCES `tb_colaborador` (`id_colaborador`),
ADD CONSTRAINT `id_produto_entrada_fk` FOREIGN KEY (`id_produto_entrada`)
REFERENCES `tb_produto` (`id_produto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Indicando chave Estrangeira tb_saida ---------------------------------------------------------------------------
ALTER TABLE `tb_saida`
ADD CONSTRAINT `id_colaborador_saida_fk` FOREIGN KEY (`id_colaborador_saida`)
REFERENCES `tb_colaborador` (`id_colaborador`),
ADD CONSTRAINT `id_produto_entrada_saida_fk` FOREIGN KEY (`id_produto_entrada_saida`)
REFERENCES `tb_entrada` (`id_entrada`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Indicando chave Estrangeira tb_estoque ---------------------------------------------------------------------------
ALTER TABLE `tb_estoque`
ADD CONSTRAINT `id_colaborador_entrada_estoque_fk` FOREIGN KEY (`id_colaborador_entrada_estoque`)
REFERENCES `tb_entrada` (`id_colaborador_entrada`),
ADD CONSTRAINT `id_produto_entrada_estoque_fk` FOREIGN KEY (`id_produto_entrada_estoque`)
REFERENCES `tb_entrada` (`id_produto_entrada`),
ADD CONSTRAINT `id_produto_entrada_saida_estoque_fk` FOREIGN KEY (`id_produto_entrada_saida_estoque`)
REFERENCES `tb_saida` (`id_produto_entrada_saida`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Criando a view lista de produto Entrada--------------------------------------------------------
-- view entrada de caixa de produto	no estoque
CREATE VIEW produto_saida AS
SELECT  s.id_saida,
		s.data_hora_saida,
        s.descri_produto_entrada_saida,
		s.quanti_caixa_entrada_saida,
        s.quanti_palete_entrada_saida,
		s.nivel_colaborador_saida
	
FROM 	tb_saida s
INNER JOIN tb_colaborador c ON s.id_colaborador_saida = c.id_colaborador


	



