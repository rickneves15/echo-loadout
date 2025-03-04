import { z } from 'zod'

export const signInFormSchema = z.object({
  username: z.string().min(3, 'Username is required'),
  password: z.string().min(1, 'Password is required'),
})

export type SignInFormSchema = z.infer<typeof signInFormSchema>
