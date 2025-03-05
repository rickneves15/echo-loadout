'use client'

import { useTheme } from 'next-themes'
import Image from 'next/image'

export function SidebarLogo() {
  const { theme } = useTheme()
  const logoImage =
    theme === 'light'
      ? '/images/logos/320x80-light.svg'
      : '/images/logos/320x80-dark.svg'

  return (
    <Image
      src={logoImage}
      alt="Echo Loadout"
      className="object-contain"
      width={128}
      height={32}
    />
  )
}
