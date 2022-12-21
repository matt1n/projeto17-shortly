import { connection } from "../database/database.js";
import { shortenUrlSchema } from "../models/urlsSchemas.js";

export async function shortenUrlBodyValidation(req,res,next){
    const body = req.body

    const {error} = shortenUrlSchema.validate(body)
    if(error){
        const errors = error.details.map(detail=> detail.message)
        return res.status(422).send(errors)
    }

    next()
}

export async function urlByIdParamValidation(req,res,next){
    const {id} = req.params

    const url = await connection.query(`
        SELECT id, "shortUrl", url
        FROM urls
        WHERE id = ($1)
    `,[id])

    if (url.rows.length===0){
        res.sendStatus(404)
    }

    req.url=url.rows[0]
    next()
}

export async function openUrlParamValidation(req,res,next){
    const {shortUrl} = req.params

    const url = await connection.query(`
        SELECT *
        FROM urls
        WHERE "shortUrl" = ($1)
    `, [shortUrl])

    if (url.rows.length===0){
        res.sendStatus(404)
    }

    req.url = url.rows[0]
    next()
}