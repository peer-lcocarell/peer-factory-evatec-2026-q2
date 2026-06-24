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

const testName = 'EF Web Client Test: Connect Existing XRD File Tool @smoke @happyPath @R91';

const toolId = config.fileToolId;

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
   
    console.log('Filtering for the XRD file tool...');

  


    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').click();

    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').fill('automation');

    await page.locator('.col-name > .datagrid-inline-filter > .clr-input').press('Enter');

    await page.getByRole('link', { name: 'MT2658' }).click();

    await page.getByRole('button', { name: ' Connect' }).click();

    await page.getByRole('button', { name: 'Back' }).click();


    await signOut(page);

  
    await measurePerformance(page, TestInfo);

 });