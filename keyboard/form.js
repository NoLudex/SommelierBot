import { btnStrings } from '../other/btnStrings.js'

// Кнопки во вкладке - создатели
export function keyboard_form(isAdmin = false, username = "Гость") {
    if (isAdmin) {
        return {
            reply_markup: {
                inline_keyboard: [
                    [{text: "⚙️ Админ-панель", url: 'http://a0994407.xsph.ru/panel/own-recipe.php'}],
                    [{text: "📄 Наша форма", url: 'http://a0994407.xsph.ru/select-form.php?username=' + username}],
                    [{text: btnStrings.openForm, web_app: {url: 'https://docs.google.com/forms/d/e/1FAIpQLSeoVWHfB2JansdQVeHRmabjrJMOA41CX-6qAiBI27gxj8cOWg/viewform'}}],
                    [{text: btnStrings.backToMain, callback_data: 'backToMain'}]
                ]
            }
        }
    }
    return {
        reply_markup: {
            inline_keyboard: [
                [{text: "📄 Наша форма", url: 'http://a0994407.xsph.ru/select-form.php?username=' + username}],
                [{text: btnStrings.openForm, web_app: {url: 'https://docs.google.com/forms/d/e/1FAIpQLSeoVWHfB2JansdQVeHRmabjrJMOA41CX-6qAiBI27gxj8cOWg/viewform'}}],
                [{text: btnStrings.backToMain, callback_data: 'backToMain'}]
            ]
        }
    }
};