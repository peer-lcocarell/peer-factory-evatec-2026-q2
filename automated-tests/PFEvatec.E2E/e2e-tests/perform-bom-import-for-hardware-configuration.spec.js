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
    
    await page.locator('#navmenuitem-tools').getByRole('link', { name: 'Tools' }).click();
    await page.getByRole('link', { name: 'AUTOMATION_FOUP_TOOL' }).click();
    await page.getByRole('button', { name: ' Hardware' }).click();
    await page.getByRole('cell', { name: 'SPM6' }).click();
    await page.getByRole('button', { name: 'All' }).click();
    await page.getByRole('row', { name: 'Logbook - Role - Active Hardware Change Hardware Component 1:1' }).getByRole('button', { name: 'Change Hardware Component' }).click();
    await page.locator('.modal-footer > div > button:nth-child(3)').click();
    await page.getByRole('button', { name: 'Import' }).click();
    await page.getByPlaceholder('Search BPS #').click();
    await page.getByPlaceholder('Search BPS #').fill('V315015 ');
    await page.getByRole('button', { name: 'Advanced BPS Search' }).click();
    await page.getByRole('button', { name: 'Import BOM' }).click();
    await page.getByRole('button', { name: 'Save' }).click();
    await page.getByRole('button', { name: 'Back' }).click();
    await page.getByRole('button', { name: 'Back' }).click();


    await signOut(page);

  
    await measurePerformance(page, TestInfo);

 });