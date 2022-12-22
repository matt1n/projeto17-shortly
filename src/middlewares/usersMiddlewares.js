import {connection} from "../database/database.js"
import { signInSchema, signUpSchema } from "../models/usersSchemas.js"
import bcrypt from "bcrypt"

export async function signUpBodyValidation(req,res,next){
    const body = req.body

    const {error} = signUpSchema.validate(body, {abortEarly:false})
    if (error){
        const errors = error.details.map(detail=> detail.message)
        return res.status(422).send(errors)
    }

    const user = await connection.query(`
        SELECT *
        FROM users
        WHERE email = ($1)
    `, [body.email])
    if (user.rows.length!==0){
        return res.sendStatus(409)
    }

    next()
}

export async function signInBodyValidation(req,res,next){
    const body = req.body

    const {error} = signInSchema.validate(body, {abortEarly:false})
    
    if(error){
        const errors = error.details.map(detail=> detail.message)
        return res.status(422).send(errors)
    }

    const user = await connection.query(`
        SELECT *
        FROM users
        WHERE email = ($1)
    `,[body.email])
    if (user.rows.length===0){
        return res.sendStatus(401)
    }

    const correctPassword = bcrypt.compareSync(body.password, user.rows[0].password)
    if(!correctPassword){
        return res.sendStatus(401)
    }

    req.user = user.rows[0]
    next()
}

export async function myUserValidation(req,res,next){
    const userId = req.userId

    const user = await connection.query(`
        SELECT *
        FROM users
        WHERE id = ($1)
    `, [userId])

    if(user.rows.length===0){
        return res.sendStatus(404)
    }
    console.log(user.rows)

    next()
}