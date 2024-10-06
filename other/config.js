import mysql from 'mysql';

// Токен для бота из FatherBot
export const token = 'TELEGRAM-TOKEN';

// ID администраторов
export const admins = [
    1913008131,
    1863964682
]

// Бот обрабатывает запросы только администрации
export const onlyAdmin = false;

export const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "helpMePls",
    password: "111"
});