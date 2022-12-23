import { connection } from "../database/database.js";

export async function getRanking(req, res) {
  try {
    const ranking = await connection.query(`
    SELECT
      users.id,
      users.name,
      (
        SELECT
          CAST(COUNT(urls."userId") AS INTEGER)
        FROM
          urls
        WHERE
          urls."userId" = users.id
      ) AS "linksCount",
      CAST(COUNT("visitedUrls"."urlId") AS INTEGER) AS "visitCount"
    FROM
      users
      LEFT JOIN urls ON users.id = urls."userId"
      LEFT JOIN "visitedUrls" ON urls.id = "visitedUrls"."urlId"
    GROUP BY
      users.id
    ORDER BY
      "visitCount"DESC , "linksCount" DESC
    LIMIT
      10
  
        `);
    res.status(200).send(ranking.rows);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}
