import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Echo Loadout | Dashboard',
}

export default function DashboardPage() {
  return <h1 className="text-3xl font-bold underline">Dashboard</h1>
}
