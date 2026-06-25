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

const { test, expect, TestInfo } = require('@playwright/test');

const { signInAsAuthorizedUser, navigateToHomePage, navigateToFromNavigationBar, measurePerformance, signOut, takeScreenshot } = require("./common-methods.js");

const config = require("../configuration/config.json");

const testName = 'EF Web Client Test: Create a new private project @smoke @happyPath @R91';

const toolId = config.cassetteToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);

    // Select to create new project
    console.log("Select to create a new project...");
    await page.locator('#navmenuitem-projects').getByRole('link', { name: 'Projects' }).click();
    await page.getByRole('button', { name: 'New' }).click();
    await page.locator('#clr-input-2').click();

    // Add a unique generated name to the Project
    var isoDateString = new Date().toISOString();
    let currentDate = isoDateString;
    let generatedProjectName = 'PROJECT_AUTOMATED.R9.1_' + currentDate;
    console.log('Adding the generated name to the Project...' + generatedProjectName) 
    await page.locator('#clr-input-2').fill(generatedProjectName);
    await page.locator('#clr-input-2').press('Enter');


    // Add a tag
    console.log('Adding a tag...');
    await page.locator('#clr-combobox-1-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'Automated' }).click();
    await page.locator('.popover-overlay').click();


    console.log('Adding a work order...');
    await page.locator('#clr-combobox-0').fill('sam');
    await page.getByRole('option', { name: '3044445 - Sampling Olympus SiO2, ITO 300mm' }).click();
    await page.locator('.minimizable-panel-content').first().click();
   
 
    // Adding a description
    console.log('Adding a description to the project...');
    await page.locator('#clr-textarea-0').click();
    await page.locator('#clr-textarea-0').fill('This is a new project that was automatically generated on ' + currentDate);

    // Adding a shared user
    await page.locator('#clr-combobox-2-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'Lev Cocarell (LC)' }).click();
    await page.locator('.popover-overlay').click();

    // Save the project
    console.log("Save the project.");
    await page.getByRole('button', { name: 'Save' }).click();

    // Click back
    await page.getByRole('button', { name: 'Back' }).click();
 
    // Take a screen shot that the collection was valid
    const screenshot = await page.screenshot();
    await TestInfo.attach('screenshot', { body: screenshot, contentType: 'image/png' });


    await signOut(page);
  
    await measurePerformance(page, TestInfo);

 });