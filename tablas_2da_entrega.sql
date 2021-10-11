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
  ID                                    number(10) GENERATED AS IDENTITY, 
  NombreArchivo                         varchar2(255) NOT NULL UNIQUE, 
  Nombre                                varchar2(255), 
  Fecha                                 date, 
  Descripcion                           varchar2(255), 
  Precio                                number(10), 
  Sujeto                                varchar2(255), 
  UbicacionCiudadCodigo                 number(10), 
  UbicacionCiudadDepartamentoCodigo     number(10), 
  UbicacionCiudadDepartamentoPaisCodigo number(10), 
  FotografoUsuarioNombreUsuario         varchar2(255), 
  ResolucionID                          number(10), 
  TipoTamanoID                          number(10), 
  TiposTemaID                           number(10), 
  TiposdeSujetoID                       number(10), 
  EstadoEliminacionID                   number(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE EstadoEliminacion (
  EstadoActual number(10) NOT NULL, 
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
  VentasPasadas               number(10), 
  ComisionTotal               number(10), 
  UsuarioNombreUsuario        varchar2(255) NOT NULL, 
  TiposExperienciaExperiencia varchar2(255), 
  PRIMARY KEY (UsuarioNombreUsuario));
CREATE TABLE TiposExperiencia (
  Experiencia varchar2(255) NOT NULL, 
  PRIMARY KEY (Experiencia));
CREATE TABLE Usuario (
  NombreUsuario   varchar2(255) NOT NULL, 
  Contraseña      varchar2(255) NOT NULL, 
  Nombre          varchar2(255) NOT NULL, 
  Apellido        varchar2(255) NOT NULL, 
  DireccionCorreo varchar2(255) NOT NULL, 
  PRIMARY KEY (NombreUsuario));
CREATE TABLE FotosPorCompra (
  Cantidad                     number(10), 
  CompraID                     number(10) NOT NULL, 
  CompraNombreUsuarioComprador varchar2(255) NOT NULL, 
  NumeroCompra                 number(10) NOT NULL, 
  FotoID                       number(10) NOT NULL, 
  PRIMARY KEY (CompraID, 
  CompraNombreUsuarioComprador, 
  NumeroCompra, 
  FotoID));
CREATE TABLE Comprador (
  MetodosPago          varchar2(255) NOT NULL, 
  UsuarioNombreUsuario varchar2(255) NOT NULL, 
  PRIMARY KEY (UsuarioNombreUsuario));
CREATE TABLE Compra (
  ID                     number(10) NOT NULL, 
  Miniaturas             varchar2(10), 
  Descripcion            varchar2(255), 
  Precio                 float(10), 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  PeriodoFechas          date NOT NULL, 
  PRIMARY KEY (ID, 
  NombreUsuarioComprador));
CREATE TABLE Tarjeta (
  NumerodeTarjeta        number(10) NOT NULL, 
  NombreTitular          varchar2(255) NOT NULL, 
  MesVencimiento         number(10) NOT NULL, 
  AñoVencimiento         number(10) NOT NULL, 
  Correo                 number(10) NOT NULL, 
  NombreUsuarioComprador varchar2(255) NOT NULL, 
  TiposDeTarjetaID       number(10), 
  PRIMARY KEY (NumerodeTarjeta, 
  NombreUsuarioComprador));
CREATE TABLE Factura (
  ID                           number(10) NOT NULL, 
  Total                        float(10), 
  Direccion                    varchar2(255), 
  Comision                     float(10), 
  Fecha                        date, 
  EntidadFinancieraVentas      number(10) NOT NULL, 
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
  TipoImpuesto number(10) NOT NULL, 
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
  Impuestos                            number(10), 
  FacturaID                            number(10) NOT NULL, 
  ImpuestoID                           number(10) NOT NULL, 
  CompraID                             number(10) NOT NULL, 
  FacturaNombreUsuarioComprador        varchar2(255) NOT NULL, 
  FacturaCompraNombreUsuarioComprador  varchar2(255) NOT NULL, 
  FacturaCompraID                      number(10) NOT NULL, 
  FacturaCompraNombreUsuarioComprador2 varchar2(255) NOT NULL, 
  PRIMARY KEY (FacturaID, 
  ImpuestoID, 
  CompraID, 
  FacturaNombreUsuarioComprador, 
  FacturaCompraNombreUsuarioComprador, 
  FacturaCompraID, 
  FacturaCompraNombreUsuarioComprador2));
CREATE TABLE DescuentosAplicados (
  Descuentos                           number(10), 
  FacturaID                            number(10) NOT NULL, 
  DescuentoID                          number(10) NOT NULL, 
  FacturaCompraID                      number(10) NOT NULL, 
  FacturaNombreUsuarioComprador        varchar2(255) NOT NULL, 
  FacturaCompraNombreUsuarioComprador  varchar2(255) NOT NULL, 
  FacturaCompraID2                     number(10) NOT NULL, 
  FacturaCompraNombreUsuarioComprador2 varchar2(255) NOT NULL, 
  PRIMARY KEY (FacturaID, 
  DescuentoID, 
  FacturaCompraID, 
  FacturaNombreUsuarioComprador, 
  FacturaCompraNombreUsuarioComprador, 
  FacturaCompraID2, 
  FacturaCompraNombreUsuarioComprador2));
CREATE TABLE Periodo (
  Fechas date NOT NULL, 
  PRIMARY KEY (Fechas));
CREATE TABLE HistorialVisitas (
  NumerodeRegistro              number(10) NOT NULL, 
  CompradorUsuarioNombreUsuario varchar2(255) NOT NULL, 
  Fecha                         date, 
  PRIMARY KEY (NumerodeRegistro, 
  CompradorUsuarioNombreUsuario));
ALTER TABLE Ciudad ADD CONSTRAINT FKCiudad766665 FOREIGN KEY (DepartamentoCodigo, DepartamentoPaisCodigo) REFERENCES Departamento (Codigo, PaisCodigo);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamen363547 FOREIGN KEY (PaisCodigo) REFERENCES Pais (Codigo);
ALTER TABLE Ubicacion ADD CONSTRAINT FKUbicacion472733 FOREIGN KEY (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo) REFERENCES Ciudad (Codigo, DepartamentoCodigo, DepartamentoPaisCodigo);
ALTER TABLE Foto ADD CONSTRAINT FKFoto79145 FOREIGN KEY (UbicacionCiudadCodigo, UbicacionCiudadDepartamentoCodigo, UbicacionCiudadDepartamentoPaisCodigo) REFERENCES Ubicacion (CiudadCodigo, CiudadDepartamentoCodigo, CiudadDepartamentoPaisCodigo);
ALTER TABLE Foto ADD CONSTRAINT FKFoto686489 FOREIGN KEY (EstadoEliminacionID) REFERENCES EstadoEliminacion (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto330125 FOREIGN KEY (TiposdeSujetoID) REFERENCES TiposdeSujeto (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto197005 FOREIGN KEY (TiposTemaID) REFERENCES TiposTema (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto688381 FOREIGN KEY (ResolucionID) REFERENCES Resolucion (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto204526 FOREIGN KEY (TipoTamanoID) REFERENCES TipoTamano (ID);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto990301 FOREIGN KEY (SitioDescargaURL) REFERENCES SitioDescarga (URL);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo406657 FOREIGN KEY (TiposExperienciaExperiencia) REFERENCES TiposExperiencia (Experiencia);
ALTER TABLE Foto ADD CONSTRAINT FKFoto34441 FOREIGN KEY (FotografoUsuarioNombreUsuario) REFERENCES Fotografo (UsuarioNombreUsuario);
ALTER TABLE Compra ADD CONSTRAINT Comprador FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (UsuarioNombreUsuario);
ALTER TABLE Tarjeta ADD CONSTRAINT Usa FOREIGN KEY (NombreUsuarioComprador) REFERENCES Comprador (UsuarioNombreUsuario);
ALTER TABLE Tarjeta ADD CONSTRAINT FKTarjeta236765 FOREIGN KEY (TiposDeTarjetaID) REFERENCES TiposDeTarjeta (ID);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom198702 FOREIGN KEY (FacturaID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA776563 FOREIGN KEY (FacturaID, FacturaCompraID, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos859139 FOREIGN KEY (FacturaID, FacturaCompraID2, FacturaCompraNombreUsuarioComprador2) REFERENCES Factura (ID, CompraID, CompraNombreUsuarioComprador);
ALTER TABLE PagoPorCompra ADD CONSTRAINT FKPagoPorCom68629 FOREIGN KEY (TipoDePagoID) REFERENCES TipoDePago (ID);
ALTER TABLE ImpuestosAplicados ADD CONSTRAINT FKImpuestosA165446 FOREIGN KEY (ImpuestoID) REFERENCES Impuesto (ID);
ALTER TABLE DescuentosAplicados ADD CONSTRAINT FKDescuentos714921 FOREIGN KEY (DescuentoID) REFERENCES Descuento (ID);
ALTER TABLE Comprador ADD CONSTRAINT FKComprador295316 FOREIGN KEY (UsuarioNombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Fotografo ADD CONSTRAINT FKFotografo173846 FOREIGN KEY (UsuarioNombreUsuario) REFERENCES Usuario (NombreUsuario);
ALTER TABLE Compra ADD CONSTRAINT FKCompra267871 FOREIGN KEY (PeriodoFechas) REFERENCES Periodo (Fechas);
ALTER TABLE HistorialVisitas ADD CONSTRAINT FKHistorialV472105 FOREIGN KEY (CompradorUsuarioNombreUsuario) REFERENCES Comprador (UsuarioNombreUsuario);
ALTER TABLE HostedFoto ADD CONSTRAINT FKHostedFoto677200 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo476426 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
ALTER TABLE FotosPorCompra ADD CONSTRAINT FKFotosPorCo465929 FOREIGN KEY (FotoID) REFERENCES Foto (ID);
ALTER TABLE Factura ADD CONSTRAINT FKFactura82706 FOREIGN KEY (CompraID, CompraNombreUsuarioComprador) REFERENCES Compra (ID, NombreUsuarioComprador);
