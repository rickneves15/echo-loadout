import type { MetadataRoute } from 'next'

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Echo Loadout - The Division 2 Build Creator',
    short_name: 'Echo Loadout',
    description:
      'Create, view and share your Division 2 builds with a minimalist interface',
    start_url: '/',
    display: 'standalone',
    background_color: '#1a1a1a',
    theme_color: '#ff6b00',
    icons: [
      {
        src: '/images/logos/icon-48x48.png',
        sizes: '48x48',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-72x72.png',
        sizes: '72x72',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-96x96.png',
        sizes: '96x96',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-128x128.png',
        sizes: '128x128',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-144x144.png',
        sizes: '144x144',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-152x152.png',
        sizes: '152x152',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-192x192.png',
        sizes: '192x192',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-256x256.png',
        sizes: '256x256',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-384x384.png',
        sizes: '384x384',
        type: 'image/png',
      },
      {
        src: '/images/logos/icon-512x512.png',
        sizes: '512x512',
        type: 'image/png',
      },
    ],
    orientation: 'portrait',
    categories: ['games', 'utilities', 'tools'],
    // take a look at the screenshot section below
    // screenshots: [
    //   {
    //     src: '/screenshots/build-creator.png',
    //     sizes: '1280x720',
    //     type: 'image/png',
    //   },
    // ],
    // share_target: {
    //   action: '/share',
    //   method: 'GET',
    //   params: {
    //     title: 'title',
    //     text: 'text',
    //     url: 'url',
    //   },
    // },
  }
}
