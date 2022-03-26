const pool = require("../../database/database");

async function getItem(item) {
  let ret = {
    user_ranking: item.RANKING,
    user_nm: item.USER_NICK_NM,
    user_state: item.NULLPOINT_AMT,
    user_point: item.STATUS_CONTENT,
    user_reply: item.ANSWER,
    user_ask: item.QUESTION,
  };
  return ret;
}

async function getRanking() {
  var sql1 = `SET @ROWNUM := 0;`;
  var sql2 = `
  SELECT (@ROWNUM := @ROWNUM + 1) as RANKING, USER_ID, USER_NICK_NM, NULLPOINT_AMT, STATUS_CONTENT, 
	(select count(*) from POST_TB where user_id = USER_TB.user_id and type_gb = 0) as QUESTION,
  (select count(*) from POST_TB where user_id = USER_TB.user_id and type_gb = 1) as ANSWER
	FROM NULLLEDGE.USER_TB
  order by NULLPOINT_AMT DESC;`;

  let ret = [];

  let connection = await pool.getConnection(async conn => conn);
  await connection.query(sql1);
  let [rows, col] = await connection.query(sql2);

  for (let i = 0; i < rows.length; i++) {
    ret.push(getItem(rows[i]));
  }

  console.log(ret);
  connection.release();

  return rows;
}

module.exports = { getRanking };
