import { btnStrings } from '../other/btnStrings.js'

// Кнопки выбора категории рецепта
export function keyboard_choice() {
    return {
        reply_markup: {
            inline_keyboard: [
                [{text: btnStrings.absinthe, callback_data: 'choice_absinthe'}, {text: btnStrings.cognac, callback_data: 'choice_cognac'}],
                [{text: btnStrings.gin, callback_data: 'choice_gin'}, {text: btnStrings.rum, callback_data: 'choice_rum'}],
                [{text: btnStrings.tequila, callback_data: 'choice_tequila'}, {text: btnStrings.vermouth, callback_data: 'choice_vermouth'}],
                [{text: btnStrings.vodka, callback_data: 'choice_vodka'}, {text: btnStrings.whiskey, callback_data: 'choice_whiskey'}],
                [{text: btnStrings.wine, callback_data: 'choice_wine'}, {text: btnStrings.champagne, callback_data: 'choice_champagne'}],
                [{text: btnStrings.beer, callback_data: 'choice_beer'}, {text: btnStrings.multi, callback_data: 'choice_multi'}],
                
                [{text: btnStrings.backToMain, callback_data: 'backToMain'}]
            ]
        }
    }
}