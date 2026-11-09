import { test } from '@e2e-dev/mobile';

test('tapping + increments the number to 1', async ({ app, agent, device }) => {
  await device.installApp();
  await app.open();
  await agent.assert('The number stepper displays exactly "Number: 0"');

  await agent.act('Tap the + (increment) button on the number stepper once');

  await agent.assert('The number stepper displays exactly "Number: 1"');
});
