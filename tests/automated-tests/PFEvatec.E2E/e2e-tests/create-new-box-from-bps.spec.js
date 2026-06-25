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

const testName = 'EF Web Client Test: Create a new box from BPS @smoke @happyPath @R91';

const toolId = config.cassetteToolId;

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);

 
    let generatedBoxName = 'box192';


  
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);

    await page.locator('#navmenuitem-boxes').getByRole('link', { name: 'Boxes' }).click();
    await page.getByRole('button', { name: 'New' }).click();
    await page.getByText('Select by BPS Number').click();
    await page.getByText('117713 BPS #117713 BPS NameSilicon Wafer 4" <100> 525, 7-21 Ohm*cm (25 pcs)').click();
    await page.locator('.btn').first().click();
    await page.locator('#clr-input-2').click();
    await page.locator('#clr-input-2').fill(generatedBoxName);
    await page.locator('#clr-input-2').press('Enter');
    await page.locator('#clr-combobox-0').fill('m');
    await page.getByRole('option', { name: '3019622 - Sampling_Silex SE_CLN2_17_MSQ contamination tests' }).click();
    await page.locator('#blazority-popover-9').getByRole('combobox').click();
    // await page.locator('#clr-input-3').click();
    await page.locator('#clr-input-3').fill('123');
    // await page.locator('#clr-input-4').click();
    await page.locator('#clr-input-4').fill('this box was');
    await page.getByText('Resistivity (O cm)7 - 21').click();
    await page.getByRole('button', { name: 'Save' }).click();
    await page.getByRole('button', { name: 'Back' }).click();


    await signOut(page);
  
    await measurePerformance(page, TestInfo);

 });