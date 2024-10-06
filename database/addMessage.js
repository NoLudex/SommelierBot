import { connection } from "../other/config.js";

// Добавить сообщение, которое содержит кнопки для просмотра рецептов
export function addMessage(chat_id, message_id, user_id, page, type) {
    return new Promise((resolve, reject) => {
        const query = 'INSERT INTO messages (message_id, chat_id, user_id, page, type) VALUES (?, ?, ?, ?, ?)';
        connection.query(query, [message_id, chat_id, user_id, page, type],(error, results) => {
            if (error) {
                return reject(error);
            }
            resolve(results);
        });
    });
}