CREATE DATABASE Prototipo1P;
USE Prototipo1P;

CREATE TABLE Vendedores
(
	IDvendedor VARCHAR(5) PRIMARY KEY,
    NombreVendedor VARCHAR(60),
    DireccionVendedor VARCHAR(60),
    TelVendedor VARCHAR(50),
    NITvendedor VARCHAR(20),
    EstadoVendedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Clientes
(
	IDcliente VARCHAR(5) PRIMARY KEY,
    NombreCliente VARCHAR(60),
    DireccionCliente VARCHAR(60),
    NITcliente VARCHAR(20),
    TelCliente VARCHAR(50),
    EstatusCliente VARCHAR(1),
    IDvendedor VARCHAR(5),
    FOREIGN KEY (IDvendedor) REFERENCES Vendedores(IDvendedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Productos
(
	IDproductos VARCHAR(18) PRIMARY KEY,
    NombreProducto VARCHAR(60),
    Existencia FLOAT(10,2),
    EstatusProducto VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Bodegas
(
	IDbodega VARCHAR(5) PRIMARY KEY,
    NombreBodega VARCHAR(60),
    EstatusBodega VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Existencias
(
	IDbodega VARCHAR(5),
    IDproductos VARCHAR(18),
    Existencia FLOAT(10,2),
    PRIMARY KEY (IDbodega, IDproductos),
	FOREIGN KEY (IDbodega) REFERENCES Bodegas(IDbodega),
    FOREIGN KEY (IDproductos) REFERENCES Productos(IDproductos)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Proveedores
(
	IDproveedor VARCHAR(5) PRIMARY KEY,
    NombreProveedor VARCHAR(60),
    DireccionProveedor VARCHAR(60),
    TelProveedor VARCHAR(50),
    NITproveedor VARCHAR(50),
    EstadoProveedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE CompraEnca
(
	DocCompraEnca VARCHAR(10) PRIMARY KEY,
    IDproveedor VARCHAR(5),
    FechaCompraEnca DATE,
	TotalCompraEnca FLOAT(10,2),
    EstatusCompraEnca VARCHAR(1),
    FOREIGN KEY (IDproveedor) REFERENCES Proveedores(IDproveedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE DetalleCompra
(
	DocCompraEnca VARCHAR(10),
    IDproductos VARCHAR(18),
    CantidadDetalleCom FLOAT(10,2),
    CostoDetalleCom FLOAT(10,2),
	IDbodega VARCHAR(5),
    PRIMARY KEY (DocCompraEnca, IDproductos),
    FOREIGN KEY (DocCompraEnca) REFERENCES CompraEnca(DocCompraEnca),
    FOREIGN KEY (IDproductos) REFERENCES Productos(IDproductos),
    FOREIGN KEY (IDbodega) REFERENCES Bodegas(IDbodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE VentaEnca
(
	DocVentaEnca VARCHAR(10) PRIMARY KEY,
    IDcliente VARCHAR(5),
    FechaVentaEnca DATE,
    TotalVentaEnca FLOAT(10,2),
    EstatusVentaEnca VARCHAR(1),
    FOREIGN KEY (IDcliente) REFERENCES Clientes(IDcliente)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE DetalleVen
(
	DocVentaEnca VARCHAR(10),
    IDproductos VARCHAR(18),
    CantidadDetalleVen FLOAT(10,2),
    CostoDetalleVen FLOAT(10,2),
    PrecioDetalleVen FLOAT(10,2),
    IDbodega VARCHAR(5),
    PRIMARY KEY (DocVentaEnca, IDproductos),
    FOREIGN KEY (DocVentaEnca) REFERENCES VentaEnca(DocVentaEnca),
    FOREIGN KEY (IDproductos) REFERENCES Productos(IDproductos),
    FOREIGN KEY (IDbodega) REFERENCES Bodegas(IDbodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
    