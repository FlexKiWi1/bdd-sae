Semestre :
    no_sem INT,
    KEY{no_sem};

UE :
    no_ue INT,
    libelle_ue CHAR,
    no_sem INT, FK semestre.no_sem
    KEY{no_ue, no_sem};

Ressource :
    code_ress CHAR,
    no_ress INT,
    no_sem INT, FK semestre.no_sem
    nom_parcours CHAR, FK parcours.nom_parcours
    KEY{no_sem, nom_parcours, no_ress};

Parcours : 
    nom_parcours CHAR,
    KEY{nom_parcours};

SAE : 
    code_sae CHAR,
    no_sae INT,
    no_sem INT, FK semestre.no_sem
    nom_parcours CHAR,
    libelle_sae CHAR,
    KEY{no_sae, no_sem};

Compétence :
    no_competence INT,
    libelle_competence CHAR,
    nom_parcours CHAR, FK parcours.nom_parcours
    KEY{no_competence};
