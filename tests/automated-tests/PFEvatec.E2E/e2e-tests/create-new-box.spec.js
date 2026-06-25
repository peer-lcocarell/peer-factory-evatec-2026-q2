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

const testName = 'EF Web Client Test: Create a new box from BPS @smoke @happyPath @R91';

const toolId = config.cassetteToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);

    await page.locator('#navmenuitem-boxes').getByRole('link', { name: 'Boxes' }).click();

    await page.getByRole('button', { name: 'New' }).click();

    await page.getByText('Define substrates manually').click();

    await page.locator('.btn').first().click();
    await page.locator('#clr-input-2').click();
    await page.locator('#clr-input-2').click();
    await page.locator('#clr-input-2').fill('box1002');

    await page.locator('#clr-input-2').press('Enter');
    
    await page.locator('#clr-combobox-0').fill('0');
    await page.locator('#clr-combobox-0').click();
    await page.locator('#clr-combobox-0').fill('0');
    await page.getByRole('option', { name: '106797 - XXX' }).click();
    await page.locator('#blazority-popover-23').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'AUTOMATION' }).click();
    await page.locator('#clr-input-4').click();
    await page.locator('#clr-input-4').fill('comment');
    await page.locator('#blazority-id-f019e30d08b641529e0561740d964dfb-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: 'FOUP' }).click();
    await page.locator('#blazority-id-efc1879b86784348b5b3a744d573ffac-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: ' 300' }).click();
    await page.locator('#clr-combobox-3-combobox').getByRole('button', { name: 'Show options' }).click();
    await page.getByRole('option', { name: '300mm wafer', exact: true }).click();
    await page.getByRole('button', { name: 'Add Substrate to all empty slots' }).click();
    await page.getByRole('button', { name: 'Save' }).click();
    await page.getByRole('button', { name: 'Back' }).click();



    // Take a screen shot that the collection was valid
    const screenshot = await page.screenshot();
    await TestInfo.attach('screenshot', { body: screenshot, contentType: 'image/png' });


    // await signOut(page);
  
    await measurePerformance(page, TestInfo);

 });