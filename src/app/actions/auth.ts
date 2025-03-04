import { createSession } from '~/lib/session'

export async function signInAction() {
  const username = process.env?.NEXT_PUBLIC_DASHBOARD_USERNAME
  if (username) {
    await createSession(username)
  }
}
