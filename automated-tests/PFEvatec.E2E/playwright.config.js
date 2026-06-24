// @ts-check
const { defineConfig, devices } = require('@playwright/test');

const config = require('./configuration/config.json');
const runtimeProcess = /** @type {any} */ (globalThis).process;
const isCI = !!(runtimeProcess && runtimeProcess.env && runtimeProcess.env.CI);


/**
 * Read environment variables from file.
 * https://github.com/motdotla/dotenv
 */
// require('dotenv').config();

/**
 * @see https://playwright.dev/docs/test-configuration
 */

 // playwright.config.js
// attachments outputDir and report outputFile used same folder


const date = new Date().toISOString().slice(0, 10); 
const outputDir = `./test-results/${date}`;


module.exports = defineConfig({
  globalTimeout: 60 * 60 * 1000,

  metadata: {
    product: 'Evatec Factory Web Application',
    env: config.environmentTesting,
    type: 'Regression',
    url: config.testingUrl,
    userName: config.userNameQA3,
    viewPort: 'width: 1920, height: 1049'
  },

  outputDir: outputDir,


  testDir: './e2e-tests',
  /* Run tests in files in parallel */
  fullyParallel: true,
  /* Fail the build on CI if you accidentally left test.only in the source code. */
  forbidOnly: isCI,
  /* Retry on CI only */
  retries: isCI ? 2 : 0,
  /* Opt out of parallel tests on CI. */
  workers: isCI ? 1 : undefined,
  /* Reporter to use. See https://playwright.dev/docs/test-reporters */
 // reporter: 'html',


  reporter: [
    ['list'],
    ['monocart-reporter', {  
        name: `Evatec Factory Test Report ${date}`,
        outputFile: `${outputDir}/index.html`,
        tags: {
          smoke: {
              style: {
                  background: '#6F9913'
              },
              description: 'This is Smoke Test'
          },
          happyPath: {
            style: {
                background: '#0018F9'
            },
            description: 'This is a Happy Path test'
          },
          R91: {
            style: {
                background: '#932FB8'
            },
            description: 'This is for release R9.1'
          },
          critical: {
              background: '#c00'
          },
          SECSGEMTOOL: {
            background: '#402FB8'
        }
      }
    }]
  ],

  /* Shared settings for all the projects below. See https://playwright.dev/docs/api/class-testoptions. */
  use: {
    // Emulates the user locale.
    locale: 'de-DE',

    // Emulates the user timezone.
    timezoneId: 'Europe/Zurich',

    // Viewport used for all pages in the context.
    viewport: { width: 1920, height: 1049 },

    // Grants specified permissions to the browser context.
    permissions: ['notifications'],

    /* Base URL to use in actions like `await page.goto('/')`. */
    // baseURL: 'http://127.0.0.1:3000',

    /* Collect trace when retrying the failed test. See https://playwright.dev/docs/trace-viewer */
    trace: 'on-first-retry'
  },

  /* Configure projects for major browsers */
  projects: [
    {
      name: 'chromium',
      use: { 
        ...devices['Desktop Chrome'],
        launchOptions: {
          args: ["--start-fullscreen"] // starting the browser in full screen
        },
      },
    },

   
  ],

  /* Run your local dev server before starting the tests */
  // webServer: {
  //   command: 'npm run start',
  //   url: 'http://127.0.0.1:3000',
  //   reuseExistingServer: !process.env.CI,
  // },
});

