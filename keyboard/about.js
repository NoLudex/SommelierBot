import { btnStrings } from '../other/btnStrings.js'

// Кнопки во вкладке - создатели
export function keyboard_about() {
    return {
        reply_markup: {
            inline_keyboard: [
                    [{text: btnStrings.backToMain, callback_data: 'backToMain'}]
                ]
        }
    }
};