'use client'

import { usePathname } from 'next/navigation'
import { Fragment, useMemo } from 'react'
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '~/components/ui/breadcrumb'

export function DynamicBreadcrumb() {
  const pathname = usePathname()

  const breadcrumbItems = useMemo(() => {
    const pathSegments = pathname.split('/').filter(Boolean)

    return pathSegments.map((segment, index) => {
      // Construct the href by joining path segments up to this point
      const href = `/${pathSegments.slice(0, index + 1).join('/')}`

      // Convert segment to title case, replace hyphens and underscores
      const label = segment
        .split(/[-_]/)
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ')

      return {
        label,
        href,
        isCurrent: index === pathSegments.length - 1,
      }
    })
  }, [pathname])

  if (breadcrumbItems.length === 0) {
    return null
  }

  return (
    <Breadcrumb>
      <BreadcrumbList>
        {breadcrumbItems.map((item, index) => (
          <Fragment key={item.href}>
            {index > 0 && <BreadcrumbSeparator className="hidden md:block" />}
            {item.isCurrent ? (
              <BreadcrumbItem>
                <BreadcrumbPage>{item.label}</BreadcrumbPage>
              </BreadcrumbItem>
            ) : (
              <BreadcrumbItem>
                <BreadcrumbLink href={item.href}>{item.label}</BreadcrumbLink>
              </BreadcrumbItem>
            )}
          </Fragment>
        ))}
      </BreadcrumbList>
    </Breadcrumb>
  )
}
