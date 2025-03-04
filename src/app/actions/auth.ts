'use server'

import { z } from 'zod'
import { StatusCode } from '~/lib/http'
import { createSession } from '~/lib/session'
import { transformZodErrors } from '~/lib/zod'
import {
  type SignInFormSchema,
  signInFormSchema,
} from '~/schemas/signInFormSchema'

export async function signInAction(formData: SignInFormSchema) {
  try {
    const validatedFields = signInFormSchema.parse(formData)
    const validPassword = process.env?.NEXT_PUBLIC_DASHBOARD_PASSWORD
    if (validPassword !== validatedFields.password) {
      return {
        errors: {
          message: 'Invalid username or password.',
        },
        statusCode: StatusCode.UNAUTHORIZED,
      }
    }

    await createSession(validatedFields.username)

    return {
      errors: null,
      statusCode: StatusCode.OK,
    }
  } catch (error) {
    if (error instanceof z.ZodError) {
      return {
        errors: transformZodErrors(error),
        statusCode: StatusCode.BAD_REQUEST,
      }
    }

    return {
      errors: {
        message: 'An unexpected error occurred.',
      },
      statusCode: StatusCode.INTERNAL_SERVER_ERROR,
    }
  }
}
