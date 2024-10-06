import { connection } from "../other/config.js";

// Метод для проверки, существует ли пользователь в базе данных
export async function isUserVerified(userId) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM age_confirmed WHERE user_id = ?';
        connection.query(query, [userId], (error, results) => {
            if (error) {
                return reject(error);
            }
            // console.log(results[0]['user_id'] == userId)
            // console.log(results.length > 0)
            // console.log(results)
            resolve(results.length > 0);
        })
    })
}