import { test } from '@e2e-dev/mobile';

test('app opens with the number at zero', async ({ app, agent, device }) => {
  await device.installApp();
  await app.open();
  await agent.assert('The number stepper displays exactly "Number: 0"');
});
