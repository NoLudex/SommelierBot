import { btnStrings } from '../other/btnStrings.js'

// Кнопки переключение рецептов
export function keyboard_switch(type, page, maxPage) {
    if (maxPage == 1) { // Один вариант рецепта
        return {
            reply_markup: {
                inline_keyboard: [
                    [{text: btnStrings.backToChoice, callback_data: 'backToChoice'}]
                ]
            }
        }
    } else if (page == 1) {
        return {
            reply_markup: {
                inline_keyboard: [
                    [{text: btnStrings.backPage + " " + btnStrings.backPageToFirst, callback_data: `page_${type}_Back`}, {text: btnStrings.nextPage, callback_data: `page_${type}_Next`}],
                    [{text: btnStrings.backToChoice, callback_data: 'backToChoice'}]
                ]
            } // К примеру callback_data кнопок перехода - `reviewsLast 123123132` / `reviewsNext 1237129`
        }
    } else if (page == maxPage) {
        return {
            reply_markup: {
                inline_keyboard: [
                    [{text: btnStrings.backPage, callback_data: `page_${type}_Back`}, {text: btnStrings.nextPage + " " + btnStrings.nextPageToLast, callback_data: `page_${type}_Next`}],
                    [{text: btnStrings.backToChoice, callback_data: 'backToChoice'}]
                ]
            }
        }
    } else { // В промежуточных
        return {
            reply_markup: {
                inline_keyboard: [
                    [{text: btnStrings.backPage, callback_data: `page_${type}_Back`}, {text: btnStrings.nextPage, callback_data: `page_${type}_Next`}],
                    [{text: btnStrings.backToChoice, callback_data: 'backToChoice'}]
                ]
            }
        }
    }
};