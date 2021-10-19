/*==============================================================*/
/*                MISE A JOUR DU TRAVAIL                        */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists JOUER;

drop table if exists LOUER;

drop table if exists LISTEEQUIPELOCATION;

drop table if exists EQUIPEMENT;

drop table if exists TYPE;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT 
(
   ID                   integer                        not null, /* Ici, il n'y'a pas de clé étrangère */
   NOM                  varchar                        null,
   PRENOM               integer                        null,
   DATE_NAISSANCE       date                           null,
   NCNIB                varchar                        null,
   TEL                  integer                        null,
   TEL_URGENCE          integer                        null,
   primary key (ID)
);

/*==============================================================*/
/* Table : JOUER                                                */
/*==============================================================*/
create table JOUER 
(
   ID                   integer                        not null,
   ID_JOUEUR1           integer                        null,   /* "ID_JOUEUR1" fait référence à la clé primaire "ID" dans la table "Client" */
   ID_JOUEUR2           integer                        null,   /* Pareil pour "ID_JOUEUR2 aussi, on a donc ici des clés étrangères" */
   ID_CONSOLE           integer                        null,
   HEURE_DEBUT          time                           null,
   TEMPS_DE_JEU         time                           null,
   DATE_DE_JEU          date                           null,
   primary key (ID),
   /* 
      Un client est aussi un joueur, "ID_JOUEUR1 et 2" peuvent donc être
      une référence du "ID" dansla table "CLIENT"
   */
   FOREIGN KEY ID_JOUEUR1 REFERENCES CLIENT(ID), 
   FOREIGN KEY ID_JOUEUR2 REFERENCES CLIENT(ID)
);

/*==============================================================*/
/* Table : LOUER                                                */
/*==============================================================*/
create table LOUER 
(
   ID                   integer                        not null,
   ID_JOUEUR            integer                        null, /* "ID_JOUEUR" fait référence à la clé primaire "ID" dans la table "Client" */
   DATE_LOCATION        date                           null,
   DATE_RETOUR          date                           null,
   primary key (ID),
   /* 
      Un joueur est un client aussi, on purrait donc penser
       à une référence "ID" de la table "CLIENT" ici
   */
   FOREIGN KEY ID_JOUEUR REFERENCES CLIENT(ID)
);

/*==============================================================*/
/* Table : LISTEEQUIPELOCATION                                  */
/*==============================================================*/
create table LISTEEQUIPELOCATION 
(
   ID_LOCATION          integer                        not null, /* Cet attribut est une clé étrangère qui fait référence à la clé primaire "ID" dans la table "LOUER" */
   ID_EQUIPEMENT1       integer                        null,   
   ID_EQUIPEMENT2       integer                        null,
   ID_EQUIPEMENT3       integer                        null,
   ID_EQUIPEMENT4       integer                        null,
   ID_EQUIPEMENT6       integer                        null,
   ID_EQUIPEMENT7       integer                        null,
   ID_EQUIPEMENT10      integer                        null,
   ID_EQUIPEMENT11      integer                        null,
   ID_EQUIPEMENT12      integer                        null,
   
   primary key (ID_LOCATION),
   /* 
   "ID_EQUIPEMENT1 à ID_EQUIPEMENT12" font référence à la clé primaire "ID"
    dans la table "EQUIPEMENT et sont donc des clés étrangères" 
   */
   FOREIGN KEY ID_EQUIPEMENT1 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT2 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT3 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT4 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT5 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT6 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT7 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT8 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT9 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT10 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT11 REFERENCES EQUIPEMENT(ID),
   FOREIGN KEY ID_EQUIPEMENT12 REFERENCES EQUIPEMENT(ID),
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
   ID_TYPE              integer                        null, /* "ID_TYPE" représente aussi la clé primaire "ID"; dans la table "TYPE" */
   primary key (ID),
   FOREIGN KEY ID_TYPE REFERENCES TYPE(ID) /* Clé étrangère dans la table "TYPE" */
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