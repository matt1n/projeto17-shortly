import { connection } from "../database/database.js";
import { nanoid } from "nanoid";

export async function shortenUrl(req, res) {
  const { url } = req.body;
  const shortenUrl = nanoid(8);
  const userId = req.userId;

  try {
    await connection.query(
      `
            INSERT INTO urls ("shortUrl",url,"userId")
            VALUES ($1,$2,$3);
        `,
      [shortenUrl, url, userId]
    );

    return res.status(201).send({ shortUrl: `${shortenUrl}` });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function getUrlById(req, res) {
  const url = req.url;
  try {
    res.status(200).send(url);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function openUrl(req, res) {
  const { id, url } = req.url;

  await connection.query(
    `
        INSERT INTO "visitedUrls" ("urlId")
        VALUES ($1)
    `,
    [id]
  );

  res.redirect(url);

  try {
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function deleteUrl(req, res) {
  const { id } = req.url;
  try {
    await connection.query(
      `
            DELETE FROM urls
            WHERE id = ($1)
        `,
      [id]
    );
    res.sendStatus(204);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}
