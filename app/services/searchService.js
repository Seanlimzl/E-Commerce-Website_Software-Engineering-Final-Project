import { executeQuery } from "../database/database.js";

const searchItems = async (searchTerm) => {
  const result = await executeQuery(
    `SELECT items.id, items.name, items.price, items.image_link, items.description, categories.name AS category_name 
    FROM items 
    INNER JOIN categories ON items.category_id = categories.id 
    WHERE items.name ILIKE $1;`,
    searchTerm
  );
  return result.rows;
};

export { searchItems };
