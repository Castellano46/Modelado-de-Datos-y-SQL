CREATE SCHEMA KarCoding;

CREATE TABLE KarCoding.vehiculo (
    matricula VARCHAR(10) PRIMARY KEY,
    id_modelo INT NOT NULL,
    id_color INT NOT NULL,
    km INT NOT NULL,
    fecha_compra DATE NOT NULL
);

CREATE TABLE KarCoding.revision (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10) NOT NULL,
    id_moneda SMALLINT NOT NULL,
    km INT NOT NULL,
    fecha_revision DATE NOT NULL,
    importe FLOAT NOT NULL
);

CREATE TABLE KarCoding.moneda (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE KarCoding.modelo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    id_marca INT NOT NULL
);

CREATE TABLE KarCoding.marca (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    id_grupo INT NOT NULL
);

CREATE TABLE KarCoding.grupo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE KarCoding.color (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE KarCoding.poliza (
    id SERIAL PRIMARY KEY,
    id_aseguradora INT NOT NULL,
    matricula VARCHAR(10) NOT NULL,
    fecha_alta DATE NOT NULL,
    en_vigor BOOLEAN NOT NULL
);

CREATE TABLE KarCoding.aseguradora (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

ALTER TABLE KarCoding.poliza ADD CONSTRAINT fk_poliza_aseguradora FOREIGN KEY (id_aseguradora) REFERENCES KarCoding.aseguradora(id);
ALTER TABLE KarCoding.poliza ADD CONSTRAINT fk_poliza_vehiculo FOREIGN KEY (matricula) REFERENCES KarCoding.vehiculo(matricula);

ALTER TABLE KarCoding.marca ADD CONSTRAINT fk_marca_grupo FOREIGN KEY (id_grupo) REFERENCES KarCoding.grupo(id);

ALTER TABLE KarCoding.modelo ADD CONSTRAINT fk_modelo_marca FOREIGN KEY (id_marca) REFERENCES KarCoding.marca(id);

ALTER TABLE KarCoding.vehiculo ADD CONSTRAINT fk_vehiculo_modelo FOREIGN KEY (id_modelo) REFERENCES KarCoding.modelo(id);
ALTER TABLE KarCoding.vehiculo ADD CONSTRAINT fk_vehiculo_color FOREIGN KEY (id_color) REFERENCES KarCoding.color(id);

ALTER TABLE KarCoding.revision ADD CONSTRAINT fk_revision_vehiculo FOREIGN KEY (matricula) REFERENCES KarCoding.vehiculo(matricula);
ALTER TABLE KarCoding.revision ADD CONSTRAINT fk_revision_moneda FOREIGN KEY (id_moneda) REFERENCES KarCoding.moneda(id);

CREATE TABLE KarCoding.cochesKoding (
    matricula VARCHAR(50) NULL,
    grupo VARCHAR(50) NULL,
    marca VARCHAR(50) NULL,
    modelo VARCHAR(50) NULL,
    fecha_compra DATE NULL,
    color VARCHAR(50) NULL,
    aseguradora VARCHAR(50) NULL,
    n_poliza INT NULL,
    fecha_alta_seguro DATE NULL,
    importe_revision FLOAT NULL,
    moneda VARCHAR(50) NULL,
    kms_revision INT NULL,
    fecha_revision DATE NULL,
    kms_totales INT NULL
);

INSERT INTO KarCoding.cochesKoding (matricula, grupo, marca, modelo, fecha_compra, color, aseguradora, n_poliza, fecha_alta_seguro, importe_revision, moneda, kms_revision, fecha_revision, kms_totales)
VALUES
('7343FRT','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','2009-06-01','Rojo','Allianz',25786,'2009-06-01',1076032.5,'Peso Colombiano',29564,'2020-07-07',47644),
('ABC1213','Toyota','Toyota','Corolla','2010-03-15','Azul','Mapfre',98765,'2010-03-15',950000.75,'Peso Colombiano',28000,'2021-05-20',54013),
('DEF4526','Volkswagen Group','Volkswagen','Golf','2015-08-10','Blanco','Seguros Sura',12345,'2015-08-10',1200000.0,'Euro',42000,'2023-01-15',780023),
('GHI7839','Ford','Ford','Focus','2018-04-05','Plateado','BBVA Seguros',67890,'2018-04-05',1500000.5,'Peso Colombiano',48000,'2023-10-03',92054),
('JKL0142','Fiat','Fiat','500','2014-02-28','Amarillo','Liberty Seguros',24680,'2014-02-28',600000.75,'Dólar Estadounidense',32000,'2022-12-07',60450),
('MNO3455','Honda','Honda','Civic','2017-09-12','Gris','AIG Seguros',13579,'2017-09-12',1350000.25,'Euro',40000,'2023-05-18',75098),
('PQR6768','Hyundai','Hyundai','Elantra','2016-06-25','Verde','Santander Seguros',97531,'2016-06-25',1100000.0,'Euro',38000,'2022-11-25',70089),
('STU9071','BMW Group','BMW','Series 3','2020-01-30','Negro','Zurich Seguros',24613,'2020-01-30',2000000.5,'Euro',25000,'2021-09-08',35050),
('VWX2384','Mercedes-Benz','Mercedes','Clase A','2019-11-15','Rojo','Generali Seguros',86420,'2019-11-15',1800000.75,'Peso Colombiano',30000,'2022-04-22',50094),
('LMN5697','Kia','Kia','Rio','2013-07-18','Gris','AON Seguros',78901,'2013-07-18',950000.0,'Dólar Estadounidense',30000,'2022-06-14',56035),
('OPQ8910','Audi','Audi','A3','2018-09-22','Blanco','Allstate',23456,'2018-09-22',1700000.25,'Euro',38000,'2023-03-30',620055),
('RST1223','Mazda','Mazda','3','2015-05-08','Azul','State Farm',56789,'2015-05-08',1100000.5,'Peso Colombiano',35000,'2022-10-17',67000),
('UVW4536','Subaru','Subaru','Impreza','2016-12-03','Negro','Progressive',10987,'2016-12-03',1300000.75,'Dólar Estadounidense',40000,'2023-07-25',72000),
('XYZ7849','Chevrolet','Chevrolet','Malibu','2017-04-29','Rojo','Nationwide',54321,'2017-04-29',1500000.0,'Euro',45000,'2022-12-01',68430),
('ABC0152','Tesla','Tesla','Model 3','2021-02-12','Plateado','Geico',67890,'2021-02-12',2200000.25,'Euro',18000,'2021-11-08',28000),
('DEF3465','Jaguar Land Rover','Jaguar','XE','2014-08-07','Negro','Travelers',12345,'2014-08-07',1000000.5,'Peso Colombiano',32000,'2022-05-02',59000),
('GHI6778','Volvo','Volvo','S60','2019-06-14','Blanco','USAA',97531,'2019-06-14',1900000.75,'Dólar Estadounidense',932000,'2021-12-15',125400),
('JKL9081','Lexus','Lexus','IS','2016-10-20','Gris','Esurance',86420,'2016-10-20',1400000.0,'Euro',35000,'2023-02-28',67020),
('MNO2394','Porsche','Porsche','911','2018-11-25','Amarillo','MetLife',24613,'2018-11-25',2400000.5,'Euro',20000,'2022-09-10',30091)
;

INSERT INTO KarCoding.grupo (nombre)
SELECT grupo FROM KarCoding.cochesKoding GROUP BY grupo;

INSERT INTO KarCoding.marca (id_grupo, nombre)
SELECT g.id, tmp.marca FROM KarCoding.cochesKoding tmp
INNER JOIN KarCoding.grupo g ON g.nombre = tmp.grupo
GROUP BY g.id, tmp.marca;

INSERT INTO KarCoding.modelo (id_marca, nombre)
SELECT m.id, tmp.modelo FROM KarCoding.cochesKoding tmp
INNER JOIN KarCoding.grupo g ON g.nombre = tmp.grupo
INNER JOIN KarCoding.marca m ON m.nombre = tmp.marca
GROUP BY g.id, m.id, tmp.modelo;

INSERT INTO KarCoding.aseguradora (nombre)
SELECT aseguradora FROM KarCoding.cochesKoding GROUP BY aseguradora;

INSERT INTO KarCoding.color (nombre)
SELECT color FROM KarCoding.cochesKoding GROUP BY color;

INSERT INTO KarCoding.moneda (nombre)
SELECT moneda FROM KarCoding.cochesKoding GROUP BY moneda;

INSERT INTO KarCoding.vehiculo (matricula, fecha_compra, id_modelo, id_color, km)
SELECT
    tmp.matricula,
    tmp.fecha_compra,
    md.id AS id_modelo,
    c.id AS id_color,
    tmp.kms_totales
FROM
    KarCoding.cochesKoding tmp
INNER JOIN KarCoding.grupo g ON g.nombre = tmp.grupo
INNER JOIN KarCoding.marca m ON m.nombre = tmp.marca
INNER JOIN KarCoding.modelo md ON md.nombre = tmp.modelo
INNER JOIN KarCoding.color c ON c.nombre = tmp.color
GROUP BY
    tmp.matricula,
    tmp.fecha_compra,
    md.id,
    c.id,
    tmp.kms_totales;

INSERT INTO KarCoding.poliza (matricula, id_aseguradora, fecha_alta, en_vigor)
SELECT
    tmp.matricula,
    a.id AS id_aseguradora,
    tmp.fecha_alta_seguro,
    FALSE
FROM
    KarCoding.cochesKoding tmp
INNER JOIN KarCoding.aseguradora a ON a.nombre = tmp.aseguradora
GROUP BY
    tmp.matricula,
    a.id,
    tmp.fecha_alta_seguro;

UPDATE KarCoding.poliza p
SET en_vigor = TRUE
FROM (
    SELECT p.matricula, MAX(p.fecha_alta) AS max_fecha_alta
    FROM KarCoding.poliza p
    GROUP BY p.matricula
) pv
WHERE p.matricula = pv.matricula AND p.fecha_alta = pv.max_fecha_alta;

INSERT INTO KarCoding.revision (matricula, km, id_moneda, fecha_revision, importe)
SELECT
    tmp.matricula,
    tmp.kms_revision,
    m.id AS id_moneda,
    tmp.fecha_revision,
    ROUND(tmp.importe_revision::DECIMAL, 2) AS importe
FROM
    KarCoding.cochesKoding tmp
INNER JOIN KarCoding.moneda m ON m.nombre = tmp.moneda
GROUP BY
    tmp.matricula,
    tmp.kms_revision,
    m.id,
    tmp.fecha_revision,
    tmp.importe_revision;

DROP TABLE KarCoding.cochesKoding;

SELECT
    g.nombre AS grupo,
    md.nombre AS modelo,
    mr.nombre AS marca,
    v.fecha_compra,
    v.matricula,
    c.nombre AS color,
    v.km AS total_kilometros,
    a.nombre AS aseguradora,
    p.id AS poliza
FROM
    KarCoding.vehiculo v
INNER JOIN KarCoding.modelo md ON md.id = v.id_modelo
INNER JOIN KarCoding.marca mr ON mr.id = md.id_marca
INNER JOIN KarCoding.grupo g ON g.id = mr.id_grupo
INNER JOIN KarCoding.poliza p ON p.matricula = v.matricula AND p.en_vigor = TRUE
INNER JOIN KarCoding.aseguradora a ON a.id = p.id_aseguradora
INNER JOIN KarCoding.color c ON c.id = v.id_color;
