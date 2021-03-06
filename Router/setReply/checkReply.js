const pool = require("../../database/database");
const { getUserId } = require("../getUserId");

async function checkReply(info) {
  var sql = `SELECT * 
  FROM POST_TB join USER_TB on POST_TB.USER_ID = USER_TB.USER_ID
  WHERE type_gb = 1 and USER_TB.USER_ID = ? and PARENT_POST_ID = ?;`;
  info.user_id = await getUserId(info.user_token);
  let params = [info.user_id, info.parent_post_id];

  let connection = await pool.getConnection(async conn => conn);
  let [rows, col] = await connection.query(sql, params);

  connection.release();

  return rows.length;
}

module.exports = checkReply;
