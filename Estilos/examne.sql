CREATE DATABASE dbElectrodomesticos
use dbElectrodomesticos;
CREATE TABLE CLIENTE(

CODCLI char(4),
NOMCLI varchar(60),
APECLI varchar(80),
EMACLI varchar(80),
CELCLI char(9),
DIRCLI varchar(70),
ESTCLI char(1)
CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
);

CREATE TABLE VENDEDOR(

CODVEND char(4),
NOMVEND varchar(60),
APEVEND varchar(80),
EMAVEND varchar(80),
CELVEND char(9),
DIRVEND varchar(70),
ESTVEND char(1)
CONSTRAINT VENDEDOR_pk PRIMARY KEY (CODVEND)
);


CREATE TABLE PRODUCTO(

CODPRO char(5),
DESCPRO varchar(80),
CATPRO char(1),
PREPRO decimal(8,2),
STOCKPRO int,
ESTPRO char(1),
CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
);


CREATE TABLE PROVEEDOR(

CODPROV char(5),
RAZSOCPROV varchar(90),
RUCPROV varchar(11),
EMAPROV varchar(70),
ESTPROV char(1),
CONSTRAINT PROVEEDOR_pk PRIMARY KEY (CODPROV)
);



CREATE TABLE VENTA(

CODVEN char(5),
FECVEN datetime,
CODCLI char(4),
CODVEND char(4),
ESTVEN char(1),
CONSTRAINT VENTA_pk PRIMARY KEY (CODVEN)
);


CREATE TABLE VENTADETALLE(


IDVENDET int identity(1,1), 
CODVEN char(5),
CODPRO char(5),
CANTPRO int,
CONSTRAINT VENTADETALLE_pk PRIMARY KEY (IDVENDET)

);


CREATE TABLE COMPRA(

CODCOM char(5),
FECCOM datetime,
CODVEND char(4),
CODPROV char(5),
ESTCOM char(1),
CONSTRAINT COMPRA_pk PRIMARY KEY (CODCOM)
);


CREATE TABLE COMPRADETALLE(


IDCOMDET int identity(1,1), 
CODCOM char(5),
CODPRO char(5),
CANTPRO int,
CONSTRAINT    COMPRADETALLE_pk PRIMARY KEY (IDCOMDET)

);



ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_VENDEDOR
    FOREIGN KEY (CODVEND)
    REFERENCES VENDEDOR (CODVEND);


    insert into CLIENTE (CODCLI, NOMCLI, APECLI, EMACLI,CELCLI,DIRCLI,ESTCLI) Values
    ('CL01','Juana','Campos Ortíz','juana.campos@gmail.com','987485152','Av. Miraflores','A'),
    ('CL02','Sofía','Barrios Salcedo','sofia.barrios@outlook.com','','Jr. Huallaga','A'),
    ('CL03','Claudio','Pérez Luna','claudio.perez@outlook.com','987485152','Av. Libertadores','A'),
    ('CL04','Marcos','Ávila Manco','marcos.avila@yahoo.com','','Calle. Huallaga','A'),
    ('CL05','Anastasio','salomon Inti','anastasio.salomon@gmail.com','','Jr. San Martin','A');

        insert into VENDEDOR (CODVEND,NOMVEND,APEVEND,EMAVEND,CELVEND,DIRVEND,ESTVEND) Values
    ('VEN1','Gloria','Carrizales Paredes','gloria.carrizales@gmail.com','984574123','Calle las Begonias','A'),
    ('VEN2','Gabriel','Lozana Lombardi','gabriel.lombardi@gmail.com','974512368','Av. Los Girasoles','A'),
    ('VEN3','Gilberto','Martinez Guerra','gilberto.martinez@gmail.com','','Jr. Palomares','A');
    
            insert into PROVEEDOR (CODPROV,RAZSOCPROV,RUCPROV,EMAPROV,ESTPROV) Values
    ('PRV01','LG Corporation','87542136951','informes@ig.com.pe','A'),
    ('PRV02','SONY','45213698741','informes@sony.com.pe','A'),
    ('PRV03','SAMSUNG','85321697661','informes@samsung.com.pe','A'),
    ('PRV04','OSTER SRL','55663214478','informes@oster.com.pe','A'),
    ('PRV05','ASUS','99663325478','informes@asus.com.pe','A');

            insert into PRODUCTO (CODPRO,DESCPRO,CATPRO,PREPRO,STOCKPRO,ESTPRO) Values
    ('PRO01','Refrigeradora LG Side By Side','1','4149','15','A'),
    ('PRO02','Refrigeradora SBS 602L','1','3599','10','A'),
    ('PRO03','Refrigeradora Top Mount 500L','1','2799','8','A'),
    ('PRO04','TV SAMSUNG UHD 55"','2','1799','25','A'),
    ('PRO05','Televisor 65" LG UHD 4K','2','2999','20','A'),
    ('PRO06','TV CRYSTAL UHD 55','2','2299','7','A'),
    ('PRO07','ASUS X415JA Core13 10a Gen 14"','3','1099','17','A'),
    ('PRO08','Lenovo IdeaPad 5i Intel Core 17 14"','3','3099','10','A'),
    ('PRO09','Laptop HP 15-dw1085la Intel Core i7 i3','3','1600','15','A'),
    ('PRO10','Galaxy A52 128GB','4','1200','25','A'),
    ('PRO11','¡Phone 11 64GB Morado','4','2600','30','A'),
    ('PRO12','Poco X3 GT 5G 256GB 8GB','4','1450','20','A');
SELECT * FROM CLIENTE
GO
CREATE PROCEDURE spInserCliente
(
  @CODCLI char(6),
  @NOMCLI nvarchar(60),
  @APECLI nvarchar(60),
  @EMACLI nvarchar(60),
  @CELCLI nvarchar(60),
  @DIRCLI nvarchar(60),
  @ESTCLI nvarchar(60)
  )
 AS 
 BEGIN 
SET NOCOUNT ON 
INSERT INTO  CLIENTE 
(CODCLI,NOMCLI,APECLI,EMACLI,CELCLI,DIRCLI,ESTCLI)
VALUES 
(@CODCLI, @NOMCLI, @APECLI, @EMACLI, @CELCLI, @DIRCLI, @ESTCLI)
SELECT * FROM CLIENTE
WHERE CODCLI = @CODCLI
END 
GO
