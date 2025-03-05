import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Echo Loadout | Home',
}

export default function Home() {
  return (
    <>
      <h1 className="text-3xl font-bold underline">Hello world!</h1>
      <a href="/sign-in">Sign in</a>
    </>
  )
}
