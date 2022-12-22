import joi from "joi";

export const signUpSchema = joi.object({
  name: joi.string().required().min(3),
  email: joi.string().required().email(),
  password: joi.string().required().min(3),
  confirmPassword: joi.ref("password"),
});

export const signInSchema = joi.object({
  email: joi.string().required().email(),
  password: joi.string().required().min(3),
});
