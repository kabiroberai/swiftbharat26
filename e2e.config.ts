import type { E2EConfig } from 'e2e';
import { mobile } from '@e2e-dev/mobile';
import { github } from '@e2e-dev/github';
import { chatgpt } from 'e2e/oauth/chatgpt';

export default {
  tests: 'Tests/E2E/**/*.e2e.ts',
  reporters: ['list', github()],
  agents: {
    default: {
      model: chatgpt('gpt-6-luna'),
    },
  },
  targets: [{
    name: 'ios',
    engine: mobile({
      platform: 'ios',
      device: process.env.E2E_DEVICE ?? 'iPhone 17 Pro',
    }),
    app: {
      appPath: './xtool/swiftbharat26.app',
    },
  }],
  workers: 1,
} satisfies E2EConfig;
