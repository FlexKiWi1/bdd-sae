DROP SCHEMA IF EXISTS programme_but CASCADE ;
CREATE SCHEMA programme_but;
SET SCHEMA 'programme_but';

/********** TODO *********
 - Vérifier le bonne nomenclature du code.
 - Changer les valeurs du nombre de caractère max ou de nombre max.
 - Toutes les associations (Tous les liens entre les classes).
 - Testez la BDD en la remplissant ?
*/

-- Piel
CREATE TABLE _semestre (
    numero_sem VARCHAR(1) NOT NULL,
    PRIMARY KEY (numero_sem)
);

CREATE TABLE _ue (
    code_UE VARCHAR(4) NOT NULL,
    PRIMARY KEY (code_UE),
    FOREIGN KEY (numero_sem) REFERENCES _semestre (numero_sem)
    FOREIGN KEY (lib_activite) REFERENCES _activites (lib_activite)
);

CREATE TABLE _competences (
    lib_competence VARCHAR(50) NOT NULL,
    PRIMARY KEY (lib_competence)
);

-- Loris
CREATE TABLE _activites (
    lib_activite VARCHAR(50) NOT NULL,
    lib_competence VARCHAR(50) NOT NULL,
    PRIMARY KEY(lib_activite),
    FOREIGN KEY (lib_competence) REFERENCES _competence (lib_competence)
);

CREATE TABLE _parcours (
    code_p VARCHAR(50) NOT NULL,
    libelle_pacours VARCHAR(50) NOT NULL,
    nbre_gpe_TD_P NUMERIC(10) NOT NULL,
    nbre_gpe_TP_P NUMERIC(10) NOT NULL,
    PRIMARY KEY (code_p)
);

CREATE TABLE _niveau (
    numero_N NUMERIC(10) NOT NULL,
    PRIMARY KEY (numero_N)
);

CREATE TABLE _correspond (
    lib_activite VARCHAR(50) NOT NULL,
    numero_N NUMERIC(10) NOT NULL,
    code_p VARCHAR(50) NOT NULL,
    FOREIGN KEY (lib_activite) REFERENCES _activites (lib_activite),
    FOREIGN KEY (numero_N) REFERENCES _niveau (numero_N),
    FOREIGN KEY (code_p) REFERENCES _parcours (code_p)
);

-- Célestin
CREATE TABLE _ressources (
    code_R     VARCHAR(50) NOT NULL,
    lib_R      VARCHAR(255) NOT NULL,
    nb_h_CM_PN NUMERIC(10) NOT NULL,
    nb_h_TD_PN NUMERIC(10) NOT NULL,
    nb_h_TP_PN NUMERIC(10) NOT NULL,
    numero_sem      NUMERIC(10) NOT NULL,
    code_p     VARCHAR(50) NOT NULL,
    PRIMARY KEY (code_R),
    FOREIGN KEY (code_p) REFERENCES _parcours (code_p),
    FOREIGN KEY (numero_sem) REFERENCES _semestre (numero_sem)
);

CREATE TABLE _sae (
    code_SAE                 VARCHAR(50) NOT NULL,
    lib_SAE                  VARCHAR(255) NOT NULL,
    nb_h_TD_enc              NUMERIC(10) NOT NULL,
    nb_h_TP_projet_autonomie NUMERIC(10) NOT NULL,
    PRIMARY KEY (code_SAE)
);

CREATE TABLE _comprend_r (
    code_R     VARCHAR(255) NOT NULL,
    code_SAE   VARCHAR(255) NOT NULL,
    nb_h_TD_C NUMERIC(10) NOT NULL,
    nb_h_TP_C NUMERIC(10) NOT NULL,
    PRIMARY KEY (code_R, code_SAE),
    FOREIGN KEY (code_R) REFERENCES _ressources (code_R),
    FOREIGN KEY (code_SAE) REFERENCES _sae (code_SAE)
);
