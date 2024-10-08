-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 07 2024 г., 01:31
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sommelier_bot`
--

-- --------------------------------------------------------

--
-- Структура таблицы `age_confirmed`
--

CREATE TABLE `age_confirmed` (
  `user_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `age_confirmed`
--

INSERT INTO `age_confirmed` (`user_id`, `username`, `password`) VALUES
(1863964682, 'Emonzo_Kammen', ''),
(1913008131, 'ystenk', '');

-- --------------------------------------------------------

--
-- Структура таблицы `existing_recipes`
--

CREATE TABLE `existing_recipes` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `recipe` text DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `existing_recipes`
--

INSERT INTO `existing_recipes` (`id`, `username`, `name`, `type`, `description`, `recipe`, `source`, `images`, `comment`, `status`) VALUES
(1, 'Oleg', 'Oleg Master', 'Абсент, Водка, Ликер', 'awwdubawnim', 'yhrtthrtrdgf', 'https://yandex.ru', 'https://yandex.ru', 'sedergrthtedt', 'pending');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL COMMENT 'ID Сообщения с рецептом',
  `chat_id` int(11) NOT NULL COMMENT 'ID Чата',
  `user_id` int(11) NOT NULL COMMENT 'ID Пользователя',
  `page` int(11) NOT NULL COMMENT 'Текущая страница',
  `type` enum('absinthe','beer','champagne','cognac','gin','multi','rum','tequila','vermouth','vodka','whiskey','wine') NOT NULL COMMENT 'Тип рецепта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`message_id`, `chat_id`, `user_id`, `page`, `type`) VALUES
(1437, 1913008131, 1913008131, 1, 'whiskey'),
(1442, 1913008131, 1913008131, 1, 'rum'),
(1491, 1913008131, 1913008131, 1, 'absinthe');

-- --------------------------------------------------------

--
-- Структура таблицы `own_recipes`
--

CREATE TABLE `own_recipes` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `recipe` text DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `own_recipes`
--

INSERT INTO `own_recipes` (`id`, `username`, `name`, `type`, `description`, `images`, `recipe`, `author`, `comment`, `status`) VALUES
(1, 'Oleg', 'Доритас', 'Ром, Вермут, Сакэ, Ликер', 'ирвтоцфльбдзвцфзф', 'https://yandex.ru', 'awdwadwa', 'ВАСЯ МОЖЕТ', 'Просто профи своего дела', 'pending'),
(2, 'Гость', 'Водочка', 'Абсент', 'Какой-то вкус', '', 'Взять спичку и водку', 'Христос', '', 'pending'),
(4, 'Гость', 'awfnueimofwe', 'Коньяк', 'rthrthert', 'ergerge', 'wefawd', 'therfesf', 'aawfsesrr', 'pending');

-- --------------------------------------------------------

--
-- Структура таблицы `panel_passwords`
--

CREATE TABLE `panel_passwords` (
  `password` varchar(32) NOT NULL COMMENT 'Пароли MD5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `panel_passwords`
--

INSERT INTO `panel_passwords` (`password`) VALUES
('bf3a8b71f546d8546a625750ae3edb89');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_absinthe`
--

CREATE TABLE `recipe_absinthe` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='рецепты с абсентом';

--
-- Дамп данных таблицы `recipe_absinthe`
--

INSERT INTO `recipe_absinthe` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Хиросима', 'Коктейль \"Хиросима\" является ярким и ароматным алкогольным напитком, в основе которого лежит абсент. Он сочетает в себе кисловато-сладкий вкус абсента с яркими нотками фруктов и трав, что создает загадочную и завораживающую атмосферу. Ингредиенты включают абсент, ликеры или сиропы, лимонный сок и лед. Приготовление этого коктейля предполагает смешивание всех ингредиентов в шейкере с льдом и последующее процеживание в рокс-стакан. Поверхность напитка часто украшается кусочком лимона или мятой. Этот коктейль подходит для тех, кто ценит оригинальные и необычные вкусы.', 'Hirosima-05-29'),
(2, 'Абсент Сауэр ', '\"Абсент Сауэр\" - освежающий коктейль на основе абсента с добавлением лимонного сока, сахарного сиропа и яичного белка. Вкусный, кисловатый и пикантный напиток с нотками трав и аниса. ', 'Absent-Sauehr-05-29'),
(3, 'Молоко львицы', '\"Молоко львицы\" - это коктейль, в котором сочетаются абсент и молоко. Слегка острый вкус абсента олицетворяет силу и энергию львов, а молоко дает коктейлю мягкость и нежность. Пить такой коктейль можно как аперитив или десертный напиток.', 'Moloko-lvicy-05-29'),
(4, 'Яблочное искушение', '\"Яблочное искушение\" - бодрящий коктейль, сочетающий в себе остроту абсента, сладость яблочного сока и пряный оттенок имбирного эля. Этот напиток обладает оригинальным вкусом, который дарует ощущение освежающего и ароматного слияния пряностей и фруктовых ноток.', 'YAblochnoe-iskushenie-05-29'),
(5, 'Зелёный зверь', '\"Зеленый зверь\" - коктейль с абсентом, освежающим лимонным соком и ароматным огурцом. Этот напиток сочетает в себе силу абсента, кислотность лимона и легкость огурца, создавая неповторимый вкус и насыщенный аромат.', 'Zelyonyj-zver-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_beer`
--

CREATE TABLE `recipe_beer` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_beer`
--

INSERT INTO `recipe_beer` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Ёрш', '\"Ёрш\" – это коктейль, который сочетает в себе два популярных напитка: водку и пиво. Он обладает освежающим вкусом и приятной горечью, которые идеально дополняют друг друга. Водка придает коктейлю пряный и островатый вкус, в то время как пиво придает ему освежающую газировку', 'YOrsh-05-29'),
(2, 'Резаное пиво', '\"Резаное пиво\" — смесь темного и светлого сортов, которые наливают в кружку последовательно, в два слоя. При этом можно наливать как с четкой границей между слоями, так и просто смешивать пиво пополам, как получится.', 'Rezanoe-pivo-05-30');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_champagne`
--

CREATE TABLE `recipe_champagne` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_champagne`
--

INSERT INTO `recipe_champagne` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Беллини', '\"Беллини\" — освежающий и ароматный коктейль, приготовленный из персикового пюре и игристого вина (обычно просекко). Он имеет сладковатый вкус персика с легкими тонами вина и часто подаётся в высоких стеклянных бокалах. Беллини идеально подходит для летних вечеров и особенно популярен в качестве аперитива.', 'Ocha-karaj-05-29'),
(2, 'Апероль шприц', '\"Апероль шприц\" - освежающий и легкий итальянский коктейль, который состоит из апероль, просекко (итальянского игристого вина), минеральной воды и лимонных дольк. Этот напиток имеет слегка горький вкус с нотками цитрусов и трав, что делает его отличным выбором для наслаждения в теплую погоду.', 'Aperol-SHpric-05-30');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_cognac`
--

CREATE TABLE `recipe_cognac` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_cognac`
--

INSERT INTO `recipe_cognac` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Коньяк с колой', 'Коктейль \"Коньяк с колой\" - это освежающий и ароматный напиток, созданный путем сочетания благородного коньяка с газированным колой. Гармоничное сочетание сладости и легкой терпкости коньяка с освежающим вкусом коки придает напитку исключительный вкус и делает его прекрасным выбором для вечерних посиделок.', 'Konyak-s-koloj-05-29'),
(2, 'Чай с коньяком', '\"Чай с коньяком\" — изысканный и утонченный коктейль, объединяющий теплоту чая с ароматом и силой коньяка. Этот напиток обладает богатым вкусом и уникальным сочетанием нежности и энергии, идеально подходит для тех, кто ценит качественные и роскошные напитки.', 'CHaj-s-konyakom-05-30');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_gin`
--

CREATE TABLE `recipe_gin` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_gin`
--

INSERT INTO `recipe_gin` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Джин тоник', 'Джин-тоник - освежающий и ароматный коктейль, состоящий из джина, тоника и льда. Сочетание горьковатого джина с газированным тоником создает идеальный баланс между пряными нотами и освежающей горечью. Подается обычно с долькой лайма или лимона для дополнительной кислинки и аромата. Идеальный выбор для летнего вечера или вечеринки.', 'Dzhin-tonik-05-29'),
(2, 'Английский завтрак', '\"Английский завтрак\" - коктейль с освежающим вкусом, в котором сочетаются кислота лимона, сладость малинового джема и сиропа, а также травяной аромат джина. Перепелиное яйцо добавляет текстуру и кремовость, создавая богатый и интересный вкус. Приготовленный с добавлением малины и лимонных дольок, этот коктейль идеально подходит для тех, кто ценит необычные сочетания и желает начать свой день с чем-то оригинальным.', 'Anglijskij-zavtrak-05-29'),
(3, 'Негрони', '\"Негрони\" - классический итальянский коктейль, состоящий из равных частей джина, красного вермута и кинноа. Специфический вкус бархатистого аперитива подчеркивается горьковатыми нотками кинноа и стойким вкусом горького аперитива. Негрони имеет красный янтарный оттенок и подается в стеклянном роксе с кубиком льда и цедрой апельсина.', 'Negroni-05-29'),
(4, 'Авиация', 'Коктейль \"Авиация\" - это освежающий, ароматный напиток с нежными нотами фиалкового ликера и мараскино, сбалансированный с тонким вкусом джина. Сочетание сладости и терпкости делает этот коктейль прекрасным выбором для любителей креативных и изысканных напитков.', 'Aviaciya-05-29'),
(5, 'Последнее слово', 'Коктейль \"Последнее слово\" - ароматный и кислый напиток на основе джина, зеленого шартреза и сока лайма, сочетающий в себе травяные и цитрусовые ноты.', 'Poslednee-slovo-05-29'),
(6, 'Зимняя вишня', '\"Зимняя вишня\" - это освежающий и ароматный коктейль, который сочетает в себе сладкость вишни, легкость мятного вкуса и терпкость крепкого алкоголя. Этот напиток идеально подходит для уютных зимних вечеров и праздничных встреч.', 'Zimnyaya-vishnya-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_multi`
--

CREATE TABLE `recipe_multi` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_multi`
--

INSERT INTO `recipe_multi` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Лонг айленд айс ти', '\"Лонг Айленд\" — коктейль, который состоит из равных долей гина, рома, текилы, водки, ликера трипл сек и соков лимона и колы. Этот коктейль известен своим богатым вкусом и сильным алкогольным содержанием. Он обычно подается в высоком стакане с льдом и лимонной цедрой в качестве украшения.', 'Long-ajlend-ajs-ti-05-29'),
(2, 'Зеленая Фея', 'Коктейль \"Зеленая Фея\" - освежающий и ароматный напиток, напоминающий зеленую фею из волшебных лесов. Этот коктейль обычно приготавливается на основе зеленого абсента, который придает ему свое характерное яркое зеленое цвет. В сочетании с другими ингредиентами, такими как лимонный сок, сиропы и тоник, \"Зеленая Фея\" придает ощущение иллюзии и волшебства, завораживая своим вкусом и ароматом.', 'Zelenaya-Feya-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_rum`
--

CREATE TABLE `recipe_rum` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_rum`
--

INSERT INTO `recipe_rum` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Май Тай', 'Коктейль \"Май Тай\" – это освежающий тропический напиток с основой рома, смешанный с лимонным и апельсиновым соками, ликером оранжевого цвета и сиропом из миндаля. Подается с ломтиком лайма и красным вишенкой.', 'Maj-Taj-05-29'),
(2, 'Куба либре', '\"Куба Либре\" - освежающий коктейль, состоящий из светлого рома, колы и лимонного сока. Напиток обладает сладким вкусом и ароматом рома, с легкой газированной основой колы и кислинкой лимонного сока. При подаче в стеклянном бокале с льдом и декорирован ломтиком лимона или лайма, Куба Либре станет отличным выбором для тех, кто ценит классические коктейли.', 'Kuba-libre-05-29'),
(3, 'Дайкири', 'Коктейль \"Дайкири\" - это свежий, фруктовый и освежающий напиток на основе рома, лайма и сахара. Идеально подходит для тех, кто любит легкие и ароматные коктейли.', 'Dajkiri-05-29'),
(4, 'Мохито', '\"Мохито\" - освежающий коктейль на основе белого рома, свежей мяты, лайма, сахара и содовой воды. Сочетание сладкого, кислого и освежающего вкуса делает его идеальным напитком для летнего отдыха.', 'Mohito-05-29'),
(5, 'Пина колада', '\"Пина колада\" - это тропический коктейль, состоящий из рома, кокосового молока и ананасового сока. Нежный, сладкий и освежающий напиток с терпким вкусом рома и ароматом ананаса, идеально подходит для отдыха на пляже или летней вечеринки. Гарнируется кусочком ананаса и кокосовой стружкой.', 'Pina-kolada-05-29'),
(6, 'Зомби', 'Коктейль \"Зомби\" – экзотический и ароматный напиток, приготовленный на основе темного рома, сока апельсина и лайма, гренадином и другими фруктовыми сиропами. Он имеет ярко-красный цвет и сладко-кислый вкус с нотками специй. Напиток идеально подходит для веселых вечеринок и отлично трансформирует душу любого зомби!', 'Zombi-05-29-2'),
(7, 'Авиапочта', '\"Коктейль \"Авиапочта\" - освежающий и ароматный напиток, сочетающий в себе богатство рома и легкость игристого вина. Прекрасно подходит для летних вечеров и встреч с друзьями. Наслаждайтесь этим освежающим сочетанием вкусов и наслаждайтесь каждым глотком этого уникального напитка.', 'Aviapochta-05-29'),
(8, 'Грог', '\"Грог\" - это традиционный карибский коктейль, который обычно состоит из темного рома, лимонного сока, меда или сахара и горячей воды. Этот напиток обладает приятным пряно-сладким вкусом и часто подаётся в холодные зимние дни для согревания.', 'Grog-05-29-2');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_tequila`
--

CREATE TABLE `recipe_tequila` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_tequila`
--

INSERT INTO `recipe_tequila` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Маргарита', '\"Маргарита\" - классический коктейль на основе текилы, лайма и апельсинного ликера. Смесь всех ингредиентов с льдом в шейкере и подача в оранжевом сахаром ободранном краю бокала. Освежающий, кислый и ароматный напиток, идеально подходит для летнего вечера.', 'Margarita-05-29-91'),
(2, 'Текила Санрайз', '\"Текила Санрайз\" - освежающий коктейль, в основе которого лежит текила, ликер Гренадин и сок лайма. Напиток имеет красивый омбре эффект - оттенки от ярко-красного до светло-оранжевого. В ощущении - сладкий и кислый, с приятной текилой эссенцией. Гарнируется ломтиком лайма и ледяным кубиком. Идеально подходит для веселых вечеринок и летних посиделок', 'Tekila-Sanrajz-05-29'),
(3, 'Passion', 'Коктейль \"Passion\" сочетает в себе огненную текилу, яркий клюквенный ликер и свежий сок лайма для сочного и привлекательного вкуса с нотами экзотики. ¡Salud!', 'Passion-05-29-8'),
(4, 'El Diablo', '\"El Diablo\" - это освежающий коктейль, в основе которого лежит текила. Этот напиток сочетает в себе легкие нотки лимона, имбирного эля и красного вина, создавая интересный и яркий вкус. При подаче на стол он дополняется кубиком льда и долькой лайма', 'El-Diablo-05-29-4'),
(5, 'Reposado Old-Fashioned', 'Коктейль \"Reposado Old-Fashioned\" сочетает в себе теплые древесные ноты текилы Reposado с нотами апельсина и ангостуры. Подается в стеклянном рокс-стакане с кубиками льда и апельсиновой цедрой. Этот коктейль идеально подходит для ценителей текилы и классических коктейлей.', 'Reposado-Old-Fashioned-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_vermouth`
--

CREATE TABLE `recipe_vermouth` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_vermouth`
--

INSERT INTO `recipe_vermouth` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Вермутоник', '\"Вермутоник\" - это освежающий и ароматный коктейль, который состоит из вермута, тоника и ломтиков цитрусовых (обычно лайма или лимона). Этот напиток характеризуется легким вкусом вермута, свежестью тоника и приятной кислинкой от цитрусовых. Идеально подходит для наслаждения в теплый вечер или в кругу друзей.', 'Vermutonik-05-30'),
(2, 'Россо-гранат', '\"Россо-гранат\" - это освежающий коктейль, который сочетает в себе грейпфрутовый сок, гранатовый сок, вермут и содовую. Этот коктейль обладает ярким красным цветом и приятным сочетанием кислого и сладкого вкуса. Он идеально подходит для любителей фруктовых и освежающих напитков.', 'Rosso-granat-05-30');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_vodka`
--

CREATE TABLE `recipe_vodka` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_vodka`
--

INSERT INTO `recipe_vodka` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Перестройка', 'Коктейль \"Перестройка\" - освежающий и ароматный напиток на основе водки, лимонного сока, ликера Трипл Сек и газированной воды. Он прекрасно подходит для летнего вечера и отлично тонизирует.', 'Perestrojka-05-29'),
(2, 'Водка со Спрайтом', 'Коктейль \"Водка со Спрайтом\" - освежающий и легкий напиток, состоящий из водки и газированного напитка Спрайт. Смесь обладает освежающим цитрусовым вкусом и идеально подходит для летнего отдыха или вечеринок.', 'Vodka-so-sprajtom-05-29'),
(3, 'Белый русский', 'Коктейль \"Белый русский\" – это классическое сочетание водки и кофейного ликера, с добавлением сливок. Имеет нежный вкус и богатый аромат кофе, прекрасно сочетаясь с кремовой гладкостью.', 'Belyj-russkij-05-29'),
(4, 'Северное сияние', '\"Северное сияние\" - это освежающий и ароматный коктейль, в котором сочетаются крепкая водка, изысканное шампанское, сладкий мед и кислый сок лимона. Этот напиток прекрасно подойдет для любителей необычных и изысканных вкусов. В нем сочетается легкость и яркость, создавая неповторимое впечатление и напоминая о сиянии северного неба.', 'Severnoe-siyanie-05-29-2'),
(5, 'Манговый дайкири', '\"Манговый дайкири\" - освежающий коктейль, приготовленный на основе рома, свежего манго, лимонного сока и льда. Он имеет яркий фруктовый вкус с нотками цитруса и сладкого рома, идеально подходит для летнего отдыха.', 'Mangovyj-Dajkiri-05-29'),
(6, 'Утро с любимой', 'Коктейль \"Утро с любимой\" - освежающая комбинация свежевыжатого апельсинового сока, нежного кокосового молока и сладкого меда, символизирующая начало нового дня в объятиях любви.', 'Utro-s-lyubimoj-05-29'),
(7, 'Витаминный', 'Коктейль \"Витаминный\" - освежающий и бодрящий напиток, сочетающий в себе острые и сладкие нотки. В нем сочетаются водка, свежий мед, ароматная редька и кислый сок лимона. Акцент на том, что напиток наполнен витаминами и отлично подходит для тех, кто предпочитает яркие и насыщенные вкусы.', 'Vitaminnyj-05-29'),
(8, 'Ву-ву', 'Коктейль \"Ву-ву\" - освежающий и фруктовый напиток с медовым вкусом, состоящий из водки, ликера Мидори, лимонного сока и сиропа. Имеет зеленый цвет и легкую кислинку, идеально подходит для летних вечеров.', 'Vu-vu-05-29'),
(9, 'Космополитен', 'Коктейль \"Космополитен\" – это изысканный красный коктейль с мерника водки, клюквенного ликера, свежего лимонного сока и немного цитрусовой воды или сиропа. Он славится своим ярким кисло-сладким вкусом и ярким розовым оттенком. Сервируется в охлажденном коктейльном бокале, часто украшенный кусочком лимона или цедрой апельсина.', 'Kosmopoliten-05-29'),
(10, 'Водка тоник', 'Коктейль \"Водка тоник\" – освежающий микс из водки и тоника с добавлением льда и ломтиком лимона. Напиток отличается легким вкусом и идеально подходит для тех, кто предпочитает простые и классические сочетания в коктейлях.', 'Vodka-tonik-05-29'),
(11, 'Кровавая Мэри', '\"Кровавая Мэри\" - классический коктейль на основе водки и томатного сока, с добавлением соуса Ворчестершир, горчицы, лимонного сока, перца чили и льда. Представляет собой освежающий, острый и пикантный напиток с характерным красноватым оттенком.', 'Krovavaya-Mehri-05-29'),
(12, 'Лимонная водка', '\"Лимонная водка\" - освежающий коктейль, состоящий из водки и свежевыжатого лимонного сока, подается со льдом в стакане. Этот напиток идеально подходит для тех, кто любит кислотные и пряные вкусы.', 'Limonnaya-kaplya-05-29'),
(13, 'Московский мул', '\"Московский мул\" - освежающий коктейль на основе водки, имеющий оригинальное сочетание лайма, имбирного пива и льда. Этот напиток отлично подходит для любителей освежающих и легких вкусов.', 'Moskovskij-mul-05-29'),
(14, 'Отвертка', '\"Отвертка\" - освежающий апельсиновый коктейль с водкой и апельсиновым соком, украшенный долькой апельсина. Готовится в шейкере и подается в охлажденном стакане.', 'Otvertka-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_whiskey`
--

CREATE TABLE `recipe_whiskey` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_whiskey`
--

INSERT INTO `recipe_whiskey` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Виски с колой', 'Коктейль \"Виски Кола\" - классическое сочетание алкогольного напитка виски с газированным напитком кола. Напиток имеет яркий вкус виски с оттенками сладкой и освежающей колы, что делает его популярным на вечеринках и в барах. Вкусный и простой в приготовлении коктейль, который понравится любителям виски.', 'Viski-s-koloj-05-29'),
(2, 'Jameson Escher', 'Коктейль \"Jameson Escher\" - это освежающий и сладкий напиток с базой из ирландского виски Jameson, лимонного сока, сиропа грейпфрута и тоник в качестве основного ингредиента. Приятное сочетание сладости и кислоты делает этот коктейль идеальным выбором для любителей попробовать что-то новое и необычное.', 'Jameson-Escher-05-29'),
(3, 'Крестный отец', 'Коктейль \"Крестный отец\" — это простой и крепкий напиток, состоящий из виски и амаретто. Его обычно подают в роксе со льдом, и он имеет мягкий, ореховый вкус благодаря амаретто, который смягчает крепость виски.', 'Krestnyj-otec-05-29'),
(4, 'Мятная свежесть', 'Коктейль \"Мятная свежесть\" - освежающий напиток с богатым мятным вкусом. Сочетание виски, мятного ликера и минеральной воды создает идеальный баланс между крепостью и свежестью. Стимулирующий и ароматный вкус этого коктейля станет отличным выбором для любителей мятных напитков.', 'Myatnaya-svezhest-05-29'),
(5, 'Манхэттен', 'Коктейль \"Манхэттен\" - классический американский коктейль с бурбоном, вермутом и ангостурой. Имеет насыщенный вкус с теплыми нотками карамели и ванили, а также легкими травяными оттенками. Подается обычно в охлажденном стакане коктейля или роксе, украшенный вишней или апельсиновой цедрой.', 'Manhehtten-05-29'),
(6, 'Виски сауэр', '\"Виски сауэр\" - классический коктейль с кисло-сладким вкусом, в котором сочетается виски, свежевыжатый лимонный сок и сахарный сироп. Подается в охлажденном рокс-стеклянном бокале с ломтиком лимона и коктейльной вишней.', 'Viski-sauehr-05-29'),
(7, 'Флоридский омар', '\"Флоридский омар\" - изысканный коктейль с интригующим сочетанием виски, амаретто и клюквенного сока. Этот напиток сочетает в себе теплые и фруктовые ноты, создавая ароматный и бодрящий вкус. Попробуйте \"Флоридского омара\" для того, чтобы вдохновиться вкусом и ощутить нотки солнечного южного штата.', 'Floridskij-omar-05-29'),
(8, 'Виски с яблочным соком', 'Коктейль \"Виски с яблочным соком\" - освежающее сочетание карамельно-пряного вкуса виски с сладким и кислым фруктовым оттенком яблочного сока. Этот напиток идеально подходит для тех, кто предпочитает более легкие и фруктовые вкусы, при этом не теряя яркости и аромата виски. Сладость сока отлично сбалансирована с достаточным количеством алкоголя, что делает этот коктейль популярным выбором для летнего времяпровождения или вечерних посиделок.', 'Viski---yabloko-05-29'),
(9, 'Алгонкин', 'Коктейль \"Алгонкин\" - освежающий микс из виски, лимонного сока, сахарного сиропа и тоника. Приятно газированный и довольно крепкий напиток с кисло-сладким вкусом и нотками цитруса.', 'Algonkin-05-29'),
(10, 'Бора-Бора', 'Коктейль \"Бора-Бора\" сочетает в себе идеальное сочетание благородного виски с экзотическим ананасовым соком и свежим лаймом. Ароматный, освежающий и богатый вкус этого коктейля прекрасно подойдет для любителей сочетения сладкого и кислого, а также для тех, кто ценит классические виски-коктейли с неповторимым тропическим шармом.', 'Bora-Bora-05-29'),
(11, 'Ирландский кофе', '\"Ирландский кофе\" - это теплый и уютный коктейль, состоящий из горячего кофе, ирландского виски, сахара и взбитых сливок. В его составе сочетаются терпкие нотки кофе с плавным вкусом виски, а взбитые сливки придают ему нежный и кремовый оттенок. Напиток идеально подходит для уютных вечеров и холодных дней, создавая атмосферу комфорта и расслабления.', 'Irlandskij-kofe-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_wine`
--

CREATE TABLE `recipe_wine` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `recipe_wine`
--

INSERT INTO `recipe_wine` (`id`, `name`, `desc`, `link`) VALUES
(1, 'Глинтвейн', '\"Глинтвейн\" – это теплый напиток, который обычно готовится на основе красного вина, в которое добавляют специи (корицу, гвоздику, перчик, апельсиновую цедру) и сахар. Подогревается на плите, но не доводится до кипения. Глинтвейн – это популярный напиток на зимний период, который отлично согревает в холодные дни и создает уютную атмосферу.', 'Glintvejn-05-29'),
(2, 'Калимочо', '\"Калимочо\" - это популярный испанский коктейль, который состоит из красного вина и колы. Этот освежающий напиток сочетает в себе сладость вина с газировкой колой, что придает ему неповторимый вкус и аромат. Готовится очень просто, но ярко выражает средиземноморский дух и отлично подходит для веселой компании или тематической вечеринки.', 'Kalimocho-05-30');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `age_confirmed`
--
ALTER TABLE `age_confirmed`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `existing_recipes`
--
ALTER TABLE `existing_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `own_recipes`
--
ALTER TABLE `own_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_absinthe`
--
ALTER TABLE `recipe_absinthe`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_beer`
--
ALTER TABLE `recipe_beer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_champagne`
--
ALTER TABLE `recipe_champagne`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_cognac`
--
ALTER TABLE `recipe_cognac`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_gin`
--
ALTER TABLE `recipe_gin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_multi`
--
ALTER TABLE `recipe_multi`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_rum`
--
ALTER TABLE `recipe_rum`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_tequila`
--
ALTER TABLE `recipe_tequila`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_vermouth`
--
ALTER TABLE `recipe_vermouth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_vodka`
--
ALTER TABLE `recipe_vodka`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_whiskey`
--
ALTER TABLE `recipe_whiskey`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe_wine`
--
ALTER TABLE `recipe_wine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `existing_recipes`
--
ALTER TABLE `existing_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `own_recipes`
--
ALTER TABLE `own_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `recipe_absinthe`
--
ALTER TABLE `recipe_absinthe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `recipe_beer`
--
ALTER TABLE `recipe_beer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `recipe_champagne`
--
ALTER TABLE `recipe_champagne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `recipe_cognac`
--
ALTER TABLE `recipe_cognac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `recipe_gin`
--
ALTER TABLE `recipe_gin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `recipe_multi`
--
ALTER TABLE `recipe_multi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `recipe_rum`
--
ALTER TABLE `recipe_rum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `recipe_tequila`
--
ALTER TABLE `recipe_tequila`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `recipe_vermouth`
--
ALTER TABLE `recipe_vermouth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `recipe_vodka`
--
ALTER TABLE `recipe_vodka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `recipe_whiskey`
--
ALTER TABLE `recipe_whiskey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `recipe_wine`
--
ALTER TABLE `recipe_wine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
