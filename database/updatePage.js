import { connection } from "../other/config.js";

// Обновляет значение страницы
export function updatePage(chat_id, message_id, newPage) {
    return new Promise((resolve, reject) => {
        const query = 'UPDATE messages SET page = ? WHERE message_id = ? AND chat_id = ?';
        connection.query(query, [newPage, message_id, chat_id], (error, results) => {
            if (error) {
                return reject(error);
            }
            resolve(results);
        });
    });
}
