import { btnStrings } from '../other/btnStrings.js'

// Кнопки при старте приложения/главная
export function keyboard_start(username) {
    return {
        reply_markup: {
            inline_keyboard: [
                [{text: btnStrings.recipes, callback_data: 'recipes'}],
                [{text: "🕑 Формы", callback_data: 'form_main'}],
                [{text: btnStrings.creators, callback_data: 'creators'}]
            ]
        }
    }
};