
CREATE TABLE public.Restaurant (
                id INTEGER NOT NULL,
                nom VARCHAR(30) NOT NULL,
                ville VARCHAR(20) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                adresse VARCHAR(200) NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.utilisateur_id_seq;

CREATE TABLE public.Utilisateur (
                id INTEGER NOT NULL DEFAULT nextval('public.utilisateur_id_seq'),
                nom VARCHAR(20) NOT NULL,
                prenom VARCHAR(20) NOT NULL,
                ville VARCHAR(20) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                adresse VARCHAR(100) NOT NULL,
                date_de_naissance DATE NOT NULL,
                adresse_mail VARCHAR(50) NOT NULL,
                numero_telephone VARCHAR(10) NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.Utilisateur.id;

CREATE SEQUENCE public.panier_id_client_seq;

CREATE TABLE public.Panier (
                id INTEGER NOT NULL,
                id_utilisateur INTEGER NOT NULL DEFAULT nextval('public.panier_id_client_seq'),
                prix_panier NUMERIC(5,2) NOT NULL,
                CONSTRAINT panier_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.panier_id_client_seq OWNED BY public.Panier.id_utilisateur;

CREATE SEQUENCE public.commande_id_panier_seq;

CREATE TABLE public.Commande (
                id INTEGER NOT NULL,
                id_panier INTEGER NOT NULL DEFAULT nextval('public.commande_id_panier_seq'),
                commande_en_cours BOOLEAN NOT NULL,
                date TIMESTAMP NOT NULL,
                payee_en_ligne BOOLEAN NOT NULL,
                livraison BOOLEAN NOT NULL,
                prix_total INTEGER NOT NULL,
                promotion BOOLEAN NOT NULL,
                remise NUMERIC(5,2),
                CONSTRAINT commande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_id_panier_seq OWNED BY public.Commande.id_panier;

CREATE SEQUENCE public.historique_de_commande_id_utilisateur_seq;

CREATE SEQUENCE public.compte_client_id_seq;

CREATE TABLE public.Historique_de_commande (
                id_utilisateur INTEGER NOT NULL DEFAULT nextval('public.historique_de_commande_id_utilisateur_seq'),
                id_commande INTEGER NOT NULL DEFAULT nextval('public.compte_client_id_seq'),
                CONSTRAINT historique_de_commande_pk PRIMARY KEY (id_utilisateur, id_commande)
);


ALTER SEQUENCE public.historique_de_commande_id_utilisateur_seq OWNED BY public.Historique_de_commande.id_utilisateur;

ALTER SEQUENCE public.compte_client_id_seq OWNED BY public.Historique_de_commande.id_commande;

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.Ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                nom VARCHAR(20) NOT NULL,
                type INTEGER NOT NULL,
                description VARCHAR(300) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.Ingredient.id;

CREATE SEQUENCE public.inventaire_id_restaurant_seq;

CREATE TABLE public.Inventaire (
                id INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                id_restaurant INTEGER NOT NULL DEFAULT nextval('public.inventaire_id_restaurant_seq'),
                quantite NUMERIC(20) NOT NULL,
                CONSTRAINT inventaire_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.inventaire_id_restaurant_seq OWNED BY public.Inventaire.id_restaurant;

CREATE TABLE public.Article (
                id INTEGER NOT NULL,
                nom VARCHAR(20) NOT NULL,
                prix NUMERIC(5,2) NOT NULL,
                resume VARCHAR(300) NOT NULL,
                recette VARCHAR(500),
                CONSTRAINT article_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.ingredient_recette_id_article_seq;

CREATE SEQUENCE public.ingrdient_recette_id_ingr_dient_seq;

CREATE TABLE public.Ingredient_recette (
                id INTEGER NOT NULL,
                quantite_demandee NUMERIC(20) NOT NULL,
                id_article INTEGER NOT NULL DEFAULT nextval('public.ingredient_recette_id_article_seq'),
                id_ingredient INTEGER NOT NULL DEFAULT nextval('public.ingrdient_recette_id_ingr_dient_seq'),
                CONSTRAINT ingredient_recette_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_recette_id_article_seq OWNED BY public.Ingredient_recette.id_article;

ALTER SEQUENCE public.ingrdient_recette_id_ingr_dient_seq OWNED BY public.Ingredient_recette.id_ingredient;

CREATE SEQUENCE public.panier_article_id_article_seq;

CREATE TABLE public.panier_article (
                id INTEGER NOT NULL,
                id_panier INTEGER NOT NULL,
                id_article INTEGER NOT NULL DEFAULT nextval('public.panier_article_id_article_seq'),
                CONSTRAINT panier_article_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.panier_article_id_article_seq OWNED BY public.panier_article.id_article;

CREATE SEQUENCE public.carte_id_article_seq;

CREATE TABLE public.Carte (
                id INTEGER NOT NULL,
                id_article INTEGER NOT NULL DEFAULT nextval('public.carte_id_article_seq'),
                CONSTRAINT carte_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.carte_id_article_seq OWNED BY public.Carte.id_article;

CREATE SEQUENCE public.employe_id_restaurant_seq;

CREATE TABLE public.Employe (
                id INTEGER NOT NULL,
                id_restaurant INTEGER NOT NULL DEFAULT nextval('public.employe_id_restaurant_seq'),
                nom VARCHAR(20) NOT NULL,
                prenom VARCHAR(20) NOT NULL,
                role INTEGER NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.employe_id_restaurant_seq OWNED BY public.Employe.id_restaurant;

CREATE SEQUENCE public.historique_action_id_employe_seq;

CREATE TABLE public.Historique_action (
                id INTEGER NOT NULL,
                id_employe INTEGER NOT NULL DEFAULT nextval('public.historique_action_id_employe_seq'),
                description VARCHAR(500) NOT NULL,
                CONSTRAINT historique_action_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.historique_action_id_employe_seq OWNED BY public.Historique_action.id_employe;

ALTER TABLE public.Inventaire ADD CONSTRAINT restaurant_inventaire_fk
FOREIGN KEY (id_restaurant)
REFERENCES public.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Employe ADD CONSTRAINT restaurant_employe_fk
FOREIGN KEY (id_restaurant)
REFERENCES public.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Panier ADD CONSTRAINT compte_client_panier_fk
FOREIGN KEY (id_utilisateur)
REFERENCES public.Utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Historique_de_commande ADD CONSTRAINT compte_client_historique_de_commande_fk
FOREIGN KEY (id_utilisateur)
REFERENCES public.Utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT panier_commande_fk
FOREIGN KEY (id_panier)
REFERENCES public.Panier (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.panier_article ADD CONSTRAINT panier_panier_article_fk
FOREIGN KEY (id_panier)
REFERENCES public.Panier (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Historique_de_commande ADD CONSTRAINT commande_historique_de_commande_fk
FOREIGN KEY (id_commande)
REFERENCES public.Commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Inventaire ADD CONSTRAINT ingredient_inventaire_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ingredient_recette ADD CONSTRAINT ingredient_ingredient_recette_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Carte ADD CONSTRAINT article_carte_fk
FOREIGN KEY (id_article)
REFERENCES public.Article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.panier_article ADD CONSTRAINT article_panier_article_fk
FOREIGN KEY (id_article)
REFERENCES public.Article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ingredient_recette ADD CONSTRAINT article_ingredient_recette_fk
FOREIGN KEY (id_article)
REFERENCES public.Article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Historique_action ADD CONSTRAINT utilisateur_historique_action_fk
FOREIGN KEY (id_employe)
REFERENCES public.Employe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;