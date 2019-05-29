/*==============================================================*/
/* Campuses                                                     */
/*==============================================================*/
INSERT INTO campuses (
  name,
  address
)
VALUES
(
  'Campus principal',
  '2500, boulevard de l''Université, Sherbrooke (Québec), J1K 2R1'
),
(
  'Campus de la santé',
  '3001, 12e Avenue Nord, Sherbrooke (Québec), J1H 5N4'
),
(
  'Campus de Longueuil',
  '150, place Charles-Le Moyne, C. P. 200, Longueuil (Québec), J4K 0A8'
);


/*==============================================================*/
/* Faculties                                                    */
/*==============================================================*/
INSERT INTO faculties (
  name,
  address
)
VALUES
(
  'Droit',
  NULL
),
(
  'École de gestion',
  NULL
),
(
  'Éducation',
  NULL
),
(
  'Génie',
  NULL
),
(
  'Lettres et sciences humaine - École de musique',
  NULL
),
(
  'Sciences',
  NULL
),
(
  'Sciences de l''activité physique',
  NULL
);


/*==============================================================*/
/* Buildings                                                    */
/*==============================================================*/
INSERT INTO buildings (
  code,
  name,
  address,
  faculty_id,
  campus_id
)
VALUES
(
  'A9',
  'Albert-Leblanc',
  NULL,
  (SELECT id FROM faculties WHERE name='Droit'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'K1',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='École de gestion'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A1',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Éducation'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A2',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Éducation'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A7',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Éducation'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'C1',
  'J.-Armand-Bombardier',
  NULL,
  (SELECT id FROM faculties WHERE name='Génie'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'C2',
  'J.-Armand-Bombardier',
  NULL,
  (SELECT id FROM faculties WHERE name='Génie'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'C4',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Génie'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A3',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Lettres et sciences humaine - École de musique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A4',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Lettres et sciences humaine - École de musique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A5',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Lettres et sciences humaine - École de musique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A6',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Lettres et sciences humaine - École de musique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'C3',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Lettres et sciences humaine - École de musique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D1',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D2',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D3',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D4',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D5',
  NULL,
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D6',
  'Marie-Victorin',
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D7',
  'Marie-Victorin',
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'D8',
  'Sciences de la vie',
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A8',
  'Albert-Leblanc',
  NULL,
  (SELECT id FROM faculties WHERE name='Sciences de l''activité physique'),
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'J1',
  'Centre sportif Yvon-Lamarche',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'J2',
  'Centre sportif Yvon-Lamarche',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'E1',
  'Vie étudiante',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'B1',
  'Georges-Cabana',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'B2',
  'Georges-Cabana',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'B3',
  'Centre culturel',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'B5',
  'Multifonctionnel',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'B6',
  'Irénée-Pinard',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'A10',
  'Recherche en sciences humaines et sociales',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
),
(
  'F1',
  'John-S.-Bourque',
  NULL,
  NULL,
  (SELECT id FROM campuses WHERE name='Campus principal')
);


/*==============================================================*/
/* User types                                                        */
/*==============================================================*/
INSERT INTO user_types (
  name
)
VALUES
(
  'Gestionnaire'
),
(
  'Étudiant'
),
(
  'Enseignant'
),
(
  'Soutien'
),
(
  'Technicien'
);

/*==============================================================*/
/* Users                                                        */
/*==============================================================*/
INSERT INTO users (
  cip,
  first_name,
  last_name,
  email,
  user_type_id
)
VALUES
(
  'belj2026',
  'Jean-François',
  'Bélisle',
  'jean-francois.l.belisle@usherbrooke.ca',
  (SELECT id FROM user_types WHERE name='Gestionnaire')
),
(
  'bruj3102',
  'Justin',
  'Brûlotte',
  'justin.brulotte@usherbrooke.ca',
  (SELECT id FROM user_types WHERE name='Étudiant')
),
(
  'mora2521',
  'Alex',
  'Morin',
  'alex.a.morin@usherbrooke.ca',
  (SELECT id FROM user_types WHERE name='Étudiant')
),
(
  'lavy2504',
  'Youri',
  'Lavoie',
  'youri.lavoie@usherbrooke.ca',
  (SELECT id FROM user_types WHERE name='Étudiant')
),
(
  'stlc2104',
  'Carl',
  'St-Laurent',
  'carl.st-laurent@usherbrooke.ca',
  (SELECT id FROM user_types WHERE name='Étudiant')
);


/*==============================================================*/
/* Outlets                                                      */
/*==============================================================*/
INSERT INTO outlets (
  name,
  open_time,
  close_time,
  user_id,
  building_id
)
VALUES
(
  'Studio de Création',
  '09:00:00',
  '17:00:00',
  (SELECT id FROM users WHERE email='jean-francois.l.belisle@usherbrooke.ca'),
  (SELECT id FROM buildings WHERE code='C4')
);


/*==============================================================*/
/* Order statuses                                               */
/*==============================================================*/
INSERT INTO order_statuses (
  name,
  description
)
VALUES
(
  'En préparation',
  'La commande est en préparation'
),
(
  'Finalisée',
  'La commande est finalisée et en attente d''approbation'
),
(
  'Prête',
  'La commande est prête à être ramassée'
);


/*==============================================================*/
/* Reservation statuses                                         */
/*==============================================================*/
INSERT INTO reservation_statuses (
  name,
  description
)
VALUES
(
  'Disponible',
  'La ressource réservée est disponible'
),
(
  'Indisponible',
  'La ressource réservée est indisponible'
);


/*==============================================================*/
/* Resource categories (parents)                                */
/*==============================================================*/
INSERT INTO resource_categories (
  name,
  description,
  consumable,
  parent_id,
  outlet_id
)
VALUES
(
  'Prototypage rapide',
  'Ressources utiles pour faire une tâche simple',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
),
(
  'Usinage',
  'Ressources utiles pour travailler les matériaux',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
),
(
  'Travail du bois',
  'Ressources utiles pour travailler le bois',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
),
(
  'Électronique et mécatronique',
  'Ressources utiles en électronique et mécatronique',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
),
(
  'Soudure et fonderie',
  'Ressources utiles pour travailler les métaux',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
),
(
  'Garage',
  'Ressources utiles pour travailler sur des voitures',
  false,
  NULL,
  (SELECT id FROM outlets WHERE name='Studio de Création')
);


/*==============================================================*/
/* Resource categories (enfants)                                */
/*==============================================================*/
INSERT INTO resource_categories (
  name,
  description,
  consumable,
  parent_id,
  outlet_id
)
VALUES
(
  'Batteries',
  'Ressources utiles pour travailler avec des batteries',
  false,
  (SELECT id FROM resource_categories WHERE name='Électronique et mécatronique'),
  (SELECT outlet_id FROM resource_categories WHERE id=parent_id)
),
(
  'Imprimantes 3D',
  'Ressources utiles pour l''impression en 3D',
  false,
  (SELECT id FROM resource_categories WHERE name='Prototypage rapide'),
  (SELECT outlet_id FROM resource_categories WHERE id=parent_id)
);


/*==============================================================*/
/* Resource categories (petit-enfants)                          */
/*==============================================================*/
INSERT INTO resource_categories (
  name,
  description,
  consumable,
  parent_id,
  outlet_id
)
VALUES
(
  'Filaments 3D',
  'Différentes sortes de filaments pour l''impression 3D',
  true,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT outlet_id FROM resource_categories WHERE id=parent_id)
);


/*==============================================================*/
/* Resource category statuses                                   */
/*==============================================================*/
INSERT INTO resource_category_statuses (
  name,
  description,
  resource_category_id
)
VALUES
(
  'Fonctionnelle',
  'La ressource est fonctionnelle',
  NULL
),
(
  'Endommagée',
  'La ressource est endommagée',
  NULL
),
(
  'En réparation',
  'La ressource est actuellement en réparation',
  NULL
),
(
  'En manque de filaments 3D',
  'L''imprimante 3D n''a plus de filaments pour impression',
  (SELECT id FROM resource_categories WHERE parent_id IS NOT NULL AND name='Imprimantes 3D')
);


/*==============================================================*/
/* Cost types                                                   */
/*==============================================================*/
INSERT INTO cost_types (
  symbol,
  description,
  resource_category_id
)
VALUES
(
  '/h',
  'par heure',
  NULL
),
(
  '/g',
  'par gramme de filament',
  (SELECT id FROM resource_categories WHERE parent_id IS NOT NULL AND name='Imprimantes 3D')
);


/*==============================================================*/
/* Resources                                                    */
/*==============================================================*/
INSERT INTO resources (
  name,
  description,
  cost,
  quantity,
  resource_category_id,
  resource_category_status_id,
  resource_group_id,
  cost_type_id
)
VALUES
(
  'Imprimante#1',
  'Imprimante bas de gamme',
  '0.05',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#1',
  'Imprimante bas de gamme',
  '0.05',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#1',
  'Imprimante bas de gamme',
  '0.05',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#2',
  'Imprimante moyen de gamme',
  '0.25',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#2',
  'Imprimante moyen de gamme',
  '0.25',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#2',
  'Imprimante moyen de gamme',
  '0.25',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#2',
  'Imprimante moyen de gamme',
  '0.25',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#3',
  'Imprimante haut de gamme',
  '1.00',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#3',
  'Imprimante haut de gamme',
  '1.00',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='Fonctionnelle'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
),
(
  'Imprimante#3',
  'Imprimante haut de gamme',
  '1.00',
  1,
  (SELECT id FROM resource_categories WHERE name='Imprimantes 3D'),
  (SELECT id FROM resource_category_statuses WHERE name='En manque de filaments 3D'),
  NULL,
  (SELECT id FROM cost_types WHERE resource_category_id=resource_category_id AND symbol='/g')
);