'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useRouter } from 'next/navigation'
import { useForm } from 'react-hook-form'
import { toast } from 'sonner'
import { signInAction } from '~/app/actions/auth'
import { Button } from '~/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '~/components/ui/card'
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '~/components/ui/form'
import { Input } from '~/components/ui/input'
import { StatusCode } from '~/lib/http'
import { cn } from '~/lib/utils'
import {
  type SignInFormSchema,
  signInFormSchema,
} from '~/schemas/signInFormSchema'

export function LoginForm({
  className,
  ...props
}: React.ComponentProps<'div'>) {
  const router = useRouter()
  const form = useForm<SignInFormSchema>({
    resolver: zodResolver(signInFormSchema),
    defaultValues: {
      username: '',
      password: '',
    },
  })

  const onSubmit = async (values: SignInFormSchema) => {
    const { errors, statusCode } = await signInAction(values)
    const toastId = 'signInForm'

    if (statusCode === StatusCode.OK) {
      toast.success('Successfully signed in! Redirecting...', {
        id: toastId,
        duration: 3000,
        onAutoClose: () => {
          router.push('/dashboard')
        },
      })
    } else {
      if (Array.isArray(errors)) {
        for (const error of errors) {
          form.setError('root', {
            type: 'server',
            message: error.message,
          })
        }
      } else {
        toast.error(errors?.message || 'An unexpected error occurred.', {
          id: toastId,
        })
      }
    }
  }

  return (
    <div className={cn('flex flex-col gap-6', className)} {...props}>
      <Card>
        <CardHeader className="text-center">
          <CardTitle className="text-xl">Welcome back</CardTitle>
        </CardHeader>
        <CardContent>
          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
              <FormField
                control={form.control}
                name="username"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel htmlFor="username">Username</FormLabel>
                    <FormControl>
                      <Input id="username" type="username" {...field} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              <FormField
                control={form.control}
                name="password"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel htmlFor="password">Password</FormLabel>
                    <FormControl>
                      <Input id="password" type="password" {...field} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <Button type="submit" className="w-full">
                Sign in
              </Button>
            </form>
          </Form>
        </CardContent>
      </Card>
    </div>
  )
}
