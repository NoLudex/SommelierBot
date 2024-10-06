import chalk from 'chalk'
import TelegramApi from 'node-telegram-bot-api'
import { token, admins, connection, onlyAdmin } from './other/config.js'
import { strings } from './other/strings.js'
import { btnStrings } from './other/btnStrings.js'
import { getMaxId } from './database/getMaxId.js'
import { commands } from './other/commands.js'
import { getRecipe } from './database/getRecipe.js'
import { keyboard_about } from './keyboard/about.js'
import { keyboard_choice } from './keyboard/choice.js'
import { keyboard_start } from './keyboard/start.js'
import { keyboard_switch } from './keyboard/switch.js'
import { addMessage } from './database/addMessage.js'
import { deleteMessage } from './database/deleteMessage.js'
import { getPage } from './database/getPage.js'
import { updatePage } from './database/updatePage.js'
import { keyboard_shop } from './keyboard/choise_shop.js'
import { isUserVerified } from './database/isUserVerified.js'
import { keyboard_confirm } from './keyboard/confirm.js'
import { confirmAge } from './database/confirmAge.js'
import { keyboard_form } from './keyboard/form.js'
import { getUserRecipes, getRecipeDetails, deletePendingRecipe } from './database/forms.js'

const bot = new TelegramApi(token, {polling: true})

function start() {
    // Регистрация команд
    bot.setMyCommands(commands)

    // Обработчик событий кнопок
    bot.on('callback_query', async msg => {
        // Получаем данные
        const chatId = msg.message.chat.id;
        const messageId = msg.message.message_id;
        const username = msg.from.username;
        const userId = msg.from.id;
        let callback = msg.data; // может менять, т.к есть подтверждение возраста

        // console.log(msg)

        // // Ограничить доступ
        // if (!admins.includes(userId) && onlyAdmin) {   
        //     console.log(strings.consoleLogActionFromUser + ": " + username)
        //     return await bot.sendMessage(chatId, "— " + strings.answerForDenyAction)
        // }

        // // Проверка возраста
        // const userVerified = await isUserVerified(userId);
        // if (!userVerified && callback != 'confirm') {
        //     await bot.deleteMessage(chatId, messageId);
        //     return await bot.sendPhoto(chatId, './images/VerifyButton.png', {
        //         caption: strings.ageVerify,
        //         ... keyboard_confirm()});
        // } else if (!userVerified && callback == 'confirm') {
        //     await confirmAge(userId, username); // Добавляем пользователя как подтвержденного
        //     callback = 'backToMain'; // Вызываем меню, будто вышли из второстепенной владки
        // }

        // Откладка полученных событий
        console.log(chalk.blueBright(`[@${username} (${userId})]`) + " " + strings.userPressBtn + " '" + chalk.greenBright(callback) + "' " + chalk.black(`(${chatId})`))
        
        // Разделяем команду и аргументы по пробелам
        const args = callback.split('_');
        // Первая часть - это команда
        const callbackName = args[0];
        // Остальные части - это аргументы комманды
        const callbackArgs = args.slice(1);

        // Обработчик ошибок
        try {
            switch(callbackName)
            {
                case "view":
                    if (args[1] == "recipes") {
                        await bot.deleteMessage(chatId, messageId);
                        await handleRecipesCommand(chatId, username);
                        break;
                    } else if (args[1] = "details") {
                        await bot.deleteMessage(chatId, messageId);
                        await handleDetailsCommand(chatId, username, args[2]);
                        break;
                    } else if (args[1] = "recipe") {
                        await bot.deleteMessage(chatId, messageId);
                        await handleDeleteCommand(chatId, username, args[2]);
                        break;
                    }
                case "form":
                    if (args[1] == "main") {
                        await bot.deleteMessage(chatId, messageId)
                        return await bot.sendPhoto(chatId, './images/List.png', {... keyboard_form(admins.includes(userId), username)});
                    }
                    break;
                case "confirm":
                    return await bot.deleteMessage(chatId, messageId)
                case "assortment":
                    await bot.deleteMessage(chatId, messageId)
                    return await bot.sendPhoto(chatId, './images/List.png', {
                        caption: strings.assortiment,
                        ... keyboard_shop()});
                case "creators":
                    await bot.deleteMessage(chatId, messageId)
                    return await bot.sendPhoto(chatId, './images/Creators.png', {
                        caption: strings.info,
                        ... keyboard_about()});
                case "backToMain":
                    await bot.deleteMessage(chatId, messageId)
                    return await bot.sendPhoto(chatId, './images/Welcome.png', {
                        caption: strings.welcome,
                        ... keyboard_start(msg.from.username)});
                case "recipes":
                    await bot.deleteMessage(chatId, messageId)
                    return await bot.sendPhoto(chatId, './images/Recipes.png', {
                        caption: strings.recipes,
                        ... keyboard_choice()});
                case "backToChoice":
                    await bot.deleteMessage(chatId, messageId - 1)
                    await bot.deleteMessage(chatId, messageId)
                    deleteMessage(chatId, messageId)
                    return await bot.sendPhoto(chatId, './images/Recipes.png', {
                        caption: strings.recipes,
                        ... keyboard_choice()});
                case "page":
                    let pageNow = await getPage(chatId, messageId);
                    const pageMax = await getMaxId('recipe_' + args[1])

                    if (args[2] == "Next") {
                        if (pageNow == pageMax) {
                            updatePage(chatId, messageId, 1)
                            pageNow = 1
                        } else if (pageNow < pageMax) {
                            updatePage(chatId, messageId, pageNow + 1)
                            pageNow = pageNow + 1
                        } else {
                            return await bot.sendMessage(strings.errorPage + " [Next]")
                        }
                    } else if (args[2] == "Back") {
                        if (pageNow == 1) {
                            updatePage(chatId, messageId, pageMax)
                            pageNow = pageMax
                        } else if (pageNow <= pageMax) {
                            updatePage(chatId, messageId, pageNow - 1)
                            pageNow = pageNow - 1
                        } else {
                            return await bot.sendMessage(strings.errorPage + " [Back]")
                        }
                    } else {
                        return await bot.sendMessage(strings.errorPage + " [OtherBtn]")
                    }

                    const newRecipe = await getRecipe(args[1], pageNow - 1)


                    return await bot.editMessageText(`${newRecipe.name} ( ${pageNow}/${pageMax} ) \n\nОписание: ${newRecipe.desc}\n\nСтатья с рецептом: https://telegra.ph/${newRecipe.link}`, {chat_id: chatId, message_id: messageId, ... keyboard_switch(args[1], pageNow, pageMax)})
                case "shop":
                    const shop_images = {
                        absinthe: { path: './images/Absinthe.png', caption: strings.absinthe },
                        cognac: { path: './images/Cognac.png', caption: strings.cognac },
                        gin: { path: './images/Gin.png', caption: strings.gin },
                        rum: { path: './images/Rum.png', caption: strings.rum },
                        tequila: { path: './images/Tequila.png', caption: strings.tequila },
                        vermouth: { path: './images/Vermouth.png', caption: strings.vermouth },
                        vodka: { path: './images/Vodka.png', caption: strings.vodka },
                        whiskey: { path: './images/Whiskey.png', caption: strings.whiskey },
                        wine: { path: './images/Wine.png', caption: strings.wine },
                        champagne: { path: './images/Champagne.png', caption: strings.champagne },
                        beer: { path: './images/Beer.png', caption: strings.beer },
                        cocktail: { path: './images/Cocktail.png', caption: strings.cocktail },
                        liquor: { path: './images/Liquor.png', caption: strings.liquor },
                        sake: { path: './images/Sake.png', caption: strings.sake }
                    };

                    // Отправка главного сообщения
                    const shop_category = args[1];
                    if (shop_images[shop_category]) {
                        // await bot.deleteMessage(chatId, messageId)
                        await bot.sendPhoto(chatId, shop_images[shop_category].path, { caption: shop_images[shop_category].caption });
                    } else {
                        return await bot.sendMessage(chatId, `На данный момент категория ${shop_category} недоступна!`);
                    }

                    return
                case "choice":
                    // Параметры для категорий
                    const choice_images = {
                        absinthe: { path: './images/Absinthe.png', caption: strings.absinthe },
                        cognac: { path: './images/Cognac.png', caption: strings.cognac },
                        gin: { path: './images/Gin.png', caption: strings.gin },
                        rum: { path: './images/Rum.png', caption: strings.rum },
                        tequila: { path: './images/Tequila.png', caption: strings.tequila },
                        vermouth: { path: './images/Vermouth.png', caption: strings.vermouth },
                        vodka: { path: './images/Vodka.png', caption: strings.vodka },
                        whiskey: { path: './images/Whiskey.png', caption: strings.whiskey },
                        wine: { path: './images/Wine.png', caption: strings.wine },
                        champagne: { path: './images/Champagne.png', caption: strings.champagne },
                        beer: { path: './images/Beer.png', caption: strings.beer },
                        multi: { path: './images/Multi.png', caption: strings.multi }
                    };

                    // Отправка главного сообщения
                    const choice_category = args[1];
                    if (choice_images[choice_category]) {
                        await bot.deleteMessage(chatId, messageId)
                        await bot.sendPhoto(chatId, choice_images[choice_category].path, { caption: choice_images[choice_category].caption });
                    } else {
                        return await bot.sendMessage(chatId, `На данный момент категория ${category} недоступна!`);
                    }
                    
                    // Отправка первого рецепта
                    const recipe = await getRecipe(args[1], 0)
                    const maxPage = await getMaxId('recipe_' + args[1])
                    await bot.sendMessage(chatId, `${recipe.name} ( 1/${maxPage} ) \n\nОписание: ${recipe.desc}\n\nСтатья с рецептом: https://telegra.ph/${recipe.link}`, {
                        ...keyboard_switch(args[1], 1, maxPage)}).then((message) => {
                            addMessage(chatId, message.message_id, userId, 1, args[1])
                        })
                    return;
                default:
                    return await bot.sendMessage(chatId, `На данный момент кнопка ${callback} не работает!`)
            }
        } catch (err) {
            console.error('Ошибка: ', err)
        }
    })

    // Обработчик сообщений
    bot.on('message', async msg => {
        // Получаем данные
        const text = msg.text;
        const chatId = msg.chat.id;
        const username = msg.from.username;
        const userId = msg.from.id;

        // // Ограничить доступ
        // if (!admins.includes(userId) && onlyAdmin)
        // {
        //     console.log(strings.consoleLogMessageFromUser + ': ' + username)
        //     return await bot.sendMessage(chatId, "— " + strings.answerForDenyAction)
        // }

        // // Проверка возраста
        // const userVerified = await isUserVerified(userId);
        // console.log(userVerified)
        // if (!userVerified) {
        //     return await bot.sendPhoto(chatId, './images/VerifyButton.png', {
        //         caption: strings.ageVerify,
        //         ... keyboard_confirm()})
        // }

        // Проверяем, сообщение является командой или нет
        if (text == undefined) 
            return;
        if (text.startsWith('/'))
        {
            // Разделяем команду и аргументы по пробелам
            const args = text.slice(1).split(' ');
            // Первая часть - это команда
            const commandName = args[0];
            // Остальные части - это аргументы комманды
            const commandArgs = args.slice(1);

            // Обрабатываем команду
            switch (commandName) {
                case "test":
                    await bot.sendMessage(chatId, "Пример приложения", {
                        reply_markup: {
                            inline_keyboard: [
                                [{text: 'Открыть сайт', web_app: {url: 'https://lambent-kataifi-ea2d5b.netlify.app/' + 'form'}}]
                            ]
                        }
                    })
                    break;
                case "form":
                    await bot.sendPhoto(chatId, './images/List.png', {
                        caption: 'Какой-то текст',
                        ... keyboard_form(admins.includes(userId), username)});
                        break;
                case "del":
                    await bot.sendMessage(chatId, 'Кнопки удалены', {
                        reply_markup: {
                            remove_keyboard: true
                        }
                    })
                    break;
                
                case "web":
                    await bot.sendMessage(chatId, 'Ссылка на анкету', {
                        reply_markup: {
                            inline_keyboard: [
                                [{text: 'Открыть сайт', web_app: {url: 'https://docs.google.com/forms/d/e/1FAIpQLSeoVWHfB2JansdQVeHRmabjrJMOA41CX-6qAiBI27gxj8cOWg/viewform'}}]
                            ]
                        }
                    })
                    break;
                    
                case "assortment":
                    await bot.sendPhoto(chatId, './images/List.png', {
                        caption: strings.assortiment,
                        ... keyboard_shop()});
                    break;
                case 'start':
                    await bot.sendPhoto(chatId, './images/Welcome.png', {
                        caption: strings.welcome,
                        ... keyboard_start(msg.from.username)});
                    break;
                case 'info':
                    await bot.sendPhoto(chatId, './images/Creators.png', {
                        caption: strings.info,
                        ... keyboard_about()});
                    break;
                case 'recipes':
                    await bot.sendPhoto(chatId, './images/Recipes.png', {
                        caption: strings.recipes,
                        ... keyboard_choice()});
                    break;
                case 'viewRecipes':
                    await handleRecipesCommand(chatId, username);
                    break;
                case 'viewDetails':
                    await handleDetailsCommand(chatId, username, commandArgs[0]);
                    break;
                case 'deleteRecipe':
                    await handleDeleteCommand(chatId, username, commandArgs[0]);
                    break;
                default:
                    console.log(chalk.blueBright(`[@${username} (${userId})] `) + strings.userSendCMD + " /" + chalk.redBright(commandName + " " + commandArgs) + chalk.black(` (${chatId})`))
                    await bot.sendMessage(chatId, strings.unknownCmd)
                    return await bot.sendSticker(chatId, strings.unknownActionStickerID)
            }

            return console.log(chalk.blueBright(`[@${username} (${userId})] `) + strings.userSendCMD + " /" + chalk.greenBright(commandName) + chalk.black(` (${chatId})`))
        }
        else
        {
            // Логи сообщений
            await bot.sendMessage(chatId, strings.unknownMsg)
            await bot.sendSticker(chatId, strings.unknownActionStickerID)
            return console.log(chalk.blueBright(`[@${username} (${userId})] `) + strings.userSendMsg + " " + chalk.redBright(text) + chalk.black(` (${chatId})`))
        }
    })

    console.log(chalk.blueBright('[Telegram]') + " -------------- Ок")
}

async function handleRecipesCommand(chatId, username) {
    try {
        const recipes = await getUserRecipes(username);

        if (recipes.length === 0) {
            return await bot.sendMessage(chatId, "У вас нет сохраненных рецептов.");
        }

        const recipeList = recipes.map((recipe, index) => `${index + 1}. ${recipe.name}`).join("\n");
        await bot.sendMessage(chatId, `Ваши рецепты:\n${recipeList}`, {
            reply_markup: {
                inline_keyboard: recipes.map((recipe, index) => [{
                    text: `Подробнее о рецепте ${index + 1}`,
                    callback_data: `view_details_${recipe.id}`
                }])
            }
        });
    } catch (err) {
        console.error('Ошибка: ', err);
        await bot.sendMessage(chatId, "Произошла ошибка при получении рецептов.");
    }
}

async function handleDetailsCommand(chatId, username, recipeId) {
    try {
        const recipe = await getRecipeById(recipeId);

        if (!recipe) {
            return await bot.sendMessage(chatId, "Рецепт не найден.");
        }

        await bot.sendMessage(chatId, `Детали рецепта:\n\nНазвание: ${recipe.name}\nОписание: ${recipe.description}\nСсылка: ${recipe.link}`, {
            reply_markup: {
                inline_keyboard: [
                    [{ text: "Удалить рецепт", callback_data: `delete_recipe_${recipeId}` }]
                ]
            }
        });
    } catch (err) {
        console.error('Ошибка: ', err);
        await bot.sendMessage(chatId, "Произошла ошибка при получении деталей рецепта.");
    }
}

async function handleDeleteCommand(chatId, username, recipeId) {
    try {
        const success = await deleteRecipe(recipeId);

        if (success) {
            await bot.sendMessage(chatId, "Рецепт успешно удален.");
        } else {
            await bot.sendMessage(chatId, "Не удалось удалить рецепт.");
        }
    } catch (err) {
        console.error('Ошибка: ', err);
        await bot.sendMessage(chatId, "Произошла ошибка при удалении рецепта.");
    }
}

try {
    // Запуск бота
    start()
    // Включаем БД после запуска бота
    connection.connect(err => {
        if (err) {
            console.log(err)
        } else {
            console.log(chalk.blueBright('[MySQL]') + " ----------------- Ок")
        }
    })
} catch (err) { // При ошибке:
    // Выключаем подключение к бд
    connection.end();
    console.log(chalk.blueBright('[MySQL]') + " Подключение закрыто")
    // Выводим ошибку
    console.error('Ошибка: ', err)
}

// connection.end()