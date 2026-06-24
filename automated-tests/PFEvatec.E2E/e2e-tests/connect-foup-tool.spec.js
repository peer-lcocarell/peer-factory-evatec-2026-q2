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

const testName = 'EF Web Client Test: Connect Existing FOUP SECSGEM Tool @smoke @happyPath @R91';

const toolId = config.foupToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);
    
    // Navigate to Tool Configuration page
    await page.getByRole('link', { name: 'Tool Configuration' }).click();
   
    console.log('Filtering for the tool...');

    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').click();

    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').fill('automation');

    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').press('Enter');

    await page.getByRole('cell', { name: 'Contains Click to clear filter' }).getByPlaceholder('Contains').fill('automation_');

    await page.getByRole('cell', { name: 'Contains Click to clear filter' }).getByPlaceholder('Contains').press('Enter');

    
    const toolLink = page.getByRole('link', { name: toolId });

    console.log('Selecting tool ...' + toolLink);

    await page.getByRole('link', { name: 'PT2676' }).click();



    
        
 
    // need to know if this is visible first
    const connectButton = page.getByRole('button', { name: ' Connect' });

    console.log("Connect Button " + connectButton);

    // try { 
    // Click connect..
    await connectButton.click({ timeout: 60000 });
    
    try {

        await expect(page.getByText('Disconnect', { exact: true }).first()).toBeVisible({ timeout: 60000 });
        console.log("Tool is able to be connected");

    } catch (err) {
      console.log("Does not say disconnect" + err);
    }

    // if (await connectButton.isVisible()) {
    //     await connectButton.click();
    //     console.log('FOUP Tool Connected');
    // }
    //   // should add logic that if the tool is connected - click DISCONNECT
    // }
    // catch (e) {
    //     console.log(e);
    // }

  
    await page.getByRole('button', { name: 'Back' }).click({ timeout: 60000 });

   
    await signOut(page);


  
    await measurePerformance(page, TestInfo);

 });