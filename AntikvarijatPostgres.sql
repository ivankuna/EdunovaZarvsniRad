drop schema if exists antikvarijat;
create schema antikvarijat;

CREATE TABLE antikvarijat.operater (
    id_operater SERIAL PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib VARCHAR(11) NOT NULL,
    korisnicko_ime VARCHAR(50) NOT NULL,
    lozinka VARCHAR(50) NOT NULL
);

CREATE TABLE antikvarijat.drzava (
    id_drzava SERIAL PRIMARY KEY,
    naziv_drzave VARCHAR(50) NOT NULL
);

CREATE TABLE antikvarijat.grad (
    id_grad SERIAL PRIMARY KEY,
    id_drzava INT NOT NULL,
    postanski_broj VARCHAR(50) NOT NULL,
    naziv_grada VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_drzava) REFERENCES antikvarijat.drzava (id_drzava)
);

CREATE TABLE antikvarijat.partner (
    id_partner SERIAL PRIMARY KEY,
    naziv_partnera VARCHAR(50) NOT NULL,
    ulica_broj VARCHAR(50) NOT NULL,
    id_grad INT NOT NULL,
    oib VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefon VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_grad) REFERENCES antikvarijat.grad (id_grad)
);

CREATE TABLE antikvarijat.autor (
    id_autor SERIAL PRIMARY KEY,
    naziv_autora VARCHAR(50) NOT NULL,
    id_drzava INT NOT NULL,
    FOREIGN KEY (id_drzava) REFERENCES antikvarijat.drzava (id_drzava)
);

CREATE TABLE antikvarijat.izdavac (
    id_izdavac SERIAL PRIMARY KEY,
    naziv_izdavaca VARCHAR(50) NOT NULL,
    id_grad INT NOT NULL,
    FOREIGN KEY (id_grad) REFERENCES antikvarijat.grad (id_grad)
);

CREATE TABLE antikvarijat.knjiga (
    id_knjiga SERIAL PRIMARY KEY,
    naziv_knjige VARCHAR(50) NOT NULL,
    id_autor INT NOT NULL,
    godina_izdanja VARCHAR(4) NOT NULL,
    id_izdavac INT NOT NULL,
    jezik VARCHAR(50) NOT NULL,
    broj_stranica INT NOT NULL,
    vrsta_uveza VARCHAR(50) NOT NULL,
    dimenzija VARCHAR(20) NOT NULL,
    cijena_prodaje DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES antikvarijat.autor (id_autor),
    FOREIGN KEY (id_izdavac) REFERENCES antikvarijat.izdavac (id_izdavac)
);

CREATE TABLE antikvarijat.rezervacija (
    id_rezervacija SERIAL PRIMARY KEY,
    id_partner INT NOT NULL,
    id_knjiga INT NOT NULL,
    datum_rezervacije TIMESTAMP NOT NULL,
    datum_isteka_rezervacije TIMESTAMP NOT NULL,
    stanje_rezervacije VARCHAR(20),
    id_operater INT NOT NULL,
    FOREIGN KEY (id_partner) REFERENCES antikvarijat.partner (id_partner),
    FOREIGN KEY (id_knjiga) REFERENCES antikvarijat.knjiga (id_knjiga),
    FOREIGN KEY (id_operater) REFERENCES antikvarijat.operater (id_operater)
);

CREATE TABLE antikvarijat.nacin_placanja (
    id_nacin_placanja SERIAL PRIMARY KEY,
    naziv_nacina_placanja VARCHAR(50),
    oznaka_nacina_placanja VARCHAR(1)
);

CREATE TABLE antikvarijat.otkup_zaglavlje (
    id_otkup_zaglavlje SERIAL PRIMARY KEY,
    broj_otkupa VARCHAR(20) NOT NULL,
    datum_otkupa TIMESTAMP NOT NULL,
    id_partner INT,
    id_operater INT NOT NULL,
    FOREIGN KEY (id_partner) REFERENCES antikvarijat.partner (id_partner),
    FOREIGN KEY (id_operater) REFERENCES antikvarijat.operater (id_operater)
);

CREATE TABLE antikvarijat.otkup_stavka (
    id_otkup_stavka SERIAL PRIMARY KEY,
    id_otkup_zaglavlje INT NOT NULL,
    id_knjiga INT NOT NULL,
    kolicina INT NOT NULL,
    cijena_otkupa DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (id_otkup_zaglavlje) REFERENCES antikvarijat.otkup_zaglavlje (id_otkup_zaglavlje),
    FOREIGN KEY (id_knjiga) REFERENCES antikvarijat.knjiga (id_knjiga)
);

CREATE TABLE antikvarijat.prodaja_zaglavlje (
    id_prodaja_zaglavlje SERIAL PRIMARY KEY,
    broj_prodaje VARCHAR(20) NOT NULL,
    datum_prodaje TIMESTAMP NOT NULL,
    id_partner INT,
    zki VARCHAR(50) NOT NULL,
    jir VARCHAR(50) NOT NULL,
    id_nacin_placanja INT NOT NULL,
    id_operater INT NOT NULL,
    FOREIGN KEY (id_partner) REFERENCES antikvarijat.partner (id_partner),
    FOREIGN KEY (id_nacin_placanja) REFERENCES antikvarijat.nacin_placanja (id_nacin_placanja),
    FOREIGN KEY (id_operater) REFERENCES antikvarijat.operater (id_operater)
);

CREATE TABLE antikvarijat.prodaja_stavka (
    id_prodaja_stavka SERIAL PRIMARY KEY,
    id_prodaja_zaglavlje INT NOT NULL,
    id_knjiga INT NOT NULL,
    kolicina INT NOT NULL,
    cijena_prodaje DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (id_prodaja_zaglavlje) REFERENCES antikvarijat.prodaja_zaglavlje (id_prodaja_zaglavlje),
    FOREIGN KEY (id_knjiga) REFERENCES antikvarijat.knjiga (id_knjiga)
);

