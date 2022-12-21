import { connection } from "../database/database.js";
import { nanoid } from "nanoid";

export async function shortenUrl(req,res){
    const {url} = req.body
    const shortenUrl = nanoid(8)
    const userId = req.userId

    try {
        await connection.query(`
            INSERT INTO urls ("shortUrl",url,"userId")
            VALUES ($1,$2,$3);
        `,[shortenUrl,url,userId])

        return res.status(201).send({shortUrl:`${shortenUrl}`})
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function getUrlById(req,res){
    const url = req.url
    try {
        res.status(200).send(url)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function openUrl(req,res){
    const {id, url} = req.url

    await connection.query(`
        INSERT INTO "visitedUrls" ("urlId", "visitDate")
        VALUES ($1,now())
    `,[id])

    res.redirect(url)

    try {
        
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}