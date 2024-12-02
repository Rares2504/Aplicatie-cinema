-- Crearea tabelului Film
CREATE TABLE film (
    fil_id INT PRIMARY KEY AUTO_INCREMENT,
    titlu VARCHAR(255) NOT NULL,
    gen VARCHAR(50),
    durata INT,
    limba VARCHAR(50),
    rating DECIMAL(3,1),
    descriere TEXT,
    poza BLOB
);

-- Crearea tabelului Sala
CREATE TABLE sala (
    sal_id INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(100) NOT NULL,
    randuri INT NOT NULL,
    locuri_rand INT NOT NULL,
    tip_ecran VARCHAR(50)
);

-- Crearea tabelului Proiectie
CREATE TABLE proiectie (
    pro_id INT PRIMARY KEY AUTO_INCREMENT,
    fil_id INT NOT NULL,
    sal_id INT NOT NULL,
    data DATE NOT NULL,
    ora TIME NOT NULL,
    pret DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (fil_id) REFERENCES film(fil_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sal_id) REFERENCES sala(sal_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crearea tabelului Client
CREATE TABLE client (
    cli_id INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    user VARCHAR(50) NOT NULL UNIQUE,
    parola VARCHAR(255) NOT NULL,
    telefon VARCHAR(15)
);

-- Crearea tabelului Comanda
CREATE TABLE comanda (
    com_id INT PRIMARY KEY AUTO_INCREMENT,
    cli_id INT NOT NULL,
    pro_id INT NOT NULL,
    data DATETIME NOT NULL,
    FOREIGN KEY (cli_id) REFERENCES client(cli_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (pro_id) REFERENCES proiectie(pro_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crearea tabelului Bilet
CREATE TABLE bilet (
    bil_id INT PRIMARY KEY AUTO_INCREMENT,
    com_id INT NOT NULL,
    rand INT NOT NULL,
    loc INT NOT NULL,
    FOREIGN KEY (com_id) REFERENCES Comanda(com_id) ON DELETE CASCADE ON UPDATE CASCADE
);