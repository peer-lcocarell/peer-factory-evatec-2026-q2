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

const { signInAsAuthorizedUser, navigateToHomePage, navigateToFromNavigationBar, measurePerformance, signOut } = require("./common-methods.js");

const config = require("../configuration/config.json");

const testName = 'EF Web Client Test: Create a new private collection, add substrates to it, share it with a user @smoke @happyPath @R91';

const toolId = config.cassetteToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);
    await page.locator('#navmenuitem-collections').getByRole('link', { name: 'Collections' }).click();
    await page.getByRole('button', { name: 'New' }).click();
    await page.locator('#clr-input-2').click();

    // Add a unique generated name to the collection
    var isoDateString = new Date().toISOString();
    console.log(isoDateString);
    let currentDate = isoDateString;
    let generatedCollectionName = 'COLLECTION_AUTOMATED.R9.1_' + currentDate;
    console.log('The Generated Collection Name: ' + generatedCollectionName);
    console.log('Adding a name...') 
    await page.locator('#clr-input-2').fill(generatedCollectionName);

    // Add shared with user to collection
    console.log('Add shared with user to collection...')
    await page.locator('#clr-combobox-1-combobox').getByRole('button', { name: 'Show options' }).first().click();
    await page.getByRole('option', { name: 'Lev Cocarell (LC)' }).click();
    // await page.getByRole('option', { name: 'Nicola Basley (NB)' }).click();
    await page.locator('.popover-overlay').click();

    // Add a tag
    console.log('Adding a tag...')
    await page.locator('#clr-combobox-0-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'AUTOMATED' }).click();
    await page.locator('.popover-overlay').click();

    // Add a description
    console.log('Adding a description...')
    await page.locator('#clr-textarea-0').click();
    await page.locator('#clr-textarea-0').fill('This is a collection that was auto generated on ' + currentDate);
    await page.locator('.clr-col > .minimizable-panel-content').click();

    // Add substrates from the dialogue
    // Note: Currently it just grabs the latest subs (first two), but I can get it to grab specific ones
    console.log('Add the substrates to the collection...')
    await page.getByRole('button', { name: 'Add' }).click();
    await page.locator('td:nth-child(2) > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label').first().click();
    await page.locator('tr:nth-child(3) > .row-selector-col > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label').first().click();
    await page.getByTitle('Add', { exact: true }).click();

    // Close the dialogue
    await page.getByTitle('Close').click();

    // Save the collection
    await page.getByRole('button', { name: 'Save' }).first().click();

    // Take a screen shot that the collection was valid
    const screenshot = await page.screenshot();
    await TestInfo.attach('screenshot', { body: screenshot, contentType: 'image/png' });

    // Click back
    await page.getByRole('button', { name: 'Back' }).click();
 
    

    await signOut(page);
  
    await measurePerformance(page, TestInfo);

 });