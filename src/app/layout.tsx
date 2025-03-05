import type { Metadata } from 'next'
import { Toaster } from 'sonner'
import { ThemeProvider } from '~/providers/theme-provider'
import './globals.css'

export const metadata: Metadata = {
  title: 'Echo Loadout',
  description: 'Echo Loadout is a platform for managing your loadouts.',
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body>
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          {children}

          <Toaster richColors />
        </ThemeProvider>
      </body>
    </html>
  )
}
