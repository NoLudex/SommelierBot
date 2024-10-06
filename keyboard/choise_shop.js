import { btnStrings } from "../other/btnStrings.js"

// Кнопки при старте приложения/главная
export function keyboard_shop() {
    return {
        reply_markup: {
            inline_keyboard: [
                [{text: btnStrings.absinthe, callback_data: 'shop_absinthe'}, {text: btnStrings.cognac, callback_data: 'shop_cognac'}],
                [{text: btnStrings.gin, callback_data: 'shop_gin'}, {text: btnStrings.rum, callback_data: 'shop_rum'}],
                [{text: btnStrings.tequila, callback_data: 'shop_tequila'}, {text: btnStrings.vermouth, callback_data: 'shop_vermouth'}],
                [{text: btnStrings.vodka, callback_data: 'shop_vodka'}, {text: btnStrings.whiskey, callback_data: 'shop_whiskey'}],
                [{text: btnStrings.wine, callback_data: 'shop_wine'}, {text: btnStrings.champagne, callback_data: 'shop_champagne'}],
                [{text: btnStrings.beer, callback_data: 'shop_beer'}, {text: btnStrings.cocktail, callback_data: 'shop_cocktail'}],
                [{text: btnStrings.liquor, callback_data: 'shop_liquor'}, {text: btnStrings.sake, callback_data: 'shop_sake'}],
                [{text: btnStrings.search, callback_data: 'shop_search'}],
                [{text: btnStrings.assortmentReload, callback_data: 'shop_reload'}],
                [{text: btnStrings.backToMain, callback_data: 'backToMain'}]
            ]
        }
    }
};