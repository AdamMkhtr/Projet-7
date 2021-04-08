BEGIN TRANSACTION;

--- ================================================================================
--- Adresse
--- ================================================================================

INSERT INTO public.adresse (id, ville, code_postal, adresse) VALUES (1, 'Saint-Malo', '35400', '46 rue de la pizza');
INSERT INTO public.adresse (id, ville, code_postal, adresse) VALUES (2, 'Lille', '59000', '7 rue de la soif');
INSERT INTO public.adresse (id, ville, code_postal, adresse) VALUES (3, 'Saint-Malo', '35400', '8 rue des Dunes');
INSERT INTO public.adresse (id, ville, code_postal, adresse) VALUES (4, 'Saint-Malo', '35400', '52 rue des Pierres');
INSERT INTO public.adresse (id, ville, code_postal, adresse) VALUES (5, 'Lille', '59000', '12 rue Gambetta');

--- ================================================================================
--- Restaurant
--- ================================================================================

INSERT INTO public.restaurant (id, nom, id_adresse) VALUES (1, 'Réstaurant de Saint-Malo', 1);
INSERT INTO public.restaurant (id, nom, id_adresse) VALUES (2, 'Réstaurant de Lille', 2);

--- ================================================================================
--- Type
--- ================================================================================

INSERT INTO public.type (id, legume, viande, poisson, fromage, sauce) VALUES (1, TRUE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO public.type (id, legume, viande, poisson, fromage, sauce) VALUES (2, FALSE, TRUE, FALSE, FALSE, FALSE);
INSERT INTO public.type (id, legume, viande, poisson, fromage, sauce) VALUES (3, FALSE, FALSE, TRUE, FALSE, FALSE);
INSERT INTO public.type (id, legume, viande, poisson, fromage, sauce) VALUES (4, FALSE, FALSE, FALSE, TRUE, FALSE);
INSERT INTO public.type (id, legume, viande, poisson, fromage, sauce) VALUES (5, FALSE, FALSE, FALSE, FALSE, TRUE);

--- ================================================================================
--- Ingrédient
--- ================================================================================

INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (1, 'Saumon', 3, 'Saumon frais');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (2, 'Mozarella', 4, 'Di Bufala');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (3, 'Fromage de chèvre', 4, 'Fromage frais');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (4, 'Poulet', 2, 'Poulet Épicé');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (5, 'Raclette', 4, 'Raclette suisse');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (6, 'Poivron', 1, 'Poivrons rouge, vert, jaune ciselés à l achat');
INSERT INTO public.ingredient (id, nom, id_type, description) VALUES (7, 'Oignon', 1, 'Oignon jaune ciselés à l achat');

--- ================================================================================
--- Inventaire
--- ================================================================================

INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (1, 1, 1, 5000);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (2, 2, 1, 500);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (3, 3, 1, 900);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (4, 4, 1, 1100);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (5, 5, 1, 5000);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (6, 6, 1, 1500);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (7, 1, 2, 7000);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (8, 2, 2, 490);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (9, 3, 2, 110);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (10, 4, 2, 1700);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (11, 5, 2, 6000);
INSERT INTO public.inventaire (id, id_ingredient, id_restaurant, quantite) VALUES (12, 6, 2, 1450);

--- ================================================================================
--- Article
--- ================================================================================

INSERT INTO public.article (id, nom, prix, resume, recette) VALUES (3, 'Pizza 3 Fromage', '5', 'Pizza base sauce tomate,  raclette, mozarella et, chèvre', '50g de chevre, 50g de raclette, 50g de Mozarella');
INSERT INTO public.article (id, nom, prix, resume, recette) VALUES (2, 'Pizza Oriental', '4', 'Pizza base sauce tomate, poulet épicé', '50g de Poivron, 120g de Poulet');
INSERT INTO public.article (id, nom, prix, resume, recette) VALUES (1, 'Pizza Saumon', '5', 'Pizza base crème fraiche saumon et oignon', '50g oignon, 120g de saumon');

--- ================================================================================
--- Ingrédient_recette
--- ================================================================================

INSERT INTO public.ingredient_recette (id, quantite_demandee, id_article, id_ingredient) VALUES (1, 50, 1, 6);
INSERT INTO public.ingredient_recette (id, quantite_demandee, id_article, id_ingredient) VALUES (2, 120, 1, 4);
INSERT INTO public.ingredient_recette (id, quantite_demandee, id_article, id_ingredient) VALUES (3, 50, 2, 7);
INSERT INTO public.ingredient_recette (id, quantite_demandee, id_article, id_ingredient) VALUES (4, 120, 2, 1);

--- ================================================================================
--- Utilisateur
--- ================================================================================

INSERT INTO public.utilisateur (id, id_adresse, mot_de_passe, nom, prenom, date_de_naissance, adresse_mail, numero_telephone) VALUES (1, 3, 'password', 'Dujardin', 'Jean', '1975-01-07', 'jeanDJ@hotmail.com', '0645586955');

INSERT INTO public.utilisateur (id, id_adresse, mot_de_passe, nom, prenom, date_de_naissance, adresse_mail, numero_telephone) VALUES (2, 4, 'password', 'Labell', 'David', '1997-11-09', 'davidLB@hotmail.com', '0625696917');

INSERT INTO public.utilisateur (id, id_adresse, mot_de_passe, nom, prenom, date_de_naissance, adresse_mail, numero_telephone) VALUES (3, 5, 'password', 'Julien', 'Leon', '1997-11-09', 'davidLB@hotmail.com', '0627124078');

--- ================================================================================
--- Panier
--- ================================================================================

INSERT INTO public.panier (id, id_utilisateur) VALUES (1, 1);
INSERT INTO public.panier (id, id_utilisateur) VALUES (2, 1);
INSERT INTO public.panier (id, id_utilisateur) VALUES (3, 2);
INSERT INTO public.panier (id, id_utilisateur) VALUES (4, 3);

--- ================================================================================
--- Panier_article
--- ================================================================================

INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (1, 1, 1, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (2, 3, 1, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (3, 1, 2, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (4, 2, 2, 1, 4);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (5, 1, 3, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (6, 1, 4, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (7, 1, 4, 1, 5);
INSERT INTO public.panier_article (id, id_article, id_panier, quantite, prix_article_du_jour) VALUES (8, 3, 4, 1, 5);

--- ================================================================================
--- Statut
--- ================================================================================

INSERT INTO public.statut (id, receptionnee, en_cours_de_preparation, en_cours_de_livraison, terminee, annulee) VALUES (1, TRUE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO public.statut (id, receptionnee, en_cours_de_preparation, en_cours_de_livraison, terminee, annulee) VALUES (2, FALSE, TRUE, FALSE, FALSE, FALSE);
INSERT INTO public.statut (id, receptionnee, en_cours_de_preparation, en_cours_de_livraison, terminee, annulee) VALUES (3, FALSE, FALSE, TRUE, FALSE, FALSE);
INSERT INTO public.statut (id, receptionnee, en_cours_de_preparation, en_cours_de_livraison, terminee, annulee) VALUES (4, FALSE, FALSE, FALSE, TRUE, FALSE);
INSERT INTO public.statut (id, receptionnee, en_cours_de_preparation, en_cours_de_livraison, terminee, annulee) VALUES (5, FALSE, FALSE, FALSE, FALSE, TRUE);

--- ================================================================================
--- Commande
--- ================================================================================

INSERT INTO public.commande (id, id_panier, id_statut, id_utilisateur, date, id_adresse, id_restaurant, payee_en_ligne, livraison, promotion, remise) VALUES (1, 1, 1, 1, '2020-01-07 12:34:00', 1, 1, TRUE, FALSE, FALSE, 0);
INSERT INTO public.commande (id, id_panier, id_statut, id_utilisateur, date, id_adresse, id_restaurant, payee_en_ligne, livraison, promotion, remise) VALUES (2, 2, 2, 1, '2020-01-09 13:34:00', 3, 1, TRUE, TRUE, FALSE, 0);
INSERT INTO public.commande (id, id_panier, id_statut, id_utilisateur, date, id_adresse, id_restaurant, payee_en_ligne, livraison, promotion, remise) VALUES (3, 3, 3, 2, '2020-03-07 12:34:00', 3, 1, FALSE, TRUE, FALSE, 0);
INSERT INTO public.commande (id, id_panier, id_statut, id_utilisateur, date, id_adresse, id_restaurant, payee_en_ligne, livraison, promotion, remise) VALUES (4, 4, 4, 3, '2020-03-07 12:00:00', 4, 2, FALSE, TRUE, TRUE, 5);

--- ================================================================================
--- Role
--- ================================================================================

INSERT INTO public.role (id, gerant, livreur, pizzaiolo, commercial, directeur_general) VALUES (1, TRUE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO public.role (id, gerant, livreur, pizzaiolo, commercial, directeur_general) VALUES (2, FALSE, TRUE, FALSE, FALSE, FALSE);
INSERT INTO public.role (id, gerant, livreur, pizzaiolo, commercial, directeur_general) VALUES (3, FALSE, FALSE, TRUE, FALSE, FALSE);
INSERT INTO public.role (id, gerant, livreur, pizzaiolo, commercial, directeur_general) VALUES (4, FALSE, FALSE, FALSE, TRUE, FALSE);
INSERT INTO public.role (id, gerant, livreur, pizzaiolo, commercial, directeur_general) VALUES (5, FALSE, FALSE, FALSE, FALSE, TRUE);

--- ================================================================================
--- Employé
--- ================================================================================

INSERT INTO public.employe (id, id_restaurant, nom, prenom, id_role, mot_de_passe) VALUES (1, 1, 'Cassel', 'Vincent', 1, 'password');
INSERT INTO public.employe (id, id_restaurant, nom, prenom, id_role, mot_de_passe) VALUES (2, 2, 'Aniston', 'Jennifer', 2, 'password');
INSERT INTO public.employe (id, id_restaurant, nom, prenom, id_role, mot_de_passe) VALUES (3, 2, 'Moore', 'Demi', 3, 'password');
INSERT INTO public.employe (id, id_restaurant, nom, prenom, id_role, mot_de_passe) VALUES (4, 1, 'Cage', 'Nicolas', 4, 'password');
INSERT INTO public.employe (id, id_restaurant, nom, prenom, id_role, mot_de_passe) VALUES (5, 1, 'Moore', 'Julianne', 5, 'password');

--- ================================================================================
--- Historique_action
--- ================================================================================

INSERT INTO public.historique_action (id, id_employe, id_commande, date, description) VALUES (1, 1, 1, '2020-01-07 12:34:00', 'A préparé la commande');
INSERT INTO public.historique_action (id, id_employe, id_commande, date, description) VALUES (2, 2, 2, '2020-01-09 13:34:00', 'A livré le client');

COMMIT;