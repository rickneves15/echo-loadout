import { Separator } from '@radix-ui/react-separator'
import type { PropsWithChildren } from 'react'
import { AppSidebar } from '~/components/(dashboard)/app-sidebar.tsx'
import { DynamicBreadcrumb } from '~/components/(dashboard)/dynamic-breadcrumb'
import { ButtonToggleTheme } from '~/components/button-toogle-theme'
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from '~/components/ui/sidebar'

export default function DashboardLayout({ children }: PropsWithChildren) {
  return (
    <SidebarProvider>
      <AppSidebar />

      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 border-b">
          <div className="flex w-full items-center justify-between gap-2 px-3">
            <div className="flex flex-1 items-center gap-2">
              <SidebarTrigger />
              <Separator orientation="vertical" className="mr-2 h-4" />
              <DynamicBreadcrumb />
            </div>
            <ButtonToggleTheme />
          </div>
        </header>
        <div className="flex flex-1 flex-col gap-4 p-4">{children}</div>
      </SidebarInset>
    </SidebarProvider>
  )
}
