use antikvarijat;

-- Unos zapisa u tablicu operater
insert into operater (ime, prezime, oib, korisnicko_ime, lozinka) values
('Ana', 'Horvat', '12345678901', 'ana123', 'lozinka123'),
('Ivan', 'Kovačić', '23456789012', 'ivan456', 'tajna123'),
('Petra', 'Novak', '34567890123', 'petra789', 'sifra456');

-- Unos zapisa u tablicu drzava
insert into drzava (naziv_drzave) values
('Hrvatska'),
('Slovenija'),
('Bosna i Hercegovina');

-- Unos zapisa u tablicu grad
insert into grad (id_drzava, postanski_broj, naziv_grada) values
(1, '10000', 'Zagreb'),
(1, '51000', 'Rijeka'),
(2, '1000', 'Ljubljana'),
(3, '71000', 'Sarajevo');

-- Unos zapisa u tablicu partner
insert into partner (naziv_partnera, ulica_broj, id_grad, oib, email, telefon) values
('Knjižara Dora', 'Ulica 1', 1, '12345678901', 'knjizara@dora.com', '01 2345 678'),
('Antikvarijat Marko', 'Trg 2', 2, '23456789012', 'antikvarijat@marko.com', '051 345 678'),
('Izdavačka kuća Nova', 'Put 3', 1, '34567890123', 'izdavac@nova.com', '01 9876 543');

-- Unos zapisa u tablicu autor
insert into autor (naziv_autora, id_drzava) values
('Ivo Andrić', 3),
('Miroslav Krleža', 1),
('Ivan Cankar', 2);

-- Unos zapisa u tablicu izdavac
insert into izdavac (naziv_izdavaca, id_grad) values
('Naklada XYZ', 1),
('Izdavačka kuća ABC', 2),
('Izdavačka kuća MNO', 3);

-- Unos zapisa u tablicu knjiga
insert into knjiga (naziv_knjige, id_autor, godina_izdanja, id_izdavac, jezik, broj_stranica, vrsta_uveza, dimenzija, cijena_prodaje) values
('Na Drini ćuprija', 1, '1945', 1, 'hrvatski', 300, 'tvrdi uvez', '15x22 cm', 99.99),
('Gospoda Glembajevi', 2, '1929', 2, 'hrvatski', 250, 'meki uvez', '14x20 cm', 79.99),
('Moje življenje', 3, '1920', 3, 'slovenski', 150, 'tvrdi uvez', '13x19 cm', 89.99);

-- Unos zapisa u tablicu rezervacija
insert into rezervacija (id_partner, id_knjiga, datum_rezervacije, datum_isteka_rezervacije, stanje_rezervacije, id_operater) values
(1, 1, now(), now() + interval 7 day, 'Aktivna', 1),
(2, 2, now(), now() + interval 5 day, 'Aktivna', 2),
(3, 3, now(), now() + interval 3 day, 'Aktivna', 3);

-- Unos zapisa u tablicu nacin_placanja
insert into nacin_placanja (naziv_nacina_placanja, oznaka_nacina_placanja) values
('Gotovina', 'G'),
('Kreditna kartica', 'C'),
('Virman', 'V');

-- Unos zapisa u tablicu otkup_zaglavlje
insert into otkup_zaglavlje (broj_otkupa, datum_otkupa, id_partner, id_operater) values
('O-2023-001', now(), 1, 1),
('O-2023-002', now(), 2, 2),
('O-2023-003', now(), 3, 3);

-- Unos zapisa u tablicu otkup_stavka
insert into otkup_stavka (id_otkup_zaglavlje, id_knjiga, kolicina, cijena_otkupa) values
(1, 1, 5, 50),
(1, 2, 3, 30),
(2, 3, 2, 20);

-- Unos zapisa u tablicu otkup_stavka
insert into otkup_stavka (id_otkup_zaglavlje, id_knjiga, kolicina, cijena_otkupa) values
(1, 1, 2, 20),
(2, 2, 1, 10),
(3, 3, 4, 40);

-- Unos zapisa u tablicu prodaja_zaglavlje
insert into prodaja_zaglavlje (broj_prodaje, datum_prodaje, id_partner, zki, jir, id_nacin_placanja, id_operater) values
('P-2023-001', now(), 1, '1234567890', '9876543210', 1, 1),
('P-2023-002', now(), 2, '0987654321', '0123456789', 2, 2),
('P-2023-003', now(), 3, '2468135790', '1357924680', 3, 3);

-- Unos zapisa u tablicu prodaja_stavka
insert into prodaja_stavka (id_prodaja_zaglavlje, id_knjiga, kolicina, cijena_prodaje) values
(1, 1, 2, 100),
(1, 2, 1, 50),
(2, 3, 3, 150);

-- Unos zapisa u tablicu prodaja_stavka
insert into prodaja_stavka (id_prodaja_zaglavlje, id_knjiga, kolicina, cijena_prodaje) values
(1, 1, 1, 50),
(2, 2, 2, 100),
(3, 3, 2, 80);

-- Update zapisa u tablici partner
update partner
set naziv_partnera = 'Nova Knjižara',
    ulica_broj = 'Nova ulica 10',
    email = 'info@novaknjizara.com',
    telefon = '01 2222 333'
where id_partner = 1;

-- Update zapisa u tablici rezervacija
update rezervacija
set stanje_rezervacije = 'Istekla'
where id_rezervacija = 2;

-- Update zapisa u tablici otkup_stavka
update otkup_stavka
set cijena_otkupa = 25
where id_otkup_zaglavlje = 1 and id_knjiga = 1;

-- Brisanje zapisa u tablici prodaja_stavka
delete from prodaja_stavka where id_prodaja_stavka = 1;

-- Brisanje zapisa u tablici prodaja_stavka
delete from prodaja_stavka where id_prodaja_stavka = 1;

-- Brisanje zapisa u tablici otkup_stavka
delete from otkup_stavka where id_otkup_stavka = 1;