import { cookies } from 'next/headers'
import { type NextRequest, NextResponse } from 'next/server'
import { cookieKey, decrypt } from './lib/session'

const protectedRoutes = ['/dashboard']

export default async function middleware(req: NextRequest) {
  const path = req.nextUrl.pathname
  const isProtectedRoute =
    protectedRoutes.includes(path) || path.startsWith('/dashboard')

  const cookie = (await cookies()).get(cookieKey)?.value
  const session = await decrypt(cookie)

  if (isProtectedRoute && !session?.username) {
    return NextResponse.redirect(new URL('/', req.nextUrl))
  }

  if (session?.userId && req.nextUrl.pathname.startsWith('/sign-in')) {
    return NextResponse.redirect(new URL('/dashboard', req.nextUrl))
  }

  return NextResponse.next()
}

// Routes Middleware should not run on
export const config = {
  matcher: ['/((?!api|_next/static|_next/image|.*\\.png$).*)'],
}
