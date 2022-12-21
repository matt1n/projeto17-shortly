import { Router } from "express";
import { getUrlById, openUrl, shortenUrl } from "../controllers/urlsControllers.js";
import { authValidation } from "../middlewares/authMIddleware.js";
import { urlByIdParamValidation, shortenUrlBodyValidation, openUrlParamValidation } from "../middlewares/urlsMiddlewares.js";

const router = Router()

router.post('/urls/shorten', authValidation, shortenUrlBodyValidation, shortenUrl)
router.get('/urls/:id', urlByIdParamValidation, getUrlById)
router.get('/urls/open/:shortUrl', openUrlParamValidation, openUrl)

export default router

