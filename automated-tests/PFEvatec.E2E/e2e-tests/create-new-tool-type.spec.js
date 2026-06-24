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

const testName = 'EF Web Client Test: Create a new Tool Type @smoke @happyPath @R91';

const toolId = config.cassetteToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);




    
     // Add a unique generated name to the collection
     var isoDateString = new Date().toISOString();
     console.log(isoDateString);
     let currentDate = isoDateString;
     let generatedToolTypeName = 'TOOL_TYPE.R9.1_' + currentDate;
     console.log('The TOOL TYPE Name: ' + generatedToolTypeName);
     console.log('Adding a name...');

    // Select to create new tool type
    await page.getByRole('link', { name: 'Tool Types' }).click();
    await page.getByRole('button', { name: 'New' }).click();
    await page.locator('#clr-input-2').click();
    await page.locator('#clr-input-2').fill('AutomatedToolType');
    await page.locator('#clr-input-2').press('Enter');
    await page.locator('#clr-textarea-0').click();
    await page.locator('#clr-textarea-0').fill(generatedToolTypeName);
    await page.getByRole('button', { name: 'Show options' }).click();



    await page.getByRole('option', { name: 'Module_Type_C.R8.0_QA3_230130' }).click();
    await page.getByRole('button', { name: 'Add Module' }).click();
    await page.getByRole('cell', { name: 'Show options Validation Required' }).getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'IMA' }).click();
    await page.getByRole('cell', { name: 'Show options At least one supported module type is required.' }).getByRole('button', { name: 'Show options' }).click();

 
    await page.locator('body').press('Enter');

    await page.getByRole('option', { name: 'Degas', exact: true }).click();

    await page.locator('.minimizable-panel-content').first().click();
    await page.locator('body').press('Enter');

    await page.getByRole('button', { name: 'Save' }).click();

    await page.getByRole('button', { name: 'Back' }).click();




    // Take a screen shot that the collection was valid
    const screenshot = await page.screenshot();
    await TestInfo.attach('screenshot', { body: screenshot, contentType: 'image/png' });


    await signOut(page);
  
    await measurePerformance(page, TestInfo);

 });