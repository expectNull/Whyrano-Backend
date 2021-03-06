const pool = require("../database/database");

async function checkPost(post_id) {
  var sql = `select *
  from POST_TB
  where post_id = ?;`;
  let params = [post_id];

  let connection = await pool.getConnection(async conn => conn);
  let [rows, col] = await connection.query(sql, params);

  connection.release();

  return rows.length;
}

module.exports = checkPost;
