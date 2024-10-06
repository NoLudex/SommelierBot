import { btnStrings } from '../other/btnStrings.js'

// Кнопки во вкладке - создатели
export function keyboard_confirm() {
    return {
        reply_markup: {
            inline_keyboard: [
                    [{text: btnStrings.confirm, callback_data: 'confirm'}]
                ]
        }
    }
};