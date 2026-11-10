import { test } from '@e2e-dev/mobile';

test('greeter works correctly', async ({ app, agent, device }) => {
    await device.installApp();
    await app.open();

    await agent.act("Navigate to the 'Greetings' tab")
    await agent.act("Enter the name 'Alice' in the text field and submit")

    await agent.assert("An alert is shown with a greeting to Alice", { vision: true })
});
