/*
Segunda Entrega: Bases de datos
Grupo: 4
Nombres: David Palacios, Sebastian Vergara, Nicolas Sanchez, Maria Camila Paternina, Paula Penuela
Cuenta: is562815
*/

DROP TABLE Ciudad CASCADE CONSTRAINTS;
DROP TABLE Compra CASCADE CONSTRAINTS;
DROP TABLE Comprador CASCADE CONSTRAINTS;
DROP TABLE Departamento CASCADE CONSTRAINTS;
DROP TABLE Descuento CASCADE CONSTRAINTS;
DROP TABLE DescuentosAplicados CASCADE CONSTRAINTS;
DROP TABLE EstadoEliminacion CASCADE CONSTRAINTS;
--DROP TABLE Factura CASCADE CONSTRAINTS;
DROP TABLE Foto CASCADE CONSTRAINTS;
DROP TABLE Fotografo CASCADE CONSTRAINTS;
DROP TABLE FotosPorCompra CASCADE CONSTRAINTS;
DROP TABLE HistorialVisitas CASCADE CONSTRAINTS;
DROP TABLE HostedFoto CASCADE CONSTRAINTS;
DROP TABLE Impuesto CASCADE CONSTRAINTS;
DROP TABLE ImpuestosAplicados CASCADE CONSTRAINTS;
DROP TABLE PagoPorCompra CASCADE CONSTRAINTS;
DROP TABLE Pais CASCADE CONSTRAINTS;
DROP TABLE Periodo CASCADE CONSTRAINTS;
DROP TABLE Resolucion CASCADE CONSTRAINTS;
DROP TABLE SitioDescarga CASCADE CONSTRAINTS;
DROP TABLE Tarjeta CASCADE CONSTRAINTS;
DROP TABLE TipoDePago CASCADE CONSTRAINTS;
DROP TABLE TiposdeSujeto CASCADE CONSTRAINTS;
DROP TABLE TiposDeTarjeta CASCADE CONSTRAINTS;
DROP TABLE TiposExperiencia CASCADE CONSTRAINTS;
DROP TABLE TiposTema CASCADE CONSTRAINTS;
DROP TABLE TipoTamano CASCADE CONSTRAINTS;
DROP TABLE Ubicacion CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;

CREATE TABLE Ciudad (
  Codigo                 number(10) NOT NULL UNIQUE, 
  Nombre                 varchar2(255) NOT NULL, 
  DepartamentoCodigo     number(10) NOT NULL, 
  DepartamentoPaisCodigo number(10) NOT NULL, 
  PRIMARY KEY (Codigo, 
  DepartamentoCodigo, 
  DepartamentoPaisCodigo));
grant select on Ciudad to jcarreno;

CREATE TABLE Departamento (
  Codigo     number(10) NOT NULL UNIQUE, 
  Nombre     varchar2(255) NOT NULL, 
  PaisCodigo number(10) NOT NULL, 
  PRIMARY KEY (Codigo, 
  PaisCodigo));
grant select on Departamento to jcarreno;

CREATE TABLE Pais (
  Codigo number(10) GENERATED AS IDENTITY, 
  Nombre varchar2(255) NOT NULL, 
  PRIMARY KEY (Codigo));
grant select on Pais to jcarreno;

CREATE TABLE Ubicacion (
  CantidaddeFotos              number(10), 
  CiudadCodigo                 number(10) NOT NULL, 
  CiudadDepartamentoCodigo     number(10) NOT NULL, 
  CiudadDepartamentoPaisCodigo number(10) NOT NULL, 
  PRIMARY KEY (CiudadCodigo, 
  CiudadDepartamentoCodigo, 
  CiudadDepartamentoPaisCodigo));
grant select on Ubicacion to jcarreno;

CREATE TABLE Foto (
  ID                            number(10) GENERATED AS IDENTITY, 
  NombreArchivo                 varchar2(255) NOT NULL UNIQUE, 
  Nombre                        varchar2(255), 
  Fecha                         date, 
  Descripcion                   varchar2(255), 
  Precio                        number(10), 
  UbicacionCiudadCodigo         number(10), 
  UbicacionDepartamentoCodigo   number(10), 
  UbicacionPaisCodigo           number(10), 
  FotografoUsuarioNombreUsuario varchar2(255), 
  ResolucionID                  number(10), 
  TipoTamanoID                  number(10), 
  TiposTemaID                   number(10), 
  TiposdeSujetoID               number(10), 
  EstadoEliminacionID           number(10) NOT NULL, 
  PRIMARY KEY (ID));
grant select on Foto to jcarreno;

CREATE TABLE EstadoEliminacion (
  EstadoActual varchar2(255) NOT NULL, 
  ID           number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on EstadoEliminacion to jcarreno;

CREATE TABLE TiposdeSujeto (
  Sujeto varchar2(255) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TiposdeSujeto to jcarreno;

CREATE TABLE TiposTema (
  Tema varchar2(255) NOT NULL, 
  ID   number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TiposTema to jcarreno;

CREATE TABLE Resolucion (
  Alto  number(10) NOT NULL, 
  Ancho number(10) NOT NULL, 
  ID    number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on Resolucion to jcarreno;

CREATE TABLE TipoTamano (
  Tamano number(10) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TipoTamano to jcarreno;

CREATE TABLE HostedFoto (
  SitioDescargaURL varchar2(255) NOT NULL, 
  FotoID           number(10) NOT NULL, 
  PRIMARY KEY (SitioDescargaURL, 
  FotoID));
grant select on HostedFoto to jcarreno;

CREATE TABLE SitioDescarga (
  Nombre varchar2(255) NOT NULL, 
  URL    varchar2(255) NOT NULL, 
  PRIMARY KEY (URL));
grant select on SitioDescarga to jcarreno;

CREATE TABLE Fotografo (
  VentasPasadas        number(10), 
  ComisionTotal        number(10), 
  UsuarioNombreUsuario varchar2(255) NOT NULL, 
  TiposExperienciaID   number(10), 
  PRIMARY KEY (UsuarioNombreUsuario));
grant select on Fotografo to jcarreno;

CREATE TABLE TiposExperiencia (
  Experiencia varchar2(255) NOT NULL, 
  ID          number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TiposExperiencia to jcarreno;

CREATE TABLE Usuario (
  NombreUsuario   varchar2(255) NOT NULL, 
  Contrasena      varchar2(255) NOT NULL, 
  Nombre          varchar2(255) NOT NULL, 
  Apellido        varchar2(255) NOT NULL, 
  DireccionCorreo varchar2(255) NOT NULL, 
  PRIMARY KEY (NombreUsuario));
grant select on Usuario to jcarreno;

CREATE TABLE FotosPorCompra (
  CompraID               number(10) NOT NULL, 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  NumeroCompra           number(10) NOT NULL, 
  FotoID                 number(10) NOT NULL, 
  Cantidad               number(10), 
  Precio                 number(10), 
  PRIMARY KEY (CompraID, 
  NombreUsuarioComprador, 
  NumeroCompra, 
  FotoID));
grant select on FotosPorCompra to jcarreno;

CREATE TABLE Comprador (
  MetodosPago   varchar2(255) NOT NULL, 
  NombreUsuario varchar2(255) NOT NULL, 
  PRIMARY KEY (NombreUsuario));
grant select on Comprador to jcarreno;

CREATE TABLE Compra (
  ID                     number(10) NOT NULL, 
  Miniaturas             varchar2(255), 
  Precio                 float(10), 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  PeriodoFechas          date NOT NULL, 
  PRIMARY KEY (ID, 
  NombreUsuarioComprador));
grant select on Compra to jcarreno;

CREATE TABLE Tarjeta (
  NumerodeTarjeta        number(16) NOT NULL, 
  NombreTitular          varchar2(255) NOT NULL, 
  MesVencimiento         number(10) NOT NULL, 
  AnoVencimiento         number(10) NOT NULL, 
  Correo                 varchar2(255) NOT NULL, 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  TiposDeTarjetaID       number(10), 
  PRIMARY KEY (NumerodeTarjeta, 
  NombreUsuarioComprador));
grant select on Tarjeta to jcarreno;

CREATE TABLE TipoDePago (
  Nombre varchar2(255) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TipoDePago to jcarreno;

CREATE TABLE TiposDeTarjeta (
  Tipo varchar2(255) NOT NULL, 
  ID   number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
grant select on TiposDeTarjeta to jcarreno;

CREATE TABLE Impuesto (
  ID           number(10) GENERATED AS IDENTITY, 
  TipoImpuesto varchar2(255) NOT NULL, 
  Porcentaje     number(10), 
  PRIMARY KEY (ID));
grant select on Impuesto to jcarreno;

CREATE TABLE Descuento (
  ID            number(10) GENERATED AS IDENTITY, 
  TipoDescuento number(10) NOT NULL,
  Porcentaje number(10) NULL, 
  PRIMARY KEY (ID));
grant select on Descuento to jcarreno;

CREATE TABLE PagoPorCompra (
  TipoDePagoID                         number(10) NOT NULL,  
  CompraID                     number(10) NOT NULL, 
  CompraNombreUsuarioComprador varchar2(255) NOT NULL, 
  PRIMARY KEY (TipoDePagoID,  
  CompraID, 
  CompraNombreUsuarioComprador));
grant select on PagoPorCompra to jcarreno;

CREATE TABLE ImpuestosAplicados (
  ImpuestoID                           number(10) NOT NULL, 
  CompraID                      number(10) NOT NULL, 
  CompraNombreUsuarioComprador varchar2(255) NOT NULL, 
  Impuestos                            number(10), 
  PRIMARY KEY (
  ImpuestoID, 
  CompraID, 
  CompraNombreUsuarioComprador));
grant select on ImpuestosAplicados to jcarreno;

CREATE TABLE DescuentosAplicados (
  Descuentos                           number(10), 
  DescuentoID                          number(10) NOT NULL, 
  CompraID                     number(10) NOT NULL, 
  CompraNombreUsuarioComprador varchar2(255) NOT NULL, 
  PRIMARY KEY ( 
  DescuentoID, 
  CompraID, 
  CompraNombreUsuarioComprador));
grant select on DescuentosAplicados to jcarreno;

CREATE TABLE Periodo (
  Fechas date NOT NULL, 
  PRIMARY KEY (Fechas));
grant select on Periodo to jcarreno;

CREATE TABLE HistorialVisitas (
  NumerodeRegistro       number(10) NOT NULL, 
  CompradorNombreUsuario varchar2(255) NOT NULL, 
  PeriodoFechas          date NOT NULL, 
  PRIMARY KEY (NumerodeRegistro, 
  CompradorNombreUsuario));
grant select on HistorialVisitas to jcarreno;

ALTER TABLE Departamento ADD CONSTRAINT FKDepartamen363547 FOREIGN KEY (PaisCodigo) REFERENCES Pais (Codigo);
ALTER TABLE Ciudad ADD CONSTRAINT FKCiudad766665 FOREIGN KEY (DepartamentoCodigo, DepartamentoPaisCodigo) REFERENCES Departamento (Codigo, PaisCodigo);
ALTER TABLE Ubicacion ADD CONSTRAINT FKUbicacion472733 FOREIGN KEY (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) REFERENCES Ciudad (Codigo, DepartamentoCodigo, DepartamentoPaisCodigo);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo173846 FOREIGN KEY (UsuarioNombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo191828 FOREIGN KEY (TiposExperienciaID) REFERENCES TiposExperiencia (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto985865 FOREIGN KEY (UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo) REFERENCES Ubicacion (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo);
ALTER TABLE Foto ADD CONSTRAINT FKFoto34441 FOREIGN KEY (FotografoUsuarioNombreUsuario) REFERENCES Fotografo (UsuarioNombreUsuario);
ALTER TABLE Foto ADD CONSTRAINT FKFoto688381 FOREIGN KEY (ResolucionID) REFERENCES Resolucion (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto204526 FOREIGN KEY (TipoTamanoID) REFERENCES TipoTamano (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto197005 FOREIGN KEY (TiposTemaID) REFERENCES TiposTema (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto330125 FOREIGN KEY (TiposdeSujetoID) REFERENCES TiposdeSujeto (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto686489 FOREIGN KEY (EstadoEliminacionID) REFERENCES EstadoEliminacion (ID);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto990301 FOREIGN KEY (SitioDescargaURL) REFERENCES SitioDescarga (URL);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto677200 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE Compra ADD CONSTRAINT FKCompra223087 FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (NombreUsuario);
ALTER TABLE Comprador ADD CONSTRAINT FKComprador564135 FOREIGN KEY (NombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Compra ADD CONSTRAINT FKCompra267871 FOREIGN KEY (PeriodoFechas) REFERENCES Periodo (Fechas);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo184215 FOREIGN KEY (CompraID, NombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo465929 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE Tarjeta ADD CONSTRAINT FKTarjeta664276 FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (NombreUsuario);
ALTER TABLE Tarjeta ADD CONSTRAINT FKTarjeta236765 FOREIGN KEY (TiposDeTarjetaID) REFERENCES TiposDeTarjeta (ID);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom68629 FOREIGN KEY (TipoDePagoID) REFERENCES TipoDePago (ID);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom640282 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA165446 FOREIGN KEY (ImpuestoID) REFERENCES Impuesto (ID);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA598302 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos714921 FOREIGN KEY (DescuentoID) REFERENCES Descuento (ID);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos417559 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE HistorialVisitas ADD CONSTRAINT FKHistorialV284966 FOREIGN KEY (CompradorNombreUsuario) REFERENCES Comprador (NombreUsuario);
ALTER TABLE HistorialVisitas ADD CONSTRAINT FKHistorialV548849 FOREIGN KEY (PeriodoFechas) REFERENCES Periodo (Fechas);


INSERT INTO Periodo(Fechas) VALUES (to_date('11/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('12/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('13/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('14/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('15/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('16/10/2021','DD/MM/YYYY'));
INSERT INTO Periodo(Fechas) VALUES (to_date('17/10/2021','DD/MM/YYYY'));
INSERT INTO Pais(Nombre) VALUES ('Colombia');
INSERT INTO Pais(Nombre) VALUES ('Estados Unidos');
INSERT INTO Pais(Nombre) VALUES ('China');
INSERT INTO Pais(Nombre) VALUES ('Belarus');
INSERT INTO Pais(Nombre) VALUES ('Indonesia');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('SebastianVergara', '123456789', 'Sebastian', 'Vergara', 's_vergara@javeriana.edu.co');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('DariaShetzcova', 'Passwords', 'Daria', 'Shetzcova', 'zpaips.kamikas@getmail.fun');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('Berendey_Ivanov', 'Contrasena', 'Berendev', 'Ivanov', 'vhumam@gmailya.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('eberhardgross', '21940129', 'Eberhard', 'Grossgasteiger', 'feuyouyubrihe-2145@yopmail.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('OmunIaLS', 'dGaq3D4P53zayEX9', 'Juan', 'Vargas', 'cmtjuan@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('HenaTeRg', 'zraypQdkc6tWyMKp', 'Teresa', 'Garcia', 'teresagr@hotmail.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('fURiCIat', 'pgVYMaZmH6DRQBwb', 'Adria', 'Manzano', 'Adrianali@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('ApenHaNT', 'KaEubuEf2qZp6RSY', 'Mark', 'Noguera', 'arnoguera@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('carnIth', 'KskA6A2vA5HyPGpL', 'Jesus', 'Estrada', 'Thansin85@teleworm.us');
INSERT INTO Usuario(NombreUsuario, Contrasena, Nombre, Apellido, DireccionCorreo) VALUES ('PTanisHF', '9XrF6HGXBBuU2kQB', 'Ruben ', 'Salcedo', 'Maden1934@fleckens.hu');
INSERT INTO SitioDescarga(Nombre, URL) VALUES ('Nohat', 'https://drive.google.com/');
INSERT INTO SitioDescarga(Nombre, URL) VALUES ('XFrame', 'https://xframe.io/photos/');
INSERT INTO SitioDescarga(Nombre, URL) VALUES ('Pexels', 'https://www.pexels.com/photo/');
INSERT INTO SitioDescarga(Nombre, URL) VALUES ('Envato', 'https://elements.envato.com/');
INSERT INTO Departamento(Codigo, Nombre, PaisCodigo) VALUES (25300, 'Cundinamarca', 1);
INSERT INTO Departamento(Codigo, Nombre, PaisCodigo) VALUES (91048, 'California', 2);
INSERT INTO Departamento(Codigo, Nombre, PaisCodigo) VALUES (2409124, 'Beijing', 3);
INSERT INTO Departamento(Codigo, Nombre, PaisCodigo) VALUES (543983, 'Vitebsk Oblast ', 4);
INSERT INTO Departamento(Codigo, Nombre, PaisCodigo) VALUES (13421343, 'Bali', 5);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (13652, 'Bogota', 25300, 1);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (20953, 'San Franciso', 91048, 2);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (12412904, 'Beijing', 2409124, 3);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (43542, 'California', 91048, 2);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (23509, 'Vitebsk', 543983, 4);
INSERT INTO Ciudad(Codigo, Nombre, DepartamentoCodigo, DepartamentoPaisCodigo) VALUES (309251, 'Denpasar', 13421343, 5);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 13652, 25300, 1);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 20953, 91048, 2);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 12412904, 2409124, 3);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 43542, 91048, 2);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 23509, 543983, 4);
INSERT INTO Ubicacion(CantidaddeFotos, CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) VALUES (1, 309251, 13421343, 5);
INSERT INTO EstadoEliminacion(EstadoActual) VALUES ('Activo');
INSERT INTO EstadoEliminacion(EstadoActual) VALUES ('Eliminado');
INSERT INTO TiposdeSujeto(Sujeto) VALUES ('Perro');
INSERT INTO TiposdeSujeto(Sujeto) VALUES ('Adolecente');
INSERT INTO TiposdeSujeto(Sujeto) VALUES ('Mujer');
INSERT INTO TiposdeSujeto(Sujeto) VALUES ('Hombre');
INSERT INTO TiposdeSujeto(Sujeto) VALUES ('Naturaleza');
INSERT INTO TiposTema(Tema) VALUES ('Adolecente');
INSERT INTO TiposTema(Tema) VALUES ('Atractivo');
INSERT INTO TiposTema(Tema) VALUES ('Hermoso');
INSERT INTO TiposTema(Tema) VALUES ('Bellesa');
INSERT INTO TiposTema(Tema) VALUES ('Casual');
INSERT INTO TiposTema(Tema) VALUES ('Cara');
INSERT INTO TiposTema(Tema) VALUES ('Mujer');
INSERT INTO TiposTema(Tema) VALUES ('Diversion');
INSERT INTO TiposTema(Tema) VALUES ('Accion');
INSERT INTO Resolucion(Alto, Ancho) VALUES (1920, 1080);
INSERT INTO Resolucion(Alto, Ancho) VALUES (3648, 5472);
INSERT INTO TipoTamano(Tamano) VALUES (3450);
INSERT INTO TipoTamano(Tamano) VALUES (2140);
INSERT INTO TipoTamano(Tamano) VALUES (1230);
INSERT INTO TipoTamano(Tamano) VALUES (5000);
INSERT INTO TiposExperiencia(Experiencia) VALUES ('Profesional');
INSERT INTO TiposExperiencia(Experiencia) VALUES ('Amateur');
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (2, 13000, 'SebastianVergara', 1);
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (2, 6000, 'DariaShetzcova', 2);
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (2, 12632, 'Berendey_Ivanov', 1);
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (691000, 0, 'eberhardgross', 1);
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (12414, 214512, 'carnIth', 1);
INSERT INTO Fotografo(VentasPasadas, ComisionTotal, UsuarioNombreUsuario, TiposExperienciaID) VALUES (1353, 135543, 'PTanisHF', 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('SISTEMAYONOSEQUE.jpg', 'Background', to_date('10/10/2020','DD/MM/YYYY'), 'Test', 10000, 13652, 25300, 1, 'SebastianVergara', 1, 1, 4, 1, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('womantshblack.jpg', 'Woman Wearing Green Crew-neck T-shirt and Black Denim Bottoms Making Face Behind Don&#39;t Trust Anybody Who Doesn&#39;t Have a Sense of Humor Quote on White Wall', to_date('12/09/2018','DD/MM/YYYY'), 'Imagen de una mujer con camiseta verde en frente de un poster que dice "No confies en aquellos que no tienen sentido del humor"', 35130, 20953, 91048, 2, 'DariaShetzcova', 1, 1, 1, 2, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('youngshowingok.png', 'A young business woman is showing OK sign and holding a document folder, isolated background ', to_date('16/06/2021','DD/MM/YYYY'), 'Joven empresaria dando un OK con un folder.', 10239, 12412904, 2409124, 3, 'DariaShetzcova', 1, 3, 7, 3, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('two-men-in-military-clothing-with-guns.jpg', 'Two Men in Military Clothing With Guns ', to_date('16/09/2018','DD/MM/YYYY'), 'Dos hombres en ropa militar con armas. ', 121240, 43542, 91048, 2, 'Berendey_Ivanov', 1, 2, 9, 4, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('green-slope-in-forest.jpg', 'Green slope in forest on mist day ', to_date('15/05/2020','DD/MM/YYYY'), 'Montana verde en lluvia.', 64253, 43542, 91048, 2, 'eberhardgross', 2, 4, 3, 5, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('woeinowing.jpg', 'Multipurpose Professional Certificate Template Design. Abstract Blue Vector illustration ', to_date('18/07/2019','DD/MM/YYYY'), 'Certificado Azul ', 50000, 23509, 543983, 4, 'SebastianVergara', 1, 2, 7, 2, 2);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('vitebsk-belarus-famous-landmark.jpg', 'Vitebsk, Belarus. Famous Landmark Is Assumption Cathedral Church ', to_date('17/06/2021','DD/MM/YYYY'), 'Un hito famoso es la Iglesia Catedral de la Asunci?n en upper Town en Uspensky Mount Hill durante la puesta de sol de invierno. Famoso Patrimonio Hist?rico. ', 145000, 23509, 543983, 4, 'carnIth', 2, 3, 3, 3, 1);
INSERT INTO Foto(NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES ('mount-agung-volcano.jpg', 'Volc?n del Monte Agung en la Amanecer ', to_date('15/07/2021','DD/MM/YYYY'), 'Volc?n Agung al Amanecer, vista desde la Playa de Sanur en Bali Indonesia ', 230000, 309251, 13421343, 5, 'PTanisHF', 2, 2, 5, 3, 1);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://drive.google.com/', 1);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://xframe.io/photos/', 2);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://www.pexels.com/photo/', 3);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://www.pexels.com/photo/', 5);
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'OmunIaLS');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'HenaTeRg');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'fURiCIat');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'ApenHaNT');
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (1, 'woman.jpg', null, 'OmunIaLS', to_date('11/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (2, 'tarjetamadres.jpg', null, 'HenaTeRg', to_date('11/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (3, 'hombreenfiguras.jpg', null, 'fURiCIat', to_date('12/10/2021','DD/MM/YYYY'));

INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (4, 'hombreenfiguras.jpg', null, 'ApenHaNT', to_date('11/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (5, 'hombreenfiguras.jpg', null, 'HenaTeRg', to_date('12/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (6, 'hombreenfiguras.jpg', null, 'fURiCIat', to_date('13/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (7, 'hombreenfiguras.jpg', null, 'ApenHaNT', to_date('14/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (8, 'hombreenfiguras.jpg', null, 'fURiCIat', to_date('15/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (9, 'hombreenfiguras.jpg', null, 'HenaTeRg', to_date('16/10/2021','DD/MM/YYYY'));
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (10, 'hombreenfiguras.jpg', null, 'fURiCIat', to_date('17/10/2021','DD/MM/YYYY'));


INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Visa');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Master Card');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('American Express');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('UnionPay');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Dinners');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Discover');
INSERT INTO TipoDePago(Nombre) VALUES ('Tarjeta');
INSERT INTO TipoDePago(Nombre) VALUES ('PayPal');
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AnoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (4532433144323849, 'Keiran Watt ', 8, 23, 'Cands1953@rhyta.com', 'OmunIaLS', 1);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AnoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (5512957484972881, 'Beyonce Armitage ', 6, 23, 'Sath1971@dayrep.com', 'HenaTeRg', 2);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AnoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (349681756060692, 'Alexandra Laing ', 4, 25, 'Vored1978@einrot.com', 'fURiCIat', 3);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AnoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (349761961680052, 'Shania Mcgrath ', 6, 25, 'Bance1932@jourrapide.com', 'ApenHaNT', 3);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AnoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (5223698497793811, 'Mark Noguera', 4, 22, 'arnoguera@gmail.com', 'ApenHaNT', 2);
INSERT INTO Impuesto(TipoImpuesto, Porcentaje) VALUES ('ReteFuente', 7);
INSERT INTO Impuesto(TipoImpuesto, Porcentaje) VALUES ('IVA', 16);
INSERT INTO Impuesto(TipoImpuesto, Porcentaje) VALUES ('ICA', 6);
INSERT INTO Descuento(TipoDescuento,Porcentaje) VALUES (2,2);
INSERT INTO Descuento(TipoDescuento,Porcentaje) VALUES (4,4);
INSERT INTO Descuento(TipoDescuento,Porcentaje) VALUES (5,5);

INSERT INTO PagoPorCompra(TipoDePagoID, CompraID, CompraNombreUsuarioComprador) VALUES (1, 1, 'OmunIaLS');
INSERT INTO PagoPorCompra(TipoDePagoID, CompraID, CompraNombreUsuarioComprador) VALUES (2, 2, 'HenaTeRg');
INSERT INTO PagoPorCompra(TipoDePagoID, CompraID, CompraNombreUsuarioComprador) VALUES (2, 3, 'fURiCIat');


INSERT INTO ImpuestosAplicados( ImpuestoID, CompraID, CompraNombreUsuarioComprador, Impuestos) VALUES (1, 1, 'OmunIaLS', null);
INSERT INTO ImpuestosAplicados( ImpuestoID, CompraID, CompraNombreUsuarioComprador, Impuestos) VALUES (2, 2, 'HenaTeRg', null);
INSERT INTO ImpuestosAplicados( ImpuestoID, CompraID, CompraNombreUsuarioComprador, Impuestos) VALUES (3, 3, 'fURiCIat', null);
INSERT INTO ImpuestosAplicados( ImpuestoID, CompraID, CompraNombreUsuarioComprador, Impuestos) VALUES (2, 7, 'ApenHaNT', null);





INSERT INTO DescuentosAplicados(Descuentos, DescuentoID, CompraID, CompraNombreUsuarioComprador) VALUES (null, 2, 2, 'HenaTeRg');
INSERT INTO DescuentosAplicados(Descuentos, DescuentoID, CompraID, CompraNombreUsuarioComprador) VALUES (null, 1, 6, 'HenaTeRg');
INSERT INTO DescuentosAplicados(Descuentos, DescuentoID, CompraID, CompraNombreUsuarioComprador) VALUES (null, 3, 8, 'fURiCIat');


INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (1, 'OmunIaLS', 1, 1, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (2, 'HenaTeRg', 2, 2, 4, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (3, 'fURiCIat', 3, 3, 1, null);

INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (4, 'ApenHaNT', 4, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (2, 'HenaTeRg', 5, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (6, 'fURiCIat', 6, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (7, 'ApenHaNT', 7, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (8, 'fURiCIat', 8, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (9, 'HenaTeRg', 9, 5, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (10, 'fURiCIat', 10,5, 1, null);





INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (1, 'OmunIaLS', to_date('11/10/2021','DD/MM/YYYY'));
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (2, 'HenaTeRg', to_date('12/10/2021','DD/MM/YYYY'));
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (3, 'fURiCIat', to_date('12/10/2021','DD/MM/YYYY'));
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (4, 'OmunIaLS', to_date('13/10/2021','DD/MM/YYYY'));


--CONSULTAS
/*
1. Liste el nombre de las fotos que han sido compradas en todos los periodos registrados en
el sistema.
*/

/*Vista que cuenta la cantidad de distintos periodos*/
create or replace view v_cantidadPeriodos(cantidad) as
(
    select distinct count(fechas)
    from periodo
);

/*Vista que cuenta en cuantas fechas ha sido vendida una foto*/
create or replace view v_cantidadFotoFecha(cantidad, nombre) as(
    select distinct count (c.periodofechas), f.nombrearchivo from foto f
    inner join fotosporcompra fc on (f.id = fc.fotoid)
    inner join compra c on (fc.compraid = c.id)
    group by f.nombrearchivo
);

select v2.cantidad, v2.nombre from v_cantidadPeriodos v1 
inner join v_cantidadFotoFecha v2 on (v2.cantidad = v1.cantidad);

/*
2.Liste fecha de la compra, el nombre del cliente, total de la compra (sumatoria del valor
unitario de cada foto de la orden), total de descuentos (sumatoria de todos los descuentos
aplicados a la compra), total de impuestos (sumatoria de todos los impuestos aplicados a
cada compra) y total a pagar (suma el total rest?ndole los descuentos y sum?ndole los
impuestos). La ?ltima fila debe llevar la suma de todas las columnas.
*/

/*Vista que calcula el total de una compra sin descuentos ni impuestos*/
create or replace view v_calcularTotalBruto(compraid, total) as (
select c.id, sum(f.precio) from compra c
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
group by c.id
);
/*Vista que calcula los descuentos aplicados a una compra*/
create or replace view v_calcularDescuentos(compraid, descuentos) as(
select c.id, sum(f.precio * (d.porcentaje/100)) from descuentosaplicados da
inner join compra c on(c.id = da.compraid)
inner join descuento d on (d.id = da.descuentoid)
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
group by c.id
);

/*Vista que calcula los impuestos aplicados a una compra*/
create or replace view v_calcularImpuestos(compraid, impuestos) as(
select c.id, sum(f.precio * (i.porcentaje/100)) from impuestosaplicados ia
inner join compra c on(c.id = ia.compraid)
inner join impuesto i on (i.id = ia.impuestoid)
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
group by c.id
);

select c.id, c.periodofechas, u.nombre, u.apellido, v1.total Total,
    nvl(v2.descuentos,0) Descuentos,
    nvl(v3.impuestos,0) Impuestos,
    nvl(Total -nvl(v2.descuentos,0) +  nvl(v3.impuestos,0),0) TotalPago
from compra c 
inner join usuario u on (c.nombreusuariocomprador = u.nombreusuario)
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
left join v_calcularTotalBruto v1 on (c.id = v1.compraid)
left join v_calcularDescuentos v2 on(c.id = v2.compraid)
left join v_calcularImpuestos v3 on(c.id = v3.compraid)
group by c.id, c.periodofechas, u.nombre, u.apellido, v1.total, v2.descuentos, v3.impuestos,0
order by c.id;

/*
3. Reporte de ventas por pa?s. Se debe listar el nombre del pa?s, la fecha y el total a pagar
(suma el total rest?ndole los descuentos y sum?ndole los impuestos). Los pa?ses que no
tengan ventas en las distintas fechas deben aparecer en 0. La ?ltima fila debe llevar la
suma de todas las columnas.
*/

/*Vista que calcula el total de las compras sin descuentos ni impuestos por pais*/
create or replace view v_calcularTotalBrutoPais(paisid,pais, total) as (
select p.codigo,p.nombre, sum(f.precio) from compra c
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
right join pais p on (p.codigo = f.ubicacionpaiscodigo)
group by p.codigo, p.nombre
);

/*Vista que calcula los descuentos aplicados a una compra por Pais*/
create or replace view v_calcularDescuentosPais(paisid, pais, descuentos) as(
select p.codigo, p.nombre, sum(f.precio * (d.porcentaje/100)) from descuentosaplicados da
inner join compra c on(c.id = da.compraid)
inner join descuento d on (d.id = da.descuentoid)
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
right join pais p on (p.codigo = f.ubicacionpaiscodigo)
group by p.codigo, p.nombre
);

/*Vista que calcula los impuestos aplicados a una compra*/
create or replace view v_calcularImpuestosPais(paisid,pais,impuestos) as(
select p.codigo, p.nombre, sum(f.precio * (i.porcentaje/100)) from impuestosaplicados ia
inner join compra c on(c.id = ia.compraid)
inner join impuesto i on (i.id = ia.impuestoid)
inner join fotosporcompra fc on (c.id = fc.compraid)
inner join foto f on (f.id = fc.fotoid)
right join pais p on (p.codigo = f.ubicacionpaiscodigo)
group by p.codigo, p.nombre,c.periodofechas
);
select v1.pais, v1.fecha, (v1.total-v2.descuentos+ v3.impuestos)
from v_calcularTotalBrutoPais v1
inner join v_calcularDescuentosPais v2 on(v1.paisid = v2.paisid)
inner join v_calcularImpuestosPais v3 on(v1.paisid = v3.paisid)
group by v1.pais, v1.fecha, (v1.total-v2.descuentos+ v3.impuestos);



