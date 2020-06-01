CREATE DATABASE optica;
USE optica;
CREATE TABLE proveedores(
						id_Proveedor INT NOT NULL PRIMARY KEY,
                        nombre_proveedor VARCHAR (50) NOT NULL,
                        calle VARCHAR (40),
                        numero_calle INT,
                        numero_puerta INT,
                        ciudad INT NOT NULL,
                        cp INT NOT NULL,
                        pais INT NOT NULL,
                        telefono INT NOT NULL,
                        fax INT,
                        cif INT NOT NULL
                        );

CREATE TABLE marca(
					id_marca INT NOT NULL PRIMARY KEY,
                    id_proveedor INT NOT NULL,
                    marca VARCHAR (40),
                    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
                    );
                    

CREATE TABLE gafas(
						id_gafas INT PRIMARY KEY NOT NULL,
                        id_marca INT NOT NULL,
                        marca VARCHAR (40) NOT NULL,
                        id_proveedor INT NOT NULL,
                        graduacion_izq DEC (2,2) NOT NULL,
                        graduacion_der DEC (2,2) NOT NULL,
                        tipo_motura VARCHAR (40) NOT NULL,
                        color_montura VARCHAR (40) NOT NULL,
                        color_vidrio_izq VARCHAR (40) NOT NULL,
                        color_vidrio_der VARCHAR (40) NOT NULL,
                        precio DEC (4,2) NOT NULL,
                        FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
                        
                        );
CREATE TABLE clientes(
						id_cliente INT PRIMARY KEY NOT NULL,
                        direccion VARCHAR (80),
                        telefono INT NOT NULL,
                        email VARCHAR (80),
                        fecha_registro DATE NOT NULL
                        );
CREATE TABLE empleados(
						id_empleado INT PRIMARY KEY NOT NULL,
                        nombre_empleado VARCHAR (40) NOT NULL,
                        apellido1_epleado VARCHAR (40) NOT NULL,
                        apellido2_empleado VARCHAR (40)
                        );
CREATE TABLE ventas(
						id_venta INT PRIMARY KEY NOT NULL,
                        id_gafas INT NOT NULL,
                        id_empleado INT NOT NULL,
                        id_cliente INT NOT NULL,
                        fecha DATE NOT NULL,
                        importe_venta DECIMAL(4,2) NOT NULL,
                        FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas),
                        FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
                        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
                        );
	
                        
						