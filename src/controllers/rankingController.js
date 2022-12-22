import { connection } from "../database/database.js";

export async function getRanking(req,res){
    try {
        const ranking = await connection.query(`
        select users.id, users.name,(select cast(count(urls."userId") as integer) from urls where urls."userId"=users.id) as "linksCount", cast(count("visitedUrls"."urlId")as integer) as "visitCount" 
        from users 
        left join urls on users.id = urls."userId" 
        left join "visitedUrls" on urls.id = "visitedUrls"."urlId" 
        group by users.id 
        order by "visitCount" desc 
        limit 10
        `)
        res.status(200).send(ranking.rows)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}