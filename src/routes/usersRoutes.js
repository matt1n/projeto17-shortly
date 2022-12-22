import { Router } from "express";
import { getMyUser, signIn, signUp } from "../controllers/usersController.js";
import { authValidation } from "../middlewares/authMIddleware.js";
import {
  myUserValidation,
  signInBodyValidation,
  signUpBodyValidation,
} from "../middlewares/usersMiddlewares.js";

const router = Router();

router.post("/signup", signUpBodyValidation, signUp);
router.post("/signin", signInBodyValidation, signIn);
router.get("/users/me", authValidation, myUserValidation, getMyUser);

export default router;
