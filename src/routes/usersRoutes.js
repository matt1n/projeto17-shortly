import { Router } from "express";
import { signIn, signUp } from "../controllers/usersController.js";
import { signInBodyValidation, signUpBodyValidation } from "../middlewares/usersMiddlewares.js";

const router = Router();

router.post('/signup', signUpBodyValidation, signUp)
router.post('/signin', signInBodyValidation, signIn)

export default router
