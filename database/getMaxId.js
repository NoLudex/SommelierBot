import { connection } from "../other/config.js";

// Получить максимального ID, при наличии строки в таблице ID
export async function getMaxId(table) {
    const query = `SELECT COUNT(*) AS count FROM ${table}`;
    
    return new Promise((resolve, reject) => {
        connection.query(query, (err, sqlResult) => {
            if (err) {
                reject(err);
            } else {
                resolve(sqlResult[0].count);
            }
        });
    });
}