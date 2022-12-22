import { connection } from "../database/database.js";

export async function authValidation(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }

  const session = await connection.query(
    `
        SELECT *
        FROM sessions
        WHERE token = ($1)
    `,
    [token]
  );

  if (session.rows.length === 0) {
    return res.sendStatus(401);
  }

  req.userId = session.rows[0].userId;

  next();
}
