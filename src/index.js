import express from "express";
import cors from "cors";
import usersRouters from "./routes/usersRoutes.js";
import urlsRouters from "./routes/urlsRoutes.js";
import rankingRouters from "./routes/rankingRoutes.js";

const app = express();
app.use(express.json());
app.use(cors());
app.use(usersRouters);
app.use(urlsRouters);
app.use(rankingRouters);

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running in port ${port}`));
