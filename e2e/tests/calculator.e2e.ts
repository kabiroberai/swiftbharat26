import { test } from '@e2e-dev/mobile';

test('date calculator works correctly', async ({ app, agent, device }) => {
    await device.installApp();
    await app.open();

    await agent.act("Tap the 'Calculator' tab button")

    await agent.assert("The 'Month number' shows the month ordinal from 'Selected date'")
});
