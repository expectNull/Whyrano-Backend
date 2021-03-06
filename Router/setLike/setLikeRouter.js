var express = require("express");
var router = express.Router();
const updateLike = require("./updateLike");
const { logger } = require("../../Log/DefLogger");
const { getUserId } = require("../getUserId");
const { send } = require("../../sendEmail/sending");

router.post("/", async (req, res) => {
  const ip = req.headers["x-forwarded-for"] || req.connection.remoteAddress;

  try {
    const info = req.body;

    logger.info(`------setLike---start-- : ${ip}`);
    info.user_id = await getUserId(info.token);

    if (info.token === undefined) {
      logger.info(`------setLike---not login-- : ${ip}`);
      res.json({ err: "need login" });
      res.end();
      return;
    }

    updateLike(info.post_id, info.user_id, info.value);
  } catch (e) {
    logger.error(`------setLike---error-- : ${ip}\n ${e}`);
    send("hyunsoo99kim@gmail.com", `[Err : Whyrano] setLike error`, "");
    send("qudgnl0422@naver.com", `[Err : Whyrano] setLike error`, "");
    send("shinhyoung26@gmail.com", `[Err : Whyrano] setLike error`, "");
  } finally {
    res.end();
    logger.info(`------setLike---end-- : ${ip}`);
    return;
  }
});

module.exports = router;
