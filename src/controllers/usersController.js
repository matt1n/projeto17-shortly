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

export async function signIn(req,res,next){
    const user = req.user
    const token = uuid()

    try {
        await connection.query(`
            INSERT INTO sessions ("userId", token, "sessionDate")
            VALUES ($1,$2,now())
        `,[user.id, token])
        res.status(200).send(token)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}