-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lnname, CPF, Address,
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values('Maria','M', 'Silva', 123456789, 'rua silva de prata 29, Carangola - Cidade das Flores - Ba'),
			('Matheus','C','Silva', 98765432, 'rua alberto josé 289, jardins - Caculé - Ba'),
            ('Jorge','C','Santos', 159753456, 'Av cesar filho 35 - Nova Holanda - Caraiba - Ba'),
            ('Paulo','T','Sampaio', 7563951258, 'Alameda Jequiti 123 - cidade jardim - Uberlandia - MG');
select * from clients;
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size, price
insert into product(Pname, classification_kids, category, avaliação, size, price) values
		('Fone de ouvido',false,'Eletrônico','4',null,null),
        ('Barbie Elsa',true,'Brinquedo','3',null,null),
        ('Sofá Retratil',false,'Móveis','3','3x57x80',null);
        
select * from clients;
select * from product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment, idPPproduct
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment, idPPproduct) values
					(1, default,'compra via aplicativo',null,1,1,1),
                    (2, default,'compra via aplicativo',50,0,2,1),
                    (3,'Confirmado',null,null,1,3,1);
select * from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
					(1,5,2,null),
                    (2,5,1,null),
                    (3,6,1,null);
select * from productOrder;
                    
-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
					('Rio de Janeiro',1000),
                    ('Rio de Janeiro',500),
                    ('São Paulo',10);
select * from productStorage;

-- idLprodut, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
					('Almeida e Filhos', 123456789123456, '21985474'),
                    ('Eletrônica Silva', 854519649143457, '21975474'),
                    ('Eletrônicos Valma', 934567893934469, '21975474');
select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
					(1,1,500),
                    (1,2,400),
                    (2,4,633);
select * from productSupplier;

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact 
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletrônicos', null, 123456789123456, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, null, 123456789, 'Rio de Janeiro', 219567891),
                    ('Kids World', null, 987654321234567, null, 'São Paulo',1198657484);
select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
						(1,6,80),
                        (2,7,10);
select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;

select concat(Fname,' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment, idPPproduct) values
					(2, default, 'compra via aplicativo', null,1,1,1);
                    
select * from clients c, orders o
			where c.idClient = idOrderClient;
            
select * from clients left outer join orders ON idClient = idOrderClient;

select * from orders;

-- recuperação de pedido com produto associado
select * from clients c 
					inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder = o.idOrder
			group by idClient;
            
-- recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c
				inner join orders o ON c.idClient = o.idOrderClient
			group by idClient;








                    

        
            
            