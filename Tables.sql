/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  04/10/2021 10:21:42                      */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists EQUIPEMENT;

drop table if exists JOUER;

drop table if exists LISTEEQUIPELOCATION;

drop table if exists LOUER;

drop table if exists TYPE;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT 
(
   ID                   integer                        not null,
   NOM                  varchar                        null,
   PRENOM               integer                        null,
   DATE_NAISSANCE       date                           null,
   NCNIB                varchar                        null,
   TEL                  integer                        null,
   TEL_URGENCE          integer                        null,
   primary key (ID)
);

/*==============================================================*/
/* Table : EQUIPEMENT                                           */
/*==============================================================*/
create table EQUIPEMENT 
(
   ID                   integer                        not null,
   NOM                  char(25)                       null,
   COULEUR              varchar(25)                    null,
   TAILLE               integer                        null,
   LONGEUR              integer                        null,
   ID_TYPE              integer                        null,
   primary key (ID)
);

/*==============================================================*/
/* Table : JOUER                                                */
/*==============================================================*/
create table JOUER 
(
   ID                   integer                        not null,
   ID_JOUEUR1           integer                        null,
   ID_JOUEUR2           integer                        null,
   ID_CONSOLE           integer                        null,
   HEURE_DEBUT          time                           null,
   TEMPS_DE_JEU         time                           null,
   DATE_DE_JEU          date                           null,
   primary key (ID)
);

/*==============================================================*/
/* Table : LISTEEQUIPELOCATION                                  */
/*==============================================================*/
create table LISTEEQUIPELOCATION 
(
   ID_LOCATION          integer                        not null,
   ID_EQUIPEMENT1       integer                        null,
   ID_EQUIPEMENT2       integer                        null,
   ID_EQUIPEMENT3       integer                        null,
   ID_EQUIPEMENT4       integer                        null,
   primary key (ID_LOCATION)
);

/*==============================================================*/
/* Table : LOUER                                                */
/*==============================================================*/
create table LOUER 
(
   ID                   integer                        not null,
   ID_JOUEUR            integer                        null,
   DATE_LOCATION        date                           null,
   DATE_RETOUR          date                           null,
   primary key (ID)
);

/*==============================================================*/
/* Table : TYPE                                                 */
/*==============================================================*/
create table TYPE 
(
   ID                   integer                        not null,
   TYPE                 varchar                        null,
   primary key (ID)
);