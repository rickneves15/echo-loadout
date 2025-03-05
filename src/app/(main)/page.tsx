import type { Metadata } from 'next'
import { createSession } from '~/lib/session'

export const metadata: Metadata = {
  title: 'Echo Loadout | Home',
}

export default function Home() {
  const onSignIn = async () => {
    'use server'
    const username = process.env?.NEXT_PUBLIC_DASHBOARD_USERNAME
    if (username) {
      await createSession(username)
    }
  }
  return (
    <>
      <h1 className="text-3xl font-bold underline">Hello world!</h1>
      <button type="button" onClick={onSignIn}>
        Sign in
      </button>
    </>
  )
}
