DROP TABLE Ciudad CASCADE CONSTRAINTS;
DROP TABLE Compra CASCADE CONSTRAINTS;
DROP TABLE Comprador CASCADE CONSTRAINTS;
DROP TABLE Departamento CASCADE CONSTRAINTS;
DROP TABLE Descuento CASCADE CONSTRAINTS;
DROP TABLE DescuentosAplicados CASCADE CONSTRAINTS;
DROP TABLE EstadoEliminacion CASCADE CONSTRAINTS;
DROP TABLE Factura CASCADE CONSTRAINTS;
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
CREATE TABLE Departamento (
  Codigo     number(10) NOT NULL UNIQUE, 
  Nombre     varchar2(255) NOT NULL, 
  PaisCodigo number(10) NOT NULL, 
  PRIMARY KEY (Codigo, 
  PaisCodigo));
CREATE TABLE Pais (
  Codigo number(10) GENERATED AS IDENTITY, 
  Nombre varchar2(255) NOT NULL, 
  PRIMARY KEY (Codigo));
CREATE TABLE Ubicacion (
  CantidaddeFotos              number(10), 
  CiudadCodigo                 number(10) NOT NULL, 
  CiudadDepartamentoCodigo     number(10) NOT NULL, 
  CiudadDepartamentoPaisCodigo number(10) NOT NULL, 
  PRIMARY KEY (CiudadCodigo, 
  CiudadDepartamentoCodigo, 
  CiudadDepartamentoPaisCodigo));
CREATE TABLE Foto (
  ID                            number(10) NOT NULL, 
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
CREATE TABLE EstadoEliminacion (
  EstadoActual varchar2(255) NOT NULL, 
  ID           number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE TiposdeSujeto (
  Sujeto varchar2(255) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE TiposTema (
  Tema varchar2(255) NOT NULL, 
  ID   number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE Resolucion (
  Alto  number(10) NOT NULL, 
  Ancho number(10) NOT NULL, 
  ID    number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE TipoTamano (
  Tamano number(10) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE HostedFoto (
  SitioDescargaURL varchar2(255) NOT NULL, 
  FotoID           number(10) NOT NULL, 
  PRIMARY KEY (SitioDescargaURL, 
  FotoID));
CREATE TABLE SitioDescarga (
  Nombre varchar2(255) NOT NULL, 
  URL    varchar2(255) NOT NULL, 
  PRIMARY KEY (URL));
CREATE TABLE Fotografo (
  VentasPasadas        number(10), 
  ComisionTotal        number(10), 
  UsuarioNombreUsuario varchar2(255) NOT NULL, 
  TiposExperienciaID   number(10), 
  PRIMARY KEY (UsuarioNombreUsuario));
CREATE TABLE TiposExperiencia (
  Experiencia varchar2(255) NOT NULL, 
  ID          number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE Usuario (
  NombreUsuario   varchar2(255) NOT NULL, 
  Contraseña      varchar2(255) NOT NULL, 
  Nombre          varchar2(255) NOT NULL, 
  Apellido        varchar2(255) NOT NULL, 
  DireccionCorreo varchar2(255) NOT NULL, 
  PRIMARY KEY (NombreUsuario));
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
CREATE TABLE Comprador (
  MetodosPago   varchar2(255) NOT NULL, 
  NombreUsuario varchar2(255) NOT NULL, 
  PRIMARY KEY (NombreUsuario));
CREATE TABLE Compra (
  ID                     number(10) NOT NULL, 
  Miniaturas             varchar2(255), 
  Precio                 float(10), 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  PeriodoFechas          date NOT NULL, 
  PRIMARY KEY (ID, 
  NombreUsuarioComprador));
CREATE TABLE Tarjeta (
  NumerodeTarjeta        number(16) NOT NULL, 
  NombreTitular          varchar2(255) NOT NULL, 
  MesVencimiento         number(10) NOT NULL, 
  AñoVencimiento         number(10) NOT NULL, 
  Correo                 varchar2(255) NOT NULL, 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  TiposDeTarjetaID       number(10), 
  PRIMARY KEY (NumerodeTarjeta, 
  NombreUsuarioComprador));
CREATE TABLE Factura (
  ID                           number(10) NOT NULL, 
  Total                        float(10), 
  Direccion                    varchar2(255), 
  Comision                     float(10), 
  Fecha                        date NOT NULL, 
  CompraID                     number(10) NOT NULL, 
  CompraNombreUsuarioComprador varchar2(255) NOT NULL, 
  PRIMARY KEY (ID, 
  CompraID, 
  CompraNombreUsuarioComprador));
CREATE TABLE TipoDePago (
  Nombre varchar2(255) NOT NULL, 
  ID     number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE TiposDeTarjeta (
  Tipo varchar2(255) NOT NULL, 
  ID   number(10) GENERATED AS IDENTITY, 
  PRIMARY KEY (ID));
CREATE TABLE Impuesto (
  ID           number(10) GENERATED AS IDENTITY, 
  TipoImpuesto varchar2(255) NOT NULL, 
  Cantidad     number(10), 
  PRIMARY KEY (ID));
CREATE TABLE Descuento (
  ID            number(10) GENERATED AS IDENTITY, 
  TipoDescuento number(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE PagoPorCompra (
  TipoDePagoID                         number(10) NOT NULL, 
  FacturaID                            number(10) NOT NULL, 
  FacturaCompraID2                     number(10) NOT NULL, 
  FacturaCompraNombreUsuarioComprador2 varchar2(255) NOT NULL, 
  PRIMARY KEY (TipoDePagoID, 
  FacturaID, 
  FacturaCompraID2, 
  FacturaCompraNombreUsuarioComprador2));
CREATE TABLE ImpuestosAplicados (
  FacturaID                            number(10) NOT NULL, 
  ImpuestoID                           number(10) NOT NULL, 
  FacturaCompraID                      number(10) NOT NULL, 
  FacturaCompraNombreUsuarioComprador2 varchar2(255) NOT NULL, 
  Impuestos                            number(10), 
  PRIMARY KEY (FacturaID, 
  ImpuestoID, 
  FacturaCompraID, 
  FacturaCompraNombreUsuarioComprador2));
CREATE TABLE DescuentosAplicados (
  Descuentos                           number(10), 
  FacturaID                            number(10) NOT NULL, 
  DescuentoID                          number(10) NOT NULL, 
  FacturaCompraID2                     number(10) NOT NULL, 
  FacturaCompraNombreUsuarioComprador2 varchar2(255) NOT NULL, 
  PRIMARY KEY (FacturaID, 
  DescuentoID, 
  FacturaCompraID2, 
  FacturaCompraNombreUsuarioComprador2));
CREATE TABLE Periodo (
  Fechas date NOT NULL, 
  PRIMARY KEY (Fechas));
CREATE TABLE HistorialVisitas (
  NumerodeRegistro       number(10) NOT NULL, 
  CompradorNombreUsuario varchar2(255) NOT NULL, 
  PeriodoFechas          date NOT NULL, 
  PRIMARY KEY (NumerodeRegistro, 
  CompradorNombreUsuario));
ALTER TABLE Ciudad ADD CONSTRAINT FKCiudad766665 FOREIGN KEY (DepartamentoCodigo, DepartamentoPaisCodigo) REFERENCES Departamento (Codigo, PaisCodigo);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamen363547 FOREIGN KEY (PaisCodigo) REFERENCES Pais (Codigo);
ALTER TABLE Ubicacion ADD CONSTRAINT FKUbicacion472733 FOREIGN KEY (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) REFERENCES Ciudad (Codigo, DepartamentoCodigo, DepartamentoPaisCodigo);
ALTER TABLE Foto ADD CONSTRAINT FKFoto985865 FOREIGN KEY (UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo) REFERENCES Ubicacion (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo);
ALTER TABLE Foto ADD CONSTRAINT FKFoto686489 FOREIGN KEY (EstadoEliminacionID) REFERENCES EstadoEliminacion (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto330125 FOREIGN KEY (TiposdeSujetoID) REFERENCES TiposdeSujeto (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto197005 FOREIGN KEY (TiposTemaID) REFERENCES TiposTema (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto688381 FOREIGN KEY (ResolucionID) REFERENCES Resolucion (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto204526 FOREIGN KEY (TipoTamanoID) REFERENCES TipoTamano (ID);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto990301 FOREIGN KEY (SitioDescargaURL) REFERENCES SitioDescarga (URL);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo191828 FOREIGN KEY (TiposExperienciaID) REFERENCES TiposExperiencia (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto34441 FOREIGN KEY (FotografoUsuarioNombreUsuario) REFERENCES Fotografo (UsuarioNombreUsuario);
ALTER TABLE Compra ADD CONSTRAINT Comprador FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (NombreUsuario);
ALTER TABLE Tarjeta ADD CONSTRAINT Usa FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (NombreUsuario);
ALTER TABLE Tarjeta ADD CONSTRAINT FKTarjeta236765 FOREIGN KEY (TiposDeTarjetaID) REFERENCES TiposDeTarjeta (ID);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom198702 FOREIGN KEY (FacturaID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA776563 FOREIGN KEY (FacturaID, FacturaCompraID, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos859139 FOREIGN KEY (FacturaID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom68629 FOREIGN KEY (TipoDePagoID) REFERENCES TipoDePago (ID);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA165446 FOREIGN KEY (ImpuestoID) REFERENCES Impuesto (ID);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos714921 FOREIGN KEY (DescuentoID) REFERENCES Descuento (ID);
ALTER TABLE Comprador ADD CONSTRAINT FKComprador564135 FOREIGN KEY (NombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo173846 FOREIGN KEY (UsuarioNombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Compra ADD CONSTRAINT FKCompra267871 FOREIGN KEY (PeriodoFechas) REFERENCES Periodo (Fechas);
ALTER TABLE HistorialVisitas ADD CONSTRAINT FKHistorialV284966 FOREIGN KEY (CompradorNombreUsuario) REFERENCES Comprador (NombreUsuario);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto677200 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo184215 FOREIGN KEY (CompraID, NombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo465929 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE Factura ADD CONSTRAINT FKFactura82706 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE HistorialVisitas ADD CONSTRAINT FKHistorialV548849 FOREIGN KEY (PeriodoFechas) REFERENCES Periodo (Fechas);
ALTER TABLE Factura ADD CONSTRAINT FKFactura155167 FOREIGN KEY (Fecha) REFERENCES Periodo (Fechas);
ALTER TABLE Ubicacion ADD CONSTRAINT FKUbicacion472734 FOREIGN KEY (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) REFERENCES Ciudad (Codigo, DepartamentoCodigo, DepartamentoPaisCodigo);
INSERT INTO Periodo(Fechas) VALUES ('11/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('12/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('13/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('14/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('15/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('16/10/2021');
INSERT INTO Periodo(Fechas) VALUES ('17/10/2021');
INSERT INTO Pais(Nombre) VALUES ('Colombia');
INSERT INTO Pais(Nombre) VALUES ('Estados Unidos');
INSERT INTO Pais(Nombre) VALUES ('China');
INSERT INTO Pais(Nombre) VALUES ('Belarus');
INSERT INTO Pais(Nombre) VALUES ('Indonesia');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('SebastianVergara', '123456789', 'Sebastian', 'Vergara', 's_vergara@javeriana.edu.co');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('DariaShetzcova', 'Passwords', 'Daria', 'Shetzcova', 'zpaips.kamikas@getmail.fun');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('Berendey_Ivanov', 'Contrasena', 'Berendev', 'Ivanov', 'vhumam@gmailya.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('eberhardgross', '21940129', 'Eberhard', 'Grossgasteiger', 'feuyouyubrihe-2145@yopmail.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('OmunIaLS', 'dGaq3D4P53zayEX9', 'Juan', 'Vargas', 'cmtjuan@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('HenaTeRg', 'zraypQdkc6tWyMKp', 'Teresa', 'Garcia', 'teresagr@hotmail.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('fURiCIat', 'pgVYMaZmH6DRQBwb', 'Adria', 'Manzano', 'Adrianali@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('ApenHaNT', 'KaEubuEf2qZp6RSY', 'Mark', 'Noguera', 'arnoguera@gmail.com');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('carnIth', 'KskA6A2vA5HyPGpL', 'Jesus', 'Estrada', 'Thansin85@teleworm.us');
INSERT INTO Usuario(NombreUsuario, Contraseña, Nombre, Apellido, DireccionCorreo) VALUES ('PTanisHF', '9XrF6HGXBBuU2kQB', 'Ruben ', 'Salcedo', 'Maden1934@fleckens.hu');
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
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (1, '\\Pictures\SISTEMAYONOSEQUE.jpg', 'Background', '10/10/2020', 'Test', 10000, 13652, 25300, 1, 'SebastianVergara', 1, 1, 4, 1, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (2, 'uc?export=download&id=1yL0yE6aBkFtF9o7ulMMk1lB4HQJ3QiMJ', 'Woman Wearing Green Crew-neck T-shirt and Black Denim Bottoms Making Face Behind Don&#39;t Trust Anybody Who Doesn&#39;t Have a Sense of Humor Quote on White Wall', '12/09/2018', 'Imagen de una mujer con camiseta verde en frente de un poster que dice "No confies en aquellos que no tienen sentido del humor"', 0, 20953, 91048, 2, 'DariaShetzcova', 1, 1, 1, 2, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (3, '18094?utm_medium=social&utm_source=nohat&utm_campaign=free_resource', 'A young business woman is showing OK sign and holding a document folder, isolated background ', '16/06/2021', 'Joven empresaria dando un OK con un folder.', 10239, 12412904, 2409124, 3, 'DariaShetzcova', 1, 3, 7, 3, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (4, 'two-men-in-military-clothing-with-guns-163490/', 'Two Men in Military Clothing With Guns ', '16/09/2018', 'Dos hombres en ropa militar con armas. ', 121240, 43542, 91048, 2, 'Berendey_Ivanov', 1, 2, 9, 4, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (5, 'green-slope-in-forest-on-mist-day-4406626/', 'Green slope in forest on mist day ', '15/05/2020', 'Montaña verde en lluvia.', 64253, 43542, 91048, 2, 'eberhardgross', 2, 4, 3, 5, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (6, 'woeinowing.jpg', 'Multipurpose Professional Certificate Template Design. Abstract Blue Vector illustration ', '18/07/2019', 'Certificado Azul ', 50000, 23509, 543983, 4, 'SebastianVergara', 1, 2, 7, 2, 2);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (7, 'vitebsk-belarus-famous-landmark-is-assumption-cath-5JMHN6H', 'Vitebsk, Belarus. Famous Landmark Is Assumption Cathedral Church ', '17/06/2021', 'Un hito famoso es la Iglesia Catedral de la Asunción en upper Town en Uspensky Mount Hill durante la puesta de sol de invierno. Famoso Patrimonio Histórico. ', 145000, 23509, 543983, 4, 'carnIth', 2, 3, 3, 3, 1);
INSERT INTO Foto(ID, NombreArchivo, Nombre, Fecha, Descripcion, Precio, UbicacionCiudadCodigo, UbicacionDepartamentoCodigo, UbicacionPaisCodigo, FotografoUsuarioNombreUsuario, ResolucionID, TipoTamanoID, TiposTemaID, TiposdeSujetoID, EstadoEliminacionID) VALUES (8, 'mount-agung-volcano-in-sunrise-M3ED2GX', 'Volcán del Monte Agung en la Amanecer ', '15/07/2021', 'Volcán Agung al Amanecer, vista desde la Playa de Sanur en Bali Indonesia ', 230000, 309251, 13421343, 5, 'PTanisHF', 2, 2, 5, 3, 1);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://drive.google.com/', 1);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://xframe.io/photos/', 2);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://www.pexels.com/photo/', 3);
INSERT INTO HostedFoto(SitioDescargaURL, FotoID) VALUES ('https://www.pexels.com/photo/', 5);
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'OmunIaLS');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'HenaTeRg');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'fURiCIat');
INSERT INTO Comprador(MetodosPago, NombreUsuario) VALUES ('Tarjeta', 'ApenHaNT');
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (1, 'woman.jpg', null, 'OmunIaLS', '11/10/2021');
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (2, 'tarjetamadres.jpg', null, 'HenaTeRg', '11/10/2021');
INSERT INTO Compra(ID, Miniaturas, Precio, NombreUsuarioComprador, PeriodoFechas) VALUES (3, 'hombreenfiguras.jpg', null, 'fURiCIat', '12/10/2021');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Visa');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Master Card');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('American Express');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('UnionPay');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Dinners');
INSERT INTO TiposDeTarjeta(Tipo) VALUES ('Discover');
INSERT INTO Factura(ID, Total, Direccion, Comision, Fecha, CompraID, CompraNombreUsuarioComprador) VALUES (1, null, '4572 Tree Frog Lane', null, '11/10/2021', 1, 'OmunIaLS');
INSERT INTO Factura(ID, Total, Direccion, Comision, Fecha, CompraID, CompraNombreUsuarioComprador) VALUES (2, null, '2928 Ford Street', null, '11/10/2021', 2, 'HenaTeRg');
INSERT INTO TipoDePago(Nombre) VALUES ('Tarjeta');
INSERT INTO TipoDePago(Nombre) VALUES ('PayPal');
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AñoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (4532433144323849, 'Keiran Watt ', 8, 23, 'Cands1953@rhyta.com', 'OmunIaLS', 1);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AñoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (5512957484972881, 'Beyonce Armitage ', 6, 23, 'Sath1971@dayrep.com', 'HenaTeRg', 2);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AñoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (349681756060692, 'Alexandra Laing ', 4, 25, 'Vored1978@einrot.com', 'fURiCIat', 3);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AñoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (349761961680052, 'Shania Mcgrath ', 6, 25, 'Bance1932@jourrapide.com', 'ApenHaNT', 3);
INSERT INTO Tarjeta(NumerodeTarjeta, NombreTitular, MesVencimiento, AñoVencimiento, Correo, NombreUsuarioComprador, TiposDeTarjetaID) VALUES (5223698497793811, 'Mark Noguera', 4, 22, 'arnoguera@gmail.com', 'ApenHaNT', 2);
INSERT INTO Impuesto(TipoImpuesto, Cantidad) VALUES ('ReteFuente', 7);
INSERT INTO Impuesto(TipoImpuesto, Cantidad) VALUES ('IVA', 16);
INSERT INTO Impuesto(TipoImpuesto, Cantidad) VALUES ('ICA', 6);
INSERT INTO Descuento(TipoDescuento) VALUES (2);
INSERT INTO Descuento(TipoDescuento) VALUES (4);
INSERT INTO Descuento(TipoDescuento) VALUES (5);
INSERT INTO PagoPorCompra(TipoDePagoID, FacturaID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) VALUES (1, 1, 1, 'OmunIaLS');
INSERT INTO ImpuestosAplicados(FacturaID, ImpuestoID, FacturaCompraID, FacturaCompraNombreUsuarioComprador2, Impuestos) VALUES (1, 1, 1, 'OmunIaLS', null);
INSERT INTO ImpuestosAplicados(FacturaID, ImpuestoID, FacturaCompraID, FacturaCompraNombreUsuarioComprador2, Impuestos) VALUES (1, 2, 1, 'OmunIaLS', null);
INSERT INTO ImpuestosAplicados(FacturaID, ImpuestoID, FacturaCompraID, FacturaCompraNombreUsuarioComprador2, Impuestos) VALUES (1, 3, 1, 'OmunIaLS', null);
INSERT INTO DescuentosAplicados(Descuentos, FacturaID, DescuentoID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) VALUES (null, 2, 2, 2, 'HenaTeRg');
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (1, 'OmunIaLS', 1, 1, 1, null);
INSERT INTO FotosPorCompra(CompraID, NombreUsuarioComprador, NumeroCompra, FotoID, Cantidad, Precio) VALUES (2, 'HenaTeRg', 2, 6, 4, null);
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (1, 'OmunIaLS', '11/10/2021');
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (2, 'HenaTeRg', '12/10/2021');
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (3, 'fURiCIat', '12/10/2021');
INSERT INTO HistorialVisitas(NumerodeRegistro, CompradorNombreUsuario, PeriodoFechas) VALUES (4, 'OmunIaLS', '13/10/2021');
