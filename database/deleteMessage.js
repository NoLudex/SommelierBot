import { connection } from "../other/config.js";

// Удалить сообщения из базы данных, которое содержит кнопки
export function deleteMessage(chat_id, message_id) {
    return new Promise((resolve, reject) => {
        const query = 'DELETE FROM messages WHERE message_id = ? AND chat_id = ?';
        connection.query(query, [message_id, chat_id], (error, results) => {
            if (error) {
                return reject(error);
            }
            resolve(results);
        });
    });
}