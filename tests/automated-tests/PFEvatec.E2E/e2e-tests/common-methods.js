/*
# Copyright(C) The PEER Group Inc., 2023.
#
# This software contains confidential and trade secret information
# belonging to PEER Group Inc, All Rights Reserved.
#
# No part of this software may be reproduced or transmitted in any form
# or by any means, electronic, mechanical, photocopying, recording or
# otherwise, without the prior written consent of the PEER Group Inc.
*/

const config = require("../configuration/config.json");
const { test, expect, TestInfo } = require('@playwright/test');
const runtimeProcess = /** @type {any} */ (globalThis).process;


function getBaseUrl(defaultUrl) {
   const override = runtimeProcess && runtimeProcess.env && runtimeProcess.env.PF_BASE_URL;
   if (override && override.trim() !== '') {
      return override.trim();
   }
   return defaultUrl;
}


/**
 * Signs an authorized users to the application
 * @param page
 * @param userName from the configuration 
 */
async function signInAsAuthorizedUser(page, userName) { 

   console.log(userName);
    // Sign in
    await page.locator('#clr-input-0').click();
    // add in user name 
    await page.locator('#clr-input-0').fill(userName);
    // switch fields
    await page.locator('#clr-input-0').press('Tab');
    // auto generate text for password
    let randomPassword = Math.random().toString(36).slice(2, 10);

    console.log("Password generated: " + randomPassword);

    // Sign in with the passwords
    await page.locator('#clr-password-0').fill(randomPassword);

    await page.getByRole('button', { name: 'Sign In' }).click();

    console.log("Signing in as authorized user: " + userName); 
} 

 /**
 * Navigate to home page
 * @param page
 * @param siteUrl 
 */
async function navigateToHomePage(page, siteUrl) {
   const baseUrl = getBaseUrl(siteUrl);
   console.log("Navigating to home page for EF... " + baseUrl);
   await page.goto(baseUrl);
   // add error check
}

/**
 * Sign out of the application
 */
async function signOut(page) { 

   // TO DO: need to fix to use specific user
    await page.locator('a').filter({ hasText: 'QA 3 (Q3)' }).click();

    await page.getByRole('button', { name: 'Sign Out' }).click();

    console.log("Signing out of the application.."); 
} 

/**
 * Sign out of the application
 */
async function takeScreenshot(page, testInfo) {  
  // Take a screen shot that the collection was valid
  const screenshot = await page.screenshot();
  await TestInfo.attach('screenshot', { body: screenshot, contentType: 'image/png' });

} 



 /**
 * Navigate to a page via the specific link
 * @returns text generated
 */
var navigateToFromNavigationBar = async (page, pageToVisit)=> { 
 
   console.log("Navigating to " + pageToVisit); 
   await page.getByRole('link', { name: pageToVisit }).first().click();
  
   // add error check

 } 



// SAMPLE CODE FOR MEASURING PEFORMANCE
 async function measurePerformance(page, testInfo) {
   // Use Performance API to measure performance 
   // https://developer.mozilla.org/en-US/docs/Web/API/Performance/getEntriesByType
   const [performanceTiming] = await page.evaluate(() => {
       const [timing] = performance.getEntriesByType('navigation');
       return [timing];
   });
   // Get the start to load event end time
   const startToLoadEventEnd = performanceTiming.loadEventEnd - performanceTiming.startTime;

   console.log("Performance Metric: Start to Load Event End: " + startToLoadEventEnd);
   // Add the performance annotation to the HTML report
   test.info().annotations.push({ type: 'Performance', description: `"${testInfo.project.name}" - Navigation start to load event end: ${startToLoadEventEnd}ms` });
}
 


 module.exports = {
    measurePerformance,
    navigateToHomePage,
    navigateToFromNavigationBar,
    signInAsAuthorizedUser,
    takeScreenshot,
    signOut
  };