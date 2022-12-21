import express from "express"
import cors from "cors"
import dotenv from "dotenv"
import usersRouters from "./routes/usersRoutes.js"
import urlsRouters from "./routes/urlsRoutes.js"

const app = express();
app.use(express.json())
app.use(cors())
app.use(usersRouters)
app.use(urlsRouters)

const port = process.env.PORT || 4000

app.listen(port, ()=> console.log(`Server running in port ${port}`))