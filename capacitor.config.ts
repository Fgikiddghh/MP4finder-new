import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.mp4finder.app',
  appName: 'MP4 Finder',
  webDir: 'dist/public',
  server: {
    androidScheme: 'https'
  }
};

export default config;