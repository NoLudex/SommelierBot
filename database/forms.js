import { connection } from '../other/config.js';

export function getUserRecipes(username) {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT id, name, status FROM own_recipes
            WHERE username = ?
        `;
        connection.query(query, [username], (err, results) => {
            if (err) return reject(err);

            const statuses = {
                pending: "в ожидании",
                approved: "одобрено",
                rejected: "отклонено",
                deleted: "удалено"
            };

            console.log(username)

            const recipes = results.map(recipe => ({
                id: recipe.id,
                name: recipe.name,
                status: statuses[recipe.status]
            }));

            resolve(recipes);
        });
    });
}

export function getRecipeDetails(username, recipeId) {
    return new Promise((resolve, reject) => {
        const query = `
            SELECT * FROM own_recipes
            WHERE username = ? AND id = ?
        `;
        connection.query(query, [username, recipeId], (err, results) => {
            if (err) return reject(err);

            if (results.length === 0) {
                return reject(new Error("Рецепт не найден"));
            }

            const recipe = results[0];
            const statuses = {
                pending: "в ожидании",
                approved: "одобрено",
                rejected: "отклонено",
                deleted: "удалено"
            };

            recipe.status = statuses[recipe.status];
            resolve(recipe);
        });
    });
}

export function deletePendingRecipe(username, recipeId) {
    return new Promise((resolve, reject) => {
        const query = `
            UPDATE own_recipes
            SET status = 'deleted'
            WHERE username = ? AND id = ? AND status = 'pending'
        `;
        connection.query(query, [username, recipeId], (err, results) => {
            if (err) return reject(err);

            if (results.affectedRows === 0) {
                return reject(new Error("Рецепт не найден или не имеет статус 'в ожидании'"));
            }

            resolve("Статус рецепта успешно изменён на 'удалено'");
        });
    });
}