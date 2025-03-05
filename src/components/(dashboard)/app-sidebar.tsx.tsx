import Link from 'next/link'
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
  SidebarRail,
} from '~/components/ui/sidebar'
import { NavUser } from './nav-user'
import { SidebarLogo } from './sidebar-logo'

type AppSidebarProps = React.ComponentProps<typeof Sidebar>

type Data = {
  title: string
  url: string
  items?: {
    title: string
    url: string
    isActive?: boolean
  }[]
}[]

const data: Data = [
  {
    title: 'Dashboard',
    url: '/dashboard',
  },
  {
    title: 'Specialization',
    url: '#',
  },
  {
    title: 'Weapons',
    url: '/dashboard/weapons',
    items: [
      {
        title: 'Weapons Variants',
        url: '#',
      },
      {
        title: 'Weapons Base Stats',
        url: '#',
      },
      {
        title: 'Weapons Mods',
        url: '#',
      },
      {
        title: 'Weapons Exotics Effects',
        url: '#',
      },
    ],
  },
  {
    title: 'Gear',
    url: '#',
    items: [
      {
        title: 'Brand Set',
        url: '#',
      },
      {
        title: 'Brand Set Bonus',
        url: '#',
      },
      {
        title: 'Gear Set',
        url: '#',
      },
      {
        title: 'Gear Set Bonus',
        url: '#',
      },
      {
        title: 'Gear Mods',
        url: '#',
      },
      {
        title: 'Gear Exotics Effects',
        url: '#',
      },
    ],
  },
  {
    title: 'Skill',
    url: '#',
    items: [
      {
        title: 'Skill Mods',
        url: '#',
      },
    ],
  },
  {
    title: 'Talents',
    url: '#',
  },
]

export function AppSidebar({ ...props }: AppSidebarProps) {
  return (
    <Sidebar {...props}>
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <Link
              href="/dashboard"
              className="flex items-center justify-center"
            >
              <SidebarLogo />
            </Link>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>

      <SidebarContent>
        <SidebarGroup>
          <SidebarMenu>
            {data.map(item => (
              <SidebarMenuItem key={item.title}>
                <SidebarMenuButton asChild>
                  <Link href={item.url} className="font-medium">
                    {item.title}
                  </Link>
                </SidebarMenuButton>
                {item.items?.length ? (
                  <SidebarMenuSub>
                    {item.items.map(item => (
                      <SidebarMenuSubItem key={item.title}>
                        <SidebarMenuSubButton asChild isActive={item.isActive}>
                          <Link href={item.url}>{item.title}</Link>
                        </SidebarMenuSubButton>
                      </SidebarMenuSubItem>
                    ))}
                  </SidebarMenuSub>
                ) : null}
              </SidebarMenuItem>
            ))}
          </SidebarMenu>
        </SidebarGroup>
      </SidebarContent>

      <SidebarFooter>
        <NavUser
          user={{
            username: 'admin',
            avatar: 'https://ui.shadcn.com/avatars/shadcn.jpg',
          }}
        />
      </SidebarFooter>
      <SidebarRail />
    </Sidebar>
  )
}
