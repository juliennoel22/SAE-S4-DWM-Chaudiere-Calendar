-- Adminer 4.17.1 MySQL 11.7.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `box`;
CREATE TABLE `box` (
  `id` varchar(128) NOT NULL,
  `token` varchar(64) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `montant` decimal(12,2) DEFAULT 0.00,
  `kdo` tinyint(4) NOT NULL DEFAULT 0,
  `message_kdo` text DEFAULT '',
  `statut` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT NULL,
  `createur_id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `box2presta`;
CREATE TABLE `box2presta` (
  `box_id` varchar(128) NOT NULL,
  `presta_id` varchar(128) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `coffret2presta`;
CREATE TABLE `coffret2presta` (
  `coffret_id` int(11) NOT NULL,
  `presta_id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `coffret_type`;
CREATE TABLE `coffret_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `prestation`;
CREATE TABLE `prestation` (
  `id` varchar(128) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `unite` varchar(128) DEFAULT NULL,
  `tarif` decimal(10,2) NOT NULL,
  `img` varchar(128) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 2025-05-06 06:23:06


-- Adminer 4.17.1 MySQL 11.7.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `box` (`id`, `token`, `libelle`, `description`, `montant`, `kdo`, `message_kdo`, `statut`, `created_at`, `updated_at`, `createur_id`) VALUES
('360bb4cc-e092-3f00-9eae-774053730cb2',	'twmyDtNlmtC0hsxZ6fEw0+maTTfrDEqNH0gjBhTo3BI=',	'quos dolorem libero',	'Quisquam a eaque eum ipsa est est. Nemo eveniet dolorum nisi. Voluptatem dolores veritatis tempore unde recusandae. Numquam at qui odio voluptas inventore non vel.',	173.00,	1,	'Sit omnis in ut rerum. Odit exercitationem et omnis voluptatum aut numquam rerum. Explicabo dolor corrupti similique exercitationem et accusantium voluptas.',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-305b-4e47-aa94-313cdc1381f8'),
('6cc74b9f-43bc-3f63-a9c4-9158ad83f379',	'3UWreyfDfcLHNiduEVuyrs1JuGY079K+ofIB0oBqttE=',	'eum quasi qui',	'Vel voluptatum veritatis aperiam omnis ad neque est. Temporibus quis et molestiae aut et nesciunt. Quis occaecati architecto quo consequatur reprehenderit aperiam quidem vel. Eum et et omnis.',	40.00,	1,	'Quaerat sit assumenda facere. Cum ut et iste deserunt corporis quidem aliquid. Suscipit ducimus qui dolores omnis delectus suscipit. Aliquid eius reiciendis omnis assumenda illo autem velit.',	2,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-ab42-413d-a32c-c45845d3f98d'),
('24fc3203-dbd0-3b61-801f-2f552b50603f',	'f0Y+tv5+JW0moZCzr/HzgYyKNsxQWyg9WMCoZyV9O3w=',	'sit dolor consectetur',	'Quasi reiciendis et architecto sunt excepturi est non. Maxime suscipit tenetur perspiciatis amet voluptatem eos est. Cum eveniet minus consectetur excepturi placeat.',	160.00,	0,	'',	3,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-6e27-4ae4-9103-89443a25b44c'),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'vjNlzSOpOgARgrwgZ4U39uMdDjhutIdXeHaazdZpAVA=',	'et repudiandae ut',	'Consequatur doloremque quod non eveniet natus placeat. Accusantium necessitatibus id aliquid tenetur facere. Similique dolor est commodi alias enim beatae id incidunt. Eius eius eligendi ab magni ut impedit voluptatem.',	424.00,	0,	'',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-6e27-4ae4-9103-89443a25b44c'),
('06acee62-6b8f-33b4-b67f-76a11c45b111',	'HPUEAIaDIc/lNpuo5qe6LlJaJzQ3DFTu1WRV/EQJaDI=',	'reprehenderit possimus nemo',	'Quia sequi est similique corrupti ab perspiciatis repellendus. Sit quibusdam enim libero blanditiis nostrum ducimus. Ea rem dolorem magnam veritatis. Necessitatibus qui occaecati iusto ut pariatur assumenda sit sunt. Eum itaque et est rerum eum perferendis fuga possimus.',	112.00,	0,	'',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-44d1-44f9-8899-bf0ffb6252a1'),
('f4002ad4-1151-38b8-a584-48c4fb5d7a5a',	'EltjqTsjUGpLt4043NBP99ccIc+SFfQXitoHauxW1aA=',	'et autem placeat',	'Est ipsa autem esse labore qui inventore in. Laudantium enim facere sunt ea amet quae. Eum consequatur fuga ut a.',	244.00,	0,	'',	3,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-305b-4e47-aa94-313cdc1381f8'),
('74ecb7c6-3375-3044-a1f3-fd27d931c9af',	'mjre56n/LnCrwUwiq4ZJuJOrFHhPCZi6oCQ2whAtljE=',	'magnam delectus voluptate',	'Inventore omnis aut deserunt labore aut id. Et eum rem harum modi omnis officia eum. Veniam numquam iste autem et qui possimus sunt animi.',	174.00,	0,	'',	2,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-0806-4d3b-a3c9-449356581916'),
('1e7bab49-ddb5-301b-9fd1-5f2c2f499052',	'YMllERSG9L/JFH02Dw2oB69nQoHGHsqWSvQSu94mgSc=',	'officiis qui sint',	'Deleniti dolor quae repellat et. Ducimus voluptates rerum sequi omnis fuga aspernatur. Non praesentium sunt qui voluptatem omnis. Dolorem vitae eum ad nemo est odio.',	197.00,	0,	'',	4,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-d3f4-4f24-9df4-5c2cff4307a3'),
('1d2b0679-bde9-313a-aab8-47618b21219b',	'kCqQ1Vbd0cSlVtN+kmmOmuF8iC29Ylf4AlUXIzK3LqM=',	'reiciendis est quasi',	'Autem non nulla saepe. Consequatur amet est saepe est dignissimos. Temporibus quasi harum repudiandae atque excepturi quo.',	505.00,	0,	'',	2,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-af68-4b51-a5b6-e52b1805eee1'),
('085c7346-25c4-3fe1-b485-34482c28badd',	'yuGnXxfjEFzPzZLaSPIUQbY0rvz3sXTXG9uliZKrsHs=',	'ab exercitationem modi',	'Sed illo porro natus excepturi maiores. Architecto saepe occaecati ea tenetur ratione culpa doloribus. Et aliquam aut vel soluta.',	171.00,	1,	'Saepe explicabo ut non aut quibusdam et. Quasi facere ab qui assumenda dolorem. Modi est ut praesentium.',	2,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-af68-4b51-a5b6-e52b1805eee1'),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'qT8jbUwPmXInAW7icvHn63k6msS5TUUUOnRb6IUa+qk=',	'velit minus nihil',	'Voluptatem cupiditate asperiores dolorem sunt illum. Asperiores minus error vel ut nulla.',	532.00,	0,	'',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-5981-4cd7-82ea-6eb04c5ad86a'),
('fa359b10-322a-3f5d-94d2-9b4309d17bed',	'McNnLT1AuCyERcxOGG3K8WUeHsnh+gc1jhL37Oxf+o4=',	'sunt molestiae ut',	'Dignissimos maxime eligendi quibusdam aspernatur quisquam occaecati. Odio et voluptatem perspiciatis asperiores. Totam vel eos nam est.',	448.00,	0,	'',	4,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-c747-45ef-aedd-99e03e3e7e49'),
('6508685e-f50f-3f28-b2a0-5c8f89ccc6da',	'HDJmnQaMUvq5JxcdXVw1yByHUSx4uVb+3QvhbGa9CtE=',	'ea nihil ad',	'Doloremque officia eum libero modi id. Animi voluptas sunt sit laboriosam autem repudiandae. Sint ex a quia tempore et aspernatur commodi.',	310.00,	0,	'',	3,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-305b-4e47-aa94-313cdc1381f8'),
('cc1e57ad-6088-3c76-a549-3ffd91584e8c',	'azILq200m6DFANy4uFuck2CsGCmGXRzU78XyU4enBVs=',	'unde itaque fuga',	'Commodi cumque qui distinctio alias accusamus autem. Consequatur quod qui sed sint illo. Ut beatae eum perspiciatis nesciunt nulla quia ea. Perferendis ut omnis sunt autem.',	195.00,	1,	'Id voluptatem possimus provident ut et. Sequi consequuntur eaque commodi quo reiciendis minima sequi. Laboriosam aperiam voluptate et aut distinctio iure. Quidem dolor sed et earum.',	1,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-1c21-4c30-8c81-879a11a19c76'),
('91ffe968-97d3-3f41-a01c-20a5b10578ca',	'iTx3URmDgd8lH4toWJfUH9XTfUrXXhzhS5HgiK2U9aU=',	'repudiandae incidunt qui',	'Soluta dicta eos corrupti est eveniet fuga qui beatae. Qui qui iure libero maiores. Dolor qui voluptate a nisi magnam fugiat nobis delectus.',	63.00,	1,	'Eos odit est eum vitae esse. Ex fugit et harum est molestias. Accusantium aperiam facere molestias dolores hic. Voluptatem omnis totam iure sint esse.',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-d3f4-4f24-9df4-5c2cff4307a3'),
('084197a0-1297-3a87-815d-368ef3262c41',	'9eZYVii3cbH1l4tJm4gQq416xpy4cbKY5b94EmVA52A=',	'velit repellendus fugiat',	'Ea beatae ad at culpa vel. Est rem est fugit sed laborum. Illo quidem maxime culpa eligendi praesentium et.',	120.00,	0,	'',	3,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-d3f4-4f24-9df4-5c2cff4307a3'),
('652f39a2-2b18-322e-a4fb-240c6eb95474',	'/c+T0cm+O9GRftyTQKoPatH+iEvELfvvXl1J663s4zw=',	'officiis et sunt',	'Amet eligendi sed sint culpa consequatur rerum fugiat. Dolorem officiis maxime neque et commodi sint omnis et.',	329.00,	0,	'',	3,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-828e-4660-a196-17deb7d405a0'),
('40754dbc-edda-30c0-ba73-856668e210fc',	'bK5rpyBhLc4shd6p7v5CtFrNjf5n1t7ybdhcPUgWGN4=',	'omnis similique necessitatibus',	'Sint est aspernatur recusandae officia vel temporibus incidunt unde. Quibusdam est minus quia recusandae facilis ut laborum. Minima tempore rerum sed fugiat reiciendis officiis aut. Ipsa odio et provident ipsum qui eos et.',	191.00,	1,	'Quam sed nobis nobis sint quaerat. Similique aut quis explicabo praesentium voluptas qui quia quasi.',	4,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-5981-4cd7-82ea-6eb04c5ad86a'),
('a35af8c0-8d9d-3a76-bae0-23fec63f9ede',	'IU8FuBpwCEH5KQ3++eAWmYHTkj8VG16qpCH3ONBaebw=',	'ut id blanditiis',	'Quia molestiae assumenda dolores et illum qui. Laboriosam dignissimos culpa magnam accusantium. Et provident explicabo deserunt eius odio.',	147.00,	1,	'Quo dicta ullam quia dolore hic temporibus. Quaerat doloribus nemo debitis dolor pariatur.',	4,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-6e27-4ae4-9103-89443a25b44c'),
('99257e49-5346-3e2a-a544-57bc2d203e99',	'Vrtk9CtV5cspNps++KSePuwSqs2k9hiU41hsQnvrFyA=',	'unde corrupti non',	'Animi vel ea rem sed vel. Quas accusantium quibusdam in dolorem asperiores veniam magni. Deserunt qui quis sunt.',	250.00,	1,	'Consequuntur natus nemo amet ipsum. Quaerat quo qui vero qui incidunt ipsam culpa. Est ipsam dolorum voluptatem mollitia. Inventore occaecati est ipsum rem adipisci repellat ab quae.',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-bfb8-4eef-a517-17df4f0ccc67'),
('1ca33455-6c2c-3980-9860-d30f660f8e84',	'UL/6teWxGluzyMaZfYYY4RLtd3uVnRwcBfpfaLbwvUA=',	'vel adipisci aut',	'Rerum dicta architecto enim maxime ea. Laborum officia dignissimos amet qui. Culpa provident cupiditate eaque iste cum non.',	46.00,	0,	'',	1,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-db7f-45c3-b89c-88c34da9874a'),
('d407e6f6-5520-3803-95ad-ed77c86757a3',	'dY9nek1mwd6NtHy53gJYtSuJwTTtTt+fdlXiIvmxfUY=',	'consectetur inventore eaque',	'Doloribus est porro neque explicabo quidem perferendis. Blanditiis libero rerum voluptas sit quis ut atque corrupti. Et libero nobis pariatur reprehenderit. Soluta quis qui aliquid eius nihil.',	390.00,	0,	'',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-6e27-4ae4-9103-89443a25b44c'),
('244898ea-6eb0-3146-aa70-e06f8236ad05',	'UD+2h4uvh21ClLbN0ZMRm1whEGylxSMKqvtakozimPs=',	'eos occaecati ut',	'Sed nihil id possimus tenetur labore id enim. Consequatur molestiae dignissimos assumenda eveniet eos velit voluptatem. Quas vero placeat dolorem aperiam.',	155.00,	1,	'Et deleniti molestiae nam rerum quo. Laboriosam accusamus eligendi officiis assumenda distinctio. Enim culpa dolorem explicabo ex ex animi.',	1,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-c747-45ef-aedd-99e03e3e7e49'),
('2903170b-963c-3836-ad51-12732309f360',	'fphoLEPK+4xwuy8lu1z7zX1ZMZzozjjSorQMSg1hTJE=',	'perferendis sapiente qui',	'Hic nihil cupiditate et quo ut omnis et cum. Assumenda modi animi et quia. In et expedita voluptatem pariatur a.',	114.00,	0,	'',	5,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c02505f-db7f-45c3-b89c-88c34da9874a'),
('9c08ccf0-ca74-40cc-ba7c-b36110101360',	'OTYzYNVZo6OOhucGes0/O2KUZgH2ed5S5CkooEQ0Qk0=',	'soirée romantique',	'une belle soirée romantique ',	0.00,	1,	'bon anniv ma poulette',	1,	'2024-05-14 13:28:00',	'2024-05-14 13:28:00',	'9c025060-bfb8-4eef-a517-17df4f0ccc67'),
('9c0ac7b7-37ac-4e06-bed3-c031ef6e7774',	'b88d9b8a636e3bfa186f5fe424f188a1',	'libelle de la bobox',	'description de la bobox',	0.00,	0,	NULL,	1,	'2024-05-14 15:39:02',	'2024-05-14 15:39:02',	NULL),
('9c0ac988-bda4-4180-b9d6-f01ef6d1d2fd',	'a563f08c152e6c31e7a141a7ce155bbc',	'libelle de la bobox',	'description de la bobox',	0.00,	0,	NULL,	1,	'2024-05-14 15:44:07',	'2024-05-14 15:44:07',	NULL);

INSERT INTO `box2presta` (`box_id`, `presta_id`, `quantite`) VALUES
('314f3781-da6b-3634-8543-1fe3252a4c09',	'74af082e-4ed4-4c63-9fd3-602a5349c442',	4),
('314f3781-da6b-3634-8543-1fe3252a4c09',	'b15503a1-9694-485d-a336-874860a3b664',	5),
('314f3781-da6b-3634-8543-1fe3252a4c09',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	4),
('314f3781-da6b-3634-8543-1fe3252a4c09',	'162c527f-1e2f-4d91-ac84-3311a2085c09',	2),
('ecd69d84-81ed-311f-b614-f4e9871cb5d6',	'b15503a1-9694-485d-a336-874860a3b664',	3),
('ecd69d84-81ed-311f-b614-f4e9871cb5d6',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	3),
('ecd69d84-81ed-311f-b614-f4e9871cb5d6',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	2),
('ecd69d84-81ed-311f-b614-f4e9871cb5d6',	'0abe4736-88ca-457a-b58f-a8234569b5fe',	3),
('90342b8d-9a2d-3549-9bd4-705b956a30e7',	'faa3b035-4d22-4a13-a1a7-3b6e19883bd7',	1),
('90342b8d-9a2d-3549-9bd4-705b956a30e7',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	1),
('90342b8d-9a2d-3549-9bd4-705b956a30e7',	'773ea293-a779-4047-ae52-af2edac531ff',	3),
('90342b8d-9a2d-3549-9bd4-705b956a30e7',	'badf0dcb-5a93-4ed7-9eb1-feeb46020617',	5),
('90342b8d-9a2d-3549-9bd4-705b956a30e7',	'38888d1e-d408-4e01-a0e6-05a966e348ea',	5),
('5221c8dd-4920-3356-8651-36911476c906',	'b15503a1-9694-485d-a336-874860a3b664',	2),
('5221c8dd-4920-3356-8651-36911476c906',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	2),
('5221c8dd-4920-3356-8651-36911476c906',	'e8785174-b670-4c8b-ba0a-b779aa69b4c1',	5),
('5221c8dd-4920-3356-8651-36911476c906',	'6ad840b8-62df-49fe-8220-0b840f8c3d9e',	5),
('be65c295-8519-32f9-8ffd-96dbcd51a9e9',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	4),
('be65c295-8519-32f9-8ffd-96dbcd51a9e9',	'a5cecbd8-d64f-4146-8770-2fa3d63edbf3',	3),
('be65c295-8519-32f9-8ffd-96dbcd51a9e9',	'3508f806-45ec-4092-9546-4bcdd26533c0',	5),
('be65c295-8519-32f9-8ffd-96dbcd51a9e9',	'14c4c6d1-d4a4-408a-acd7-a130b5e529da',	4),
('ba648c7b-7328-31ce-9f5d-c062cc31a05e',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	3),
('ba648c7b-7328-31ce-9f5d-c062cc31a05e',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	2),
('ba648c7b-7328-31ce-9f5d-c062cc31a05e',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	2),
('b3e82329-6ed8-330d-9009-a9ecbc8229dd',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	2),
('b3e82329-6ed8-330d-9009-a9ecbc8229dd',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	2),
('b3e82329-6ed8-330d-9009-a9ecbc8229dd',	'faa3b035-4d22-4a13-a1a7-3b6e19883bd7',	2),
('b3e82329-6ed8-330d-9009-a9ecbc8229dd',	'badf0dcb-5a93-4ed7-9eb1-feeb46020617',	1),
('b3e82329-6ed8-330d-9009-a9ecbc8229dd',	'e8785174-b670-4c8b-ba0a-b779aa69b4c1',	5),
('1971f957-33e7-3cf6-9a13-48369823f1c9',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	2),
('1971f957-33e7-3cf6-9a13-48369823f1c9',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	2),
('1971f957-33e7-3cf6-9a13-48369823f1c9',	'14c4c6d1-d4a4-408a-acd7-a130b5e529da',	4),
('05f7d1f1-1f54-3dc8-860f-796d337ca0e7',	'991fef91-944d-4993-bbde-ee9a74fe2f36',	1),
('05f7d1f1-1f54-3dc8-860f-796d337ca0e7',	'38888d1e-d408-4e01-a0e6-05a966e348ea',	3),
('351af191-ec57-32bf-9250-234690b4dc89',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	1),
('351af191-ec57-32bf-9250-234690b4dc89',	'991fef91-944d-4993-bbde-ee9a74fe2f36',	4),
('351af191-ec57-32bf-9250-234690b4dc89',	'a5cecbd8-d64f-4146-8770-2fa3d63edbf3',	4),
('351af191-ec57-32bf-9250-234690b4dc89',	'17834c03-5aab-41ab-85c1-05e12290b1d0',	4),
('351af191-ec57-32bf-9250-234690b4dc89',	'773ea293-a779-4047-ae52-af2edac531ff',	2),
('4fc5989e-2d02-315f-b68c-a5dbe9e31f8c',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	3),
('4fc5989e-2d02-315f-b68c-a5dbe9e31f8c',	'a5cecbd8-d64f-4146-8770-2fa3d63edbf3',	2),
('4fc5989e-2d02-315f-b68c-a5dbe9e31f8c',	'3508f806-45ec-4092-9546-4bcdd26533c0',	2),
('c0b19ab2-3d6c-3d73-80db-e17156bf3c6f',	'faa3b035-4d22-4a13-a1a7-3b6e19883bd7',	2),
('c0b19ab2-3d6c-3d73-80db-e17156bf3c6f',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	2),
('c0b19ab2-3d6c-3d73-80db-e17156bf3c6f',	'f60320cb-68d2-48b3-b5a2-a6d67ce0cb23',	5),
('c0b19ab2-3d6c-3d73-80db-e17156bf3c6f',	'162c527f-1e2f-4d91-ac84-3311a2085c09',	5),
('360bb4cc-e092-3f00-9eae-774053730cb2',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	4),
('360bb4cc-e092-3f00-9eae-774053730cb2',	'773ea293-a779-4047-ae52-af2edac531ff',	1),
('6cc74b9f-43bc-3f63-a9c4-9158ad83f379',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	1),
('6cc74b9f-43bc-3f63-a9c4-9158ad83f379',	'b15503a1-9694-485d-a336-874860a3b664',	2),
('24fc3203-dbd0-3b61-801f-2f552b50603f',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	3),
('24fc3203-dbd0-3b61-801f-2f552b50603f',	'14872d96-97d6-4a9f-8a28-463886fea622',	4),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	4),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'773ea293-a779-4047-ae52-af2edac531ff',	3),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'85ec08bf-ebbf-4d4c-bf7f-a9280817ce51',	1),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'162c527f-1e2f-4d91-ac84-3311a2085c09',	4),
('673d04b1-4878-38cf-9204-adbe6474a9a4',	'0abe4736-88ca-457a-b58f-a8234569b5fe',	3),
('06acee62-6b8f-33b4-b67f-76a11c45b111',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	4),
('06acee62-6b8f-33b4-b67f-76a11c45b111',	'773ea293-a779-4047-ae52-af2edac531ff',	4),
('f4002ad4-1151-38b8-a584-48c4fb5d7a5a',	'a277c67f-eb06-40a3-bc06-0d067159e886',	4),
('f4002ad4-1151-38b8-a584-48c4fb5d7a5a',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	3),
('74ecb7c6-3375-3044-a1f3-fd27d931c9af',	'14872d96-97d6-4a9f-8a28-463886fea622',	2),
('74ecb7c6-3375-3044-a1f3-fd27d931c9af',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	1),
('74ecb7c6-3375-3044-a1f3-fd27d931c9af',	'773ea293-a779-4047-ae52-af2edac531ff',	4),
('74ecb7c6-3375-3044-a1f3-fd27d931c9af',	'f60320cb-68d2-48b3-b5a2-a6d67ce0cb23',	1),
('1e7bab49-ddb5-301b-9fd1-5f2c2f499052',	'a277c67f-eb06-40a3-bc06-0d067159e886',	5),
('1e7bab49-ddb5-301b-9fd1-5f2c2f499052',	'a5cecbd8-d64f-4146-8770-2fa3d63edbf3',	3),
('1e7bab49-ddb5-301b-9fd1-5f2c2f499052',	'3508f806-45ec-4092-9546-4bcdd26533c0',	5),
('1d2b0679-bde9-313a-aab8-47618b21219b',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	3),
('1d2b0679-bde9-313a-aab8-47618b21219b',	'01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	2),
('1d2b0679-bde9-313a-aab8-47618b21219b',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	1),
('1d2b0679-bde9-313a-aab8-47618b21219b',	'38888d1e-d408-4e01-a0e6-05a966e348ea',	2),
('085c7346-25c4-3fe1-b485-34482c28badd',	'17834c03-5aab-41ab-85c1-05e12290b1d0',	3),
('085c7346-25c4-3fe1-b485-34482c28badd',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	1),
('085c7346-25c4-3fe1-b485-34482c28badd',	'773ea293-a779-4047-ae52-af2edac531ff',	4),
('085c7346-25c4-3fe1-b485-34482c28badd',	'0abe4736-88ca-457a-b58f-a8234569b5fe',	2),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	4),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	4),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	5),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'17834c03-5aab-41ab-85c1-05e12290b1d0',	5),
('ee8c1097-7737-35ba-aee7-a01d623f00c9',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	4),
('fa359b10-322a-3f5d-94d2-9b4309d17bed',	'14872d96-97d6-4a9f-8a28-463886fea622',	4),
('fa359b10-322a-3f5d-94d2-9b4309d17bed',	'85ec08bf-ebbf-4d4c-bf7f-a9280817ce51',	2),
('fa359b10-322a-3f5d-94d2-9b4309d17bed',	'38888d1e-d408-4e01-a0e6-05a966e348ea',	2),
('6508685e-f50f-3f28-b2a0-5c8f89ccc6da',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	2),
('6508685e-f50f-3f28-b2a0-5c8f89ccc6da',	'14c4c6d1-d4a4-408a-acd7-a130b5e529da',	5),
('cc1e57ad-6088-3c76-a549-3ffd91584e8c',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	3),
('cc1e57ad-6088-3c76-a549-3ffd91584e8c',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	2),
('91ffe968-97d3-3f41-a01c-20a5b10578ca',	'a277c67f-eb06-40a3-bc06-0d067159e886',	2),
('91ffe968-97d3-3f41-a01c-20a5b10578ca',	'faa3b035-4d22-4a13-a1a7-3b6e19883bd7',	2),
('91ffe968-97d3-3f41-a01c-20a5b10578ca',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	1),
('084197a0-1297-3a87-815d-368ef3262c41',	'74af082e-4ed4-4c63-9fd3-602a5349c442',	2),
('084197a0-1297-3a87-815d-368ef3262c41',	'a277c67f-eb06-40a3-bc06-0d067159e886',	5),
('652f39a2-2b18-322e-a4fb-240c6eb95474',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	5),
('652f39a2-2b18-322e-a4fb-240c6eb95474',	'b15503a1-9694-485d-a336-874860a3b664',	1),
('652f39a2-2b18-322e-a4fb-240c6eb95474',	'95a72f23-2ee7-4cbe-98d0-3d372102fcae',	1),
('652f39a2-2b18-322e-a4fb-240c6eb95474',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	4),
('40754dbc-edda-30c0-ba73-856668e210fc',	'14872d96-97d6-4a9f-8a28-463886fea622',	1),
('40754dbc-edda-30c0-ba73-856668e210fc',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	3),
('40754dbc-edda-30c0-ba73-856668e210fc',	'af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	4),
('40754dbc-edda-30c0-ba73-856668e210fc',	'badf0dcb-5a93-4ed7-9eb1-feeb46020617',	5),
('a35af8c0-8d9d-3a76-bae0-23fec63f9ede',	'01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	3),
('a35af8c0-8d9d-3a76-bae0-23fec63f9ede',	'b8559a26-74e1-47e6-8028-aa6ded071d86',	5),
('99257e49-5346-3e2a-a544-57bc2d203e99',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	2),
('99257e49-5346-3e2a-a544-57bc2d203e99',	'17834c03-5aab-41ab-85c1-05e12290b1d0',	1),
('99257e49-5346-3e2a-a544-57bc2d203e99',	'6ad840b8-62df-49fe-8220-0b840f8c3d9e',	5),
('1ca33455-6c2c-3980-9860-d30f660f8e84',	'74af082e-4ed4-4c63-9fd3-602a5349c442',	2),
('1ca33455-6c2c-3980-9860-d30f660f8e84',	'3508f806-45ec-4092-9546-4bcdd26533c0',	1),
('d407e6f6-5520-3803-95ad-ed77c86757a3',	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	4),
('d407e6f6-5520-3803-95ad-ed77c86757a3',	'e8785174-b670-4c8b-ba0a-b779aa69b4c1',	5),
('d407e6f6-5520-3803-95ad-ed77c86757a3',	'6ad840b8-62df-49fe-8220-0b840f8c3d9e',	3),
('244898ea-6eb0-3146-aa70-e06f8236ad05',	'63cdce06-cd63-4fbe-9695-885d3cb64c7b',	5),
('244898ea-6eb0-3146-aa70-e06f8236ad05',	'badf0dcb-5a93-4ed7-9eb1-feeb46020617',	5),
('2903170b-963c-3836-ad51-12732309f360',	'17834c03-5aab-41ab-85c1-05e12290b1d0',	2),
('2903170b-963c-3836-ad51-12732309f360',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	1),
('2903170b-963c-3836-ad51-12732309f360',	'0abe4736-88ca-457a-b58f-a8234569b5fe',	2),
('9c0ac7b7-37ac-4e06-bed3-c031ef6e7774',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	14),
('9c0ac7b7-37ac-4e06-bed3-c031ef6e7774',	'01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	12),
('9c0ac7b7-37ac-4e06-bed3-c031ef6e7774',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	2),
('9c0ac988-bda4-4180-b9d6-f01ef6d1d2fd',	'4cca8b8e-0244-499b-8247-d217a4bc542d',	14),
('9c0ac988-bda4-4180-b9d6-f01ef6d1d2fd',	'01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	12),
('9c0ac988-bda4-4180-b9d6-f01ef6d1d2fd',	'1fde0834-f834-49ea-89ba-26c7695a04e0',	2);

INSERT INTO `categorie` (`id`, `libelle`, `description`) VALUES
(1,	'restauration',	'restaurant, en cas, sur le pouce, livré ... toutes les façons de manger.'),
(2,	'hébergement',	'hôtel, chambre d\'hôte, cabane dans les bois, appart\'hotel, ...'),
(3,	'attention',	'les petits plus qui font la différence : fleurs, chocolats, souvenirs'),
(4,	'activité',	'culture, sport, bien être, détente, visite ... toutes les activités sont là.'),
(5,	'petit trucs',	'des ptits trucs sympas');

INSERT INTO `coffret2presta` (`coffret_id`, `presta_id`) VALUES
(1,	'14c4c6d1-d4a4-408a-acd7-a130b5e529da'),
(1,	'e8785174-b670-4c8b-ba0a-b779aa69b4c1'),
(1,	'6ad840b8-62df-49fe-8220-0b840f8c3d9e'),
(1,	'162c527f-1e2f-4d91-ac84-3311a2085c09'),
(1,	'74af082e-4ed4-4c63-9fd3-602a5349c442'),
(2,	'faa3b035-4d22-4a13-a1a7-3b6e19883bd7'),
(2,	'b8559a26-74e1-47e6-8028-aa6ded071d86'),
(2,	'38888d1e-d408-4e01-a0e6-05a966e348ea'),
(2,	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb'),
(2,	'17834c03-5aab-41ab-85c1-05e12290b1d0'),
(3,	'95a72f23-2ee7-4cbe-98d0-3d372102fcae'),
(3,	'8854b992-aa48-4ef7-9048-2d92a8f1a1bb'),
(3,	'4cca8b8e-0244-499b-8247-d217a4bc542d'),
(3,	'38888d1e-d408-4e01-a0e6-05a966e348ea'),
(3,	'f60320cb-68d2-48b3-b5a2-a6d67ce0cb23');

INSERT INTO `coffret_type` (`id`, `libelle`, `description`, `theme_id`) VALUES
(1,	'week-end anniversaire',	'Un week-end en famille pour l\'anniversaire d\'un de vos enfants',	2),
(2,	'Découvrir Nancy',	'A la découverte de Nancy : histoire, culture, monuments',	3),
(3,	'gastronomie lorraine',	'Un week-end sur la piste des meilleurs endroits pour manger à Nancy',	4);

INSERT INTO `prestation` (`id`, `libelle`, `description`, `url`, `unite`, `tarif`, `img`, `cat_id`) VALUES
('4cca8b8e-0244-499b-8247-d217a4bc542d',	'Champagne',	'Bouteille de champagne + flutes + jeux à gratter',	NULL,	'1 bouteille, 4 flutes, 4 jeux',	20.00,	'champagne.jpg',	3),
('14872d96-97d6-4a9f-8a28-463886fea622',	'Musique',	'Partitions de piano à 4 mains',	NULL,	'2 partitions',	25.00,	'musique.jpg',	3),
('63cdce06-cd63-4fbe-9695-885d3cb64c7b',	'Exposition',	'Visite guidée de l’exposition ‘REGARDER’ à la galerie Poirel',	NULL,	'visite pour 1 personne',	14.00,	'poirelregarder.jpg',	4),
('74af082e-4ed4-4c63-9fd3-602a5349c442',	'Goûter',	'Goûter au FIFNL',	NULL,	'gouter pour 1 personne',	20.00,	'gouter.jpg',	1),
('b15503a1-9694-485d-a336-874860a3b664',	'Projection',	'Projection courts-métrages au FIFNL',	NULL,	'1 entree categorie A',	10.00,	'film.jpg',	3),
('a277c67f-eb06-40a3-bc06-0d067159e886',	'Bouquet',	'Bouquet de roses et Mots de Marion Renaud',	NULL,	'1 bouquet',	16.00,	'rose.jpg',	3),
('8854b992-aa48-4ef7-9048-2d92a8f1a1bb',	'Diner Stanislas',	'Diner à La Table du Bon Roi Stanislas (Apéritif /Entrée / Plat / Vin / Dessert / Café / Digestif)',	NULL,	'par personne',	60.00,	'bonroi.jpg',	1),
('991fef91-944d-4993-bbde-ee9a74fe2f36',	'Origami',	'Baguettes magiques en Origami en buvant un thé',	NULL,	'atelier 2 personnes',	12.00,	'origami.jpg',	4),
('01d57b87-8c0f-4ef1-8ce5-b6b82d4a8ec5',	'Livres',	'Livre bricolage avec petits-enfants + Roman',	NULL,	'le pack 5 livres',	24.00,	'bricolage.jpg',	3),
('95a72f23-2ee7-4cbe-98d0-3d372102fcae',	'Diner  Grand Rue ',	'Diner au Grand’Ru(e) (Apéritif / Entrée / Plat / Vin / Dessert / Café)',	NULL,	'par personne',	59.00,	'grandrue.jpg',	1),
('faa3b035-4d22-4a13-a1a7-3b6e19883bd7',	'Visite guidée',	'Visite guidée personnalisée de Saint-Epvre jusqu’à Stanislas',	NULL,	'groupe max 4 personnes ',	11.00,	'place.jpg',	4),
('a5cecbd8-d64f-4146-8770-2fa3d63edbf3',	'Bijoux',	'Bijoux de manteau + Sous-verre pochette de disque + Lait après-soleil',	NULL,	'l\'ensemble',	29.00,	'bijoux.jpg',	3),
('b8559a26-74e1-47e6-8028-aa6ded071d86',	'Opéra',	'Concert commenté à l’Opéra',	NULL,	'loge 4 personnes ',	15.00,	'opera.jpg',	4),
('17834c03-5aab-41ab-85c1-05e12290b1d0',	'Thé Hotel de la reine',	'Thé de debriefing au bar de l’Hotel de la reine',	NULL,	'par personne',	5.00,	'hotelreine.gif',	1),
('3508f806-45ec-4092-9546-4bcdd26533c0',	'Jeu connaissance',	'Jeu pour faire connaissance',	NULL,	'le jeu complet avec les règles',	6.00,	'connaissance.jpg',	4),
('1fde0834-f834-49ea-89ba-26c7695a04e0',	'Diner',	'Diner (Apéritif / Plat / Vin / Dessert / Café)',	NULL,	'par personne',	40.00,	'diner.jpg',	1),
('773ea293-a779-4047-ae52-af2edac531ff',	'Cadeaux individuels',	'Cadeaux individuels sur le thème de la soirée',	NULL,	'par personne',	13.00,	'cadeaux.jpg',	3),
('af272cf7-6e6b-4978-9e9d-8c40e989bf6c',	'Animation',	'Activité animée par un intervenant extérieur',	NULL,	'acivité pour 2 personnes ',	9.00,	'animateur.jpg',	4),
('85ec08bf-ebbf-4d4c-bf7f-a9280817ce51',	'Jeu contacts',	'Jeu pour échange de contacts',	NULL,	'le jeu complet avec les règles',	5.00,	'contact.png',	4),
('f60320cb-68d2-48b3-b5a2-a6d67ce0cb23',	'Cocktail',	'Cocktail de fin de soirée',	NULL,	'par personne',	12.00,	'cocktail.jpg',	1),
('162c527f-1e2f-4d91-ac84-3311a2085c09',	'Star Wars',	'Star Wars - Le Réveil de la Force. Séance cinéma 3D',	NULL,	'par personne',	12.00,	'starwars.jpg',	4),
('badf0dcb-5a93-4ed7-9eb1-feeb46020617',	'Concert',	'Un concert à Nancy',	NULL,	'par personne',	17.00,	'concert.jpg',	4),
('14c4c6d1-d4a4-408a-acd7-a130b5e529da',	'Appart Hotel',	'Appart’hôtel Coeur de Ville, en plein centre-ville',	NULL,	'appartement 4 personnes ',	56.00,	'apparthotel.jpg',	2),
('38888d1e-d408-4e01-a0e6-05a966e348ea',	'Hôtel d\'Haussonville',	'Hôtel d\'Haussonville, au coeur de la Vieille ville à deux pas de la place Stanislas',	NULL,	'chambre double',	169.00,	'hotel_haussonville_logo.jpg',	2),
('0abe4736-88ca-457a-b58f-a8234569b5fe',	'Boite de nuit',	'Discothèque, Boîte tendance avec des soirées à thème & DJ invités',	NULL,	'par personne ',	32.00,	'boitedenuit.jpg',	4),
('e8785174-b670-4c8b-ba0a-b779aa69b4c1',	'Planètes Laser',	'Laser game : Gilet électronique et pistolet laser comme matériel, vous voilà équipé.',	NULL,	'par personne ',	15.00,	'laser.jpg',	4),
('6ad840b8-62df-49fe-8220-0b840f8c3d9e',	'Fort Aventure',	'Découvrez Fort Aventure à Bainville-sur-Madon, un site Accropierre unique en Lorraine ! Des Parcours Acrobatiques pour petits et grands, Jeu Mission Aventure, Crypte de Crapahute, Tyrolienne, Saut à l\'élastique inversé, Toboggan géant... et bien plus encore.',	NULL,	'par personne',	25.00,	'fort.jpg',	4);

INSERT INTO `theme` (`id`, `libelle`, `description`) VALUES
(1,	'sport',	'combiner sport et réconfort : la clé pour un week-end parfait'),
(2,	'famille',	'Rien de mieux que des activités ppur toute la famille'),
(3,	'culture',	'Découvrir, apprendre, se cultiver'),
(4,	'gastronomie',	'les plaisirs culinaires, toujours un must');

SET NAMES utf8mb4;

INSERT INTO `user` (`id`, `user_id`, `password`, `role`) VALUES
('9c02505f-af68-4b51-a5b6-e52b1805eee1',	'aurore06@example.org',	'$2y$10$jMVU9TsmnErWYHh6I.DxWOZNiuEB7.9mLEPUlMvylrkfWNV53cZoS',	1),
('9c02505f-c747-45ef-aedd-99e03e3e7e49',	'laurence.duval@example.com',	'$2y$10$X5PAuPwcTFncA3sTcC3eIuVVxI3UYKL8Wpj2H9JBqLLdlOk0AUA3C',	1),
('9c02505f-db7f-45c3-b89c-88c34da9874a',	'simone24@example.com',	'$2y$10$0tU9Bc3fN5uC1mHn0K24Yu1bbERpsSjNqhmYdhhKtUVaQBMtojhre',	1),
('9c02505f-efa1-496d-bfe6-d3d9f5e58b8e',	'ferrand.monique@example.net',	'$2y$10$oOnQnw2waqdCW1qPkISpqejMxUyPWJb64pYL9OfnyeiHyn7ePBsuK',	1),
('9c025060-0806-4d3b-a3c9-449356581916',	'dupont.noel@example.net',	'$2y$10$H7m2EBbJQDWnR7lFgIXI6eS9hs7V/z7ZB9GwAMNpLXSyfchzYaoPC',	1),
('9c025060-1c21-4c30-8c81-879a11a19c76',	'paul86@example.org',	'$2y$10$7Ke9Dcudngr1o0xZc2z9cOtgi/Kmqqple0uYncBdWlNlBAlys5J1C',	1),
('9c025060-305b-4e47-aa94-313cdc1381f8',	'wprevost@example.net',	'$2y$10$0N9DtyX1wGBsXWKj0VZEwOKL7y455Tyhig0yhILwqK88zkgggaNz.',	1),
('9c025060-44d1-44f9-8899-bf0ffb6252a1',	'lebreton.claire@example.org',	'$2y$10$bxBo1a9qY3NCWzbcZTiJx.wP2GZxcW5nPi5qZJN0BaQUQz4kGlDIe',	1),
('9c025060-5981-4cd7-82ea-6eb04c5ad86a',	'poirier.danielle@example.com',	'$2y$10$UmaxQfZLfLEszR/WN64IMeYK.MiBb/9PKUJDeWD7vYWvVDh/43MLq',	1),
('9c025060-6e27-4ae4-9103-89443a25b44c',	'mathilde.michaud@example.com',	'$2y$10$QERhc7WsGOcKasWyz8roaeaHNJdMz0hD/865q3gKyIhYbWUKdIpb2',	1),
('9c025060-828e-4660-a196-17deb7d405a0',	'camille.grondin@example.net',	'$2y$10$J.6hOxAUq9CzpnhpE5iwNuOU3EfTqpMHsm6WKGnQ.7uKBBd7BvQoS',	1),
('9c025060-96f7-4798-a36d-7e9d52e0ed72',	'lopes.benoit@example.net',	'$2y$10$/nX.tezmZZd7ohZ5Nb1nhO6aBqOVcrYu4FXABaoy9ds3/d1H9LW0y',	1),
('9c025060-ab42-413d-a32c-c45845d3f98d',	'yhubert@example.net',	'$2y$10$pElwpsdJapb46OUAwLimEetjPJ37IkPmOd/1BRTPi/avj6358KnHe',	1),
('9c025060-bfb8-4eef-a517-17df4f0ccc67',	'fleury.jacques@example.com',	'$2y$10$Xw69KYATwv0swU970LAOBOWwv63.cVb1Kq/880Y42611umePa1Y.u',	1),
('9c025060-d3f4-4f24-9df4-5c2cff4307a3',	'lefort.roger@example.net',	'$2y$10$fQBkcScptbwvYWrjisHg3OdWiKCyH0VQ5jhISQ5PUWcRpbgdLmPiC',	1),
('9c025060-e843-4729-b2cd-44c29636764a',	'admin@gift.net',	'$2y$10$JAC.5T.rdONr/ZtgG8o9ceNiYdV.h03WDL4YjVfpPQKSys4MTkh0K',	100);

-- 2025-05-06 06:23:21
