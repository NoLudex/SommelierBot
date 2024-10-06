import { btnStrings } from "./btnStrings.js"

// Инициализация меню команд
export const commands = [
    { command: '/start', description: btnStrings.restartBot },
    { command: '/recipes', description: btnStrings.openRecipes },
    { command: '/form', description: btnStrings.openFormDesc },
    { command: '/info', description: btnStrings.openInfoBotCreators },
]