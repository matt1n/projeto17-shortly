import { Router } from "express";
import { deleteUrl, getUrlById, openUrl, shortenUrl } from "../controllers/urlsControllers.js";
import { authValidation } from "../middlewares/authMIddleware.js";
import { urlByIdParamValidation, shortenUrlBodyValidation, openUrlParamValidation, urlOwnerValidation } from "../middlewares/urlsMiddlewares.js";

const router = Router()

router.post('/urls/shorten', authValidation, shortenUrlBodyValidation, shortenUrl)
router.get('/urls/:id', urlByIdParamValidation, getUrlById)
router.get('/urls/open/:shortUrl', openUrlParamValidation, openUrl)
router.delete('/urls/:id', authValidation, urlOwnerValidation, deleteUrl)

export default router

