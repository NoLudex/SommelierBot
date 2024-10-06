import { connection } from "../other/config.js";
import { isUserVerified } from "./isUserVerified.js";

// Метод для добавления нового пользователя в базу данных как подтверждённого
export async function confirmAge(userId, username) {
    return new Promise((resolve, reject) => {
        const query = 'INSERT INTO age_confirmed (user_id, username) VALUES (?, ?)';
        connection.query(query, [userId, username], (error, results) => {
            if (error) {
                return reject(error)
            }
            resolve(results);
        })
    })
}