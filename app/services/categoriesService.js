import { executeQuery } from "../database/database.js";

const createCategory = async (name, userId) => {
  await executeQuery(
    "INSERT INTO categories (name, user_id) VALUES ($1, $2);",
    name,
    userId,
  );
};

const deleteCategory = async (id) => {
  await executeQuery(
    "DELETE FROM categories WHERE id=$1;", // ON DELETE CASCADE active on child tables
    id,
  );
};

const listCategories = async () => {
  const result = await executeQuery(
    "SELECT * FROM categories ORDER BY name ASC;"
  );

  return result.rows;
};

const getCategoryItems = async (categoryId) => {
  const result = await executeQuery(
    "SELECT * FROM items WHERE category_id=$1 ORDER BY name ASC;",
    categoryId,
  );

  return result.rows;
};

const getCategoryNameById = async (categoryId) => {
  const result = await executeQuery(
    "SELECT name FROM categories WHERE id=$1;",
    categoryId
  );

  return result.rows;
};

export { createCategory, deleteCategory, listCategories, getCategoryItems, getCategoryNameById };
