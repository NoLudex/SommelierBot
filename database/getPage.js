import { connection } from "../other/config.js";

// Получить номер рецепта
export async function getPage(chat_id, message_id) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT page FROM messages WHERE message_id = ? AND chat_id = ?';
        connection.query(query, [message_id, chat_id], (error, results) => {
            if (error) {
                return reject(error);
            }
            if (results.length === 0) {
                return reject(new Error('Данное сообщение отсутствует в базе данных'));
            }
            resolve(results[0].page);
        });
    });
}
