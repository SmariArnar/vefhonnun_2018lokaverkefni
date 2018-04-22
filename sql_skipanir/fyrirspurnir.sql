/*
CREATE table flytjandi (
flytjandiID int primary key,
nafnFlytjanda varchar(20),
faeddur int,
daudur int,
lysing varchar(10000),
aldur int);
*//*
create table lagalisti(
nafnLags varchar(50),
lagID int primary key,
texti varchar(10000),
utgafudagur varchar(3000),
flytjandilagID INT,
tegundlagID INT,
utgefandilagID INT
);
*//*
create table tegund(
tegundID int primary key,
tegund varchar(40),
flytjandiTegundID int
);
*//*
create table utgefandi(
utgefandiID int primary key,
nafnUtgefanda varchar(40),
stefna varchar(20000),
copyright varchar(50),
stadsetning varchar(50)
);
*//*
create table askrifandi(
askrifandiID int primary key,
nafnAskrifanda varchar(30),
email varchar(40),
heimili varchar(70)
);
*/
/*
create table lagaval(
askrifandivalID int,
flytjandiValID int,
lagcalID int,
dagsetningVal varchar(200)
);*//*
create table tonleikar(
tonleikarID int primary key,
flytjendurTonleikarID int,
stadsetning varchar(1000),
dagsetningTonleikar varchar(2000),
fjoldiMida int,
askrifendurTonleikarID int,
dagskra varchar(200)
);
*/
/*
create table midasala(
fjoldiMidasala int primary key,
stadur varchar(60),
flytjandiSalaID int,
dagsetning varchar(200)
);
/*
select ID, nafn
from flytjandi
having ID and flytjandiID = 1;
*/
