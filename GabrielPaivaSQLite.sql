PRAGMA foreing_keys = on;

------------- CREATE TABLES -------------

CREATE TABLE cliente(
	id INT NOT NULL,
  	nome VARCHAR(100) NOT NULL,
  	sobrenome VARCHAR(100) NOT NULL,
  	telefone INT NOT NULL,
  	email VARCHAR(100) NOT NULL,
  	idendereco INT NOT NULL,
  	PRIMARY KEY(id),
  	FOREIGN KEY(idendereco) REFERENCES endereco(id) 
);

CREATE TABLE endereco(
	id INT NOT NULL,
  	idcliente INT NOT NULL,
  	endereco VARCHAR(100) NOT NULL,
  	cep INT(8) NOT NULL,
  	cidade VARCHAR(100) NOT NULL,
  	estado VARCHAR(100) NOT NULL,
  	PRIMARY KEY(id, idcliente),
  	FOREIGN KEY(idcliente) REFERENCES cliente(id)
);

CREATE TABLE categoria(
	id INT NOT NULL,
  	nome VARCHAR(100),
  	PRIMARY KEY(id)
);

CREATE TABLE produto(
	id INT NOT NULL,
  	nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
  	marca VARCHAR(100) NOT NULL,
	preco FLOAT NOT NULL,
  	idcategoria INT NOT NULL,
  	PRIMARY KEY(id),
  	FOREIGN KEY(idcategoria) REFERENCES categoria(id)
);

CREATE TABLE pedido(
	id INT NOT NULL,
  	idcliente INT NOT NULL,
  	idendereco INT NOT NULL,
  	valortotal FLOAT NOT NULL,
  	formadepagamento VARCHAR(100) NOT NULL,
  	datapedido DATE NOT NULL,
  	dataentrega DATE NOT NULL,
  	PRIMARY KEY(id, idcliente),
  	FOREIGN KEY(idcliente) REFERENCES cliente(id),
    FOREIGN KEY(idendereco) REFERENCES endereco(id)
); 
	
CREATE TABLE itens(
	id INT NOT NULL,
  	idpedido INT NOT NULL,
  	idproduto INT NOT NULL,
  	quantidade INT NOT NULL,
  	PRIMARY KEY(id, idpedido),
  	FOREIGN KEY(idpedido) REFERENCES pedido(id),
  	FOREIGN KEY(idproduto) REFERENCES produto(id)
); 

CREATE TABLE carrinho(
	id INT NOT NULL,
  	idcliente INT NOT NULL,
  	idproduto INT NOT NULL,
  	quantidade INT NOT NULL,
  	PRIMARY KEY(id, idcliente),
  	FOREIGN KEY(idcliente) REFERENCES cliente(id),
  	FOREIGN KEY(idproduto) REFERENCES produto(id)
);  

------------- DROPS -------------

DROP TABLE cliente;
DROP TABLE endereco;
DROP TABLE categoria; 
DROP TABLE produto; 
DROP TABLE pedido;
DROP TABLE itens; 
DROP TABLE carrinho; 

------------- INSERTS EXAMPLES -------------

INSERT INTO cliente(id, nome, sobrenome, telefone, email, idendereco) VALUES (1, "Gabriel", "Paiva", 61996202726, "paivagb@gmail.com", 1);

INSERT INTO endereco(id, idcliente, endereco , cep , cidade, estado) VALUES (1, 1, "Quadra 20", 72316217, "Brasilia", "Distrito Federal"); 

INSERT INTO categoria(id, nome) VALUES (1, "Perifericos"); 

INSERT INTO produto(id, nome, descricao, marca, preco, idcategoria) VALUES (1, "Teclado", "Um produto de otima qualidade!", "HyperX", 499.0, 1); 

INSERT INTO pedido(id, idcliente, idendereco, valortotal, formadepagamento, datapedido, dataentrega) VALUES (1, 1, 1 , 499.0, "PIX", "09/03/2023", "12/03/2023"); 

INSERT INTO itens(id, idpedido, idproduto, quantidade) VALUES (1, 1, 1, 1); 

INSERT INTO carrinho(id, idcliente, idproduto, quantidade) VALUES (1, 1 ,1 ,1);

------------- SELECT EXAMPLES -------------

SELECT * FROM cliente;

SELECT * FROM endereco;

SELECT * FROM categoria; 

SELECT * FROM produto;

SELECT * FROM pedido;

SELECT * FROM itens;

SELECT * FROM carrinho;  