import { connection } from "../database/database.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function signUp(req, res) {
  const { name, email, password } = req.body;

  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    await connection.query(
      `
            INSERT INTO users (email,name,password)
            VALUES ($1, $2, $3)
        `,
      [email, name, passwordHash]
    );
    res.sendStatus(201);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function signIn(req, res) {
  const user = req.user;
  const token = uuid();

  try {
    await connection.query(
      `
            INSERT INTO sessions ("userId", token)
            VALUES ($1,$2)
        `,
      [user.id, token]
    );
    res.status(200).send(token);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function getMyUser(req, res) {
  const userId = req.userId;

  try {
    const user = await connection.query(
      `
      SELECT
      users.id,
      users.name,
      CAST(COUNT("visitedUrls"."id") AS INTEGER) AS "visitCount",
      (
        SELECT
          JSON_AGG(s)
        FROM
          (
            SELECT
              urls.id,
              urls."shortUrl",
              urls.url,
              COUNT("visitedUrls"."urlId") AS "visitCount"
            FROM
              urls
              LEFT JOIN "visitedUrls" on urls.id = "visitedUrls"."urlId"
            WHERE
              urls."userId" = users.id
            GROUP BY
              urls.id
          ) s
      ) AS "shortenedUrls"
    FROM
      users
      LEFT JOIN urls on users.id = urls."userId"
      LEFT JOIN "visitedUrls" on urls.id = "visitedUrls"."urlId"
    WHERE
      users.id = ($1)
    GROUP BY
      users.id
        `,
      [userId]
    );
    res.status(200).send(user.rows[0]);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}
