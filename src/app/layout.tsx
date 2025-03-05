import type { Metadata } from 'next'
import { Toaster } from 'sonner'
import { ThemeProvider } from '~/providers/theme-provider'
import './globals.css'

export const metadata: Metadata = {
  title: 'Echo Loadout',
  description: 'Echo Loadout is a platform for managing your loadout.',
  icons: {
    icon: [
      {
        url: '/images/logos/favicon-16x16.png',
        sizes: '16x16',
        type: 'image/png',
      },
      {
        url: '/images/logos/favicon-32x32.png',
        sizes: '32x32',
        type: 'image/png',
      },
    ],
    apple: [{ url: '/images/logos/apple-touch-icon.png', sizes: '180x180' }],
    other: {
      rel: 'apple-touch-icon-precomposed',
      url: '/images/logos/apple-touch-icon.png',
    },
  },
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
