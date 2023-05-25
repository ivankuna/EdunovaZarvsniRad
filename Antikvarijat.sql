drop database if exists antikvarijat;
create database antikvarijat;
use antikvarijat;

create table operater (
	id_operater int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib varchar(11) not null,
	korisnicko_ime varchar(50) not null,
	lozinka varchar(50) not null	
);

create table drzava (
	id_drzava int not null primary key auto_increment,
	naziv_drzave varchar(50) not null
);

create table grad (
	id_grad int not null primary key auto_increment,
	id_drzava int not null,
	postanski_broj varchar(50) not null,
	naziv_grada varchar(50) not null,
	foreign key (id_drzava) references drzava (id_drzava)
);

create table partner (
	id_partner int not null primary key auto_increment,
	naziv_partnera varchar(50) not null,
	ulica_broj varchar(50) not null,
	id_grad int not null,
	oib varchar(11) not null,
	email varchar(50) not null,
	telefon varchar(50) not null,
	foreign key (id_grad) references grad (id_grad)
);

create table autor (
	id_autor int not null primary key auto_increment,
	naziv_autora varchar(50) not null,
	id_drzava int not null,
	foreign key (id_drzava) references drzava (id_drzava)
);

create table izdavac (
	id_izdavac int not null primary key auto_increment,
	naziv_izdavaca varchar(50) not null,
	id_grad int not null,
	foreign key (id_grad) references grad (id_grad)
);

create table knjiga (
	id_knjiga int not null primary key auto_increment,
	naziv_knjige varchar(50) not null,
	id_autor int not null,
	godina_izdanja varchar(4) not null,
	id_izdavac int not null,
	jezik varchar(50) not null,
	broj_stranica int not null,
	vrsta_uveza varchar(50) not null,
	dimenzija varchar(20) not null,
	cijena_prodaje decimal(12,2) not null,
	foreign key (id_autor) references autor (id_autor),
	foreign key (id_izdavac) references izdavac (id_izdavac)
);

create table rezervacija (
	id_rezervacija int not null primary key auto_increment,
	id_partner int not null,
	id_knjiga int not null,
	datum_rezervacije datetime not null,
	datum_isteka_rezervacije datetime not null,
	stanje_rezervacije varchar(20),
	id_operater int not null,
	foreign key (id_partner) references partner (id_partner),
	foreign key (id_knjiga) references knjiga (id_knjiga),
	foreign key (id_operater) references operater (id_operater)
);

create table nacin_placanja (
	id_nacin_placanja int not null primary key auto_increment,
	naziv_nacina_placanja varchar(50),
	oznaka_nacina_placanja varchar(1)
);

create table otkup_zaglavlje (
	id_otkup_zaglavlje int not null primary key auto_increment,
	broj_otkupa varchar(20) not null,
	datum_otkupa datetime not null,
	id_partner int,
	id_operater int not null,
	foreign key (id_partner) references partner (id_partner),
	foreign key (id_operater) references operater (id_operater)
);

create table otkup_stavka (
	id_otkup_stavka int not null primary key auto_increment,
	id_otkup_zaglavlje int not null,
	id_knjiga int not null,
	kolicina int not null,
	cijena_otkupa decimal(12,2) not null,
	foreign key (id_otkup_zaglavlje) references otkup_zaglavlje (id_otkup_zaglavlje),
	foreign key (id_knjiga) references knjiga (id_knjiga)
);

create table prodaja_zaglavlje (
	id_prodaja_zaglavlje int not null primary key auto_increment,
	broj_prodaje varchar(20) not null,
	datum_prodaje datetime not null,
	id_partner int,
	zki varchar(50) not null,
	jir varchar(50) not null,
	id_nacin_placanja int not null,
	id_operater int not null,
	foreign key (id_partner) references partner (id_partner),
	foreign key (id_nacin_placanja) references nacin_placanja (id_nacin_placanja),
	foreign key (id_operater) references operater (id_operater)
);

create table prodaja_stavka (
	id_prodaja_stavka int not null primary key auto_increment,
	id_prodaja_zaglavlje int not null,
	id_knjiga int not null,
	kolicina int not null,
	cijena_prodaje decimal(12,2) not null,
	foreign key (id_prodaja_zaglavlje) references prodaja_zaglavlje (id_prodaja_zaglavlje),
	foreign key (id_knjiga) references knjiga (id_knjiga)
);