const pool = require("../../database/database");
const getProblemId = require("../setReply/getProblemId");

const getUserId = require("../getUserId");
// setReply와 동일한 함수.
async function setComment(info) {
  // var ProId = await getProblemId(info.parent_post_id);
  var ProId = 0;
  var sql = `INSERT INTO POST_TB(PROBLEM_ID, USER_ID, TYPE_GB, POST_YMD, CONTENT, PARENT_POST_ID, CHECK_GB) 
  VALUES(?, ?, ?, ?, ?, ?, ?);`;
  info.user_id = await getUserId(info.user_token);
  let params = [
    ProId,
    info.user_id,
    info.type_gb,
    new Date().toISOString().split(".")[0],
    info.comment,
    info.parent_post_id,
    2,
  ];

  let connection = await pool.getConnection(async conn => conn);
  await connection.query(sql, params);

  connection.release();
}

module.exports = setComment;
