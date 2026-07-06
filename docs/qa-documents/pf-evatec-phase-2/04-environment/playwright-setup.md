# Playwright Workspace Setup (Microsoft Recommended)

## Optional Link/Table Styling

```css
a {
    text-decoration: none;
    color: #464feb;
}
tr th, tr td {
    border: 1px solid #e6e6e6;
}
tr th {
    background-color: #f5f5f5;
}
```

## Prerequisites

Install:

- Node.js LTS
- Visual Studio Code
- Microsoft Playwright VS Code Extension

Microsoft's Playwright documentation recommends Node.js (LTS), VS Code, and the official Microsoft Playwright extension.

References:

- https://playwright.dev/docs/getting-started-vscode
- https://playwright.dev/docs/intro

## Create Workspace

```bash
mkdir PlaywrightAutomation
cd PlaywrightAutomation
code .
```

## Initialize Playwright Project

Open a VS Code terminal and run:

```bash
npm init playwright@latest
```

Select:

- Language: TypeScript
- Tests folder: tests
- GitHub Actions: Yes (if CI required)
- Install Browsers: Yes

This is the recommended installation process from the Playwright team.

References:

- https://playwright.dev/docs/intro
- https://www.npmjs.com/package/@playwright/test

## Recommended Folder Structure

```text
PlaywrightAutomation/
|
|-- tests/
|   |-- smoke/
|   |-- regression/
|   `-- sanity/
|
|-- pages/
|   |-- LoginPage.ts
|   |-- HomePage.ts
|   `-- BasePage.ts
|
|-- fixtures/
|   `-- testFixture.ts
|
|-- test-data/
|   |-- users.json
|   `-- config.json
|
|-- utils/
|   |-- Logger.ts
|   |-- Helpers.ts
|   `-- Constants.ts
|
|-- reports/
|
|-- playwright.config.ts
|-- package.json
|-- tsconfig.json
`-- .gitignore
```

## Required NPM Packages

Core Playwright:

```bash
npm install
```

Additional commonly approved packages:

```bash
npm install dotenv
npm install csv-parse
npm install uuid
```

Development packages:

```bash
npm install -D eslint
npm install -D prettier
npm install -D @types/node
```

## Recommended package.json Scripts

```json
{
  "scripts": {
    "test": "playwright test",
    "smoke": "playwright test tests/smoke",
    "regression": "playwright test tests/regression",
    "headed": "playwright test --headed",
    "debug": "playwright test --debug",
    "ui": "playwright test --ui",
    "report": "playwright show-report"
  }
}
```

## VS Code Extensions

Install only Microsoft / widely approved extensions:

- Playwright Test for VS Code (Microsoft)
- ESLint (Microsoft)
- GitHub Copilot (Microsoft)
- GitHub Copilot Chat (Microsoft)

The Playwright VS Code extension provides test execution, debugging, browser selection, and code generation directly inside VS Code.

Reference:

- https://playwright.dev/docs/getting-started-vscode

## Run Tests

Execute all tests:

```bash
npx playwright test
```

Run UI Mode:

```bash
npx playwright test --ui
```

Run a specific file:

```bash
npx playwright test tests/login.spec.ts
```

Generate report:

```bash
npx playwright show-report
```

These are standard Playwright commands documented by Microsoft Playwright.

References:

- https://playwright.dev/docs/intro
- https://www.npmjs.com/package/@playwright/test

## Recommended Enterprise Standards

- TypeScript only
- Page Object Model (POM)
- Separate test data from test logic
- Store credentials in `.env`
- Never hardcode URLs or passwords
- Use Playwright locators (`getByRole`, `getByLabel`, `getByTestId`)
- Enable traces on failure
- Commit `package-lock.json`
- Exclude reports and artifacts from source control

Example `.gitignore`

```gitignore
node_modules/
playwright-report/
test-results/
.env
```

## Typical First Test

```ts
import { test, expect } from '@playwright/test';

test('Launch application', async ({ page }) => {
  await page.goto('https://playwright.dev');
  await expect(page).toHaveTitle(/Playwright/);
});
```

This follows Microsoft's recommended Playwright Test framework and project structure.

References:

- https://playwright.dev/docs/intro
- https://playwright.dev/docs/getting-started-vscode
