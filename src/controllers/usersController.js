import {connection} from "../database/database.js"
import bcrypt from "bcrypt"
import { v4 as uuid } from "uuid";

export async function signUp(req,res){
    const {name, email, password} = req.body

    const passwordHash = bcrypt.hashSync(password,10)

    try {
        await connection.query(`
            INSERT INTO users (email,name,password)
            VALUES ($1, $2, $3)
        `, [email, name, passwordHash])
        res.sendStatus(201)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function signIn(req,res){
    const user = req.user
    const token = uuid()

    try {
        await connection.query(`
            INSERT INTO sessions ("userId", token)
            VALUES ($1,$2)
        `,[user.id, token])
        res.status(200).send(token)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function getMyUser(req,res){
    const userId = req.userId

    try {
        const user = await connection.query(`
        select
        users.id,
        users.name,
        cast(count(urls."userId") as integer) as "visitCount",
        (
          select
            json_agg(s)
          from
            (
              select
                urls.id,
                urls."shortUrl",
                urls.url,
                count("visitedUrls"."urlId") as "visitCount"
              from
                urls
                join "visitedUrls" on urls.id = "visitedUrls"."urlId"
              where
                urls."userId" = users.id
              group by
                urls.id
            ) s
        ) as "shortenedUrls"
      from
        users
        join urls on users.id = urls."userId"
        join "visitedUrls" on urls.id = "visitedUrls"."urlId"
      where
        users.id = ($1)
      group by
        users.id
        `,[userId])
        res.status(200).send(user.rows[0])
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}