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

const testName = 'EF Web Client Test: Check All Pages in the Application @smoke @happyPath @R91 @critical';

test(testName, async ({ page }, TestInfo) => {
   
    var timestamp = Date.now();
    var localTime = new Date(timestamp);
 
    console.log("Test started...:" + testName + localTime);

    // Navigate to the home page for test
    await navigateToHomePage(page, config.testingUrl); 

    // TO DO: could be passed in as an arg
    await signInAsAuthorizedUser(page, config.userNameQA3);

    // Navigating the Tool related pages
    try {
        // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Tools");
        console.log("Navigate to the Tool Details page for a specific tool");
        await page.getByRole('link', { name: 'AUTOMATION_XRD_TOOL' }).click();
        const screenshotToolPage = await page.screenshot();
        await TestInfo.attach('screenshot-tool-page', { body: screenshotToolPage, contentType: 'image/png' });
        console.log("Navigate to the Tool History page for a specific tool");
        await page.getByRole('button', { name: ' History' }).click();
        console.log("Click the 'Back' button back to Tool Details page");
        await page.getByRole('button', { name: 'Back' }).click();
        console.log("Navigate to the Tool Hardware page for a specific tool");
        await page.getByRole('button', { name: ' Hardware' }).click();
        console.log("Click the 'Back' button back to Tool Details page");
        await page.getByRole('button', { name: 'Back' }).click();
        console.log("Navigate to the Logbook page for a specific tool");
        await page.getByRole('button', { name: ' Logbook' }).click();
        console.log("Click the 'Back' button back to Tool Details page");
        await page.getByRole('button', { name: 'Back' }).click();
        console.log("Click the 'Back' button back to Tool overview page");
        await page.getByRole('button', { name: 'Back' }).click();
    } catch (err) {
        console.log("Error encountered with Tool navigation" + err);
    }

    // Navigating the Box related pages
    try {
         // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Boxes");
        console.log("Search for a box by its name");
        await page.locator('.col-name > .datagrid-inline-filter > .clr-input').fill('automated');
        await page.locator('.col-name > .datagrid-inline-filter > .clr-input').press('Enter');
        console.log("Navigate to the Box > View details page for a specific box");
        await page.getByRole('link', { name: 'B0395' }).click();
        console.log("Navigate to the Box > Transfer details page for a specific box");
        await page.getByRole('button', { name: 'Transfer' }).click();
        console.log("Select same as source box on Transfer screen");
        await page.getByRole('button', { name: 'Same as Source' }).click();
        console.log("Click the 'Back' button back to Box Details page");
        await page.getByRole('button', { name: 'Back' }).click();
        console.log("Click the 'Back' button back to Boxes > Overview page");
        await page.getByRole('button', { name: 'Back' }).click();
    } catch (err) {
        console.log("Error encountered with Box related navigation" + err);
    }

    // Navigating the Substrate related pages
    try {
         // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Substrates");
        // await page.getByRole('row', { name: 'box1001.02 B0396 [2] A New 14.06.2023 Q3 300mm wafer 300 AUTOMATED 106797 - XXX' }).locator('label').click();
        // await page.getByRole('button', { name: 'Update' }).click();
        // await page.locator('#clr-textarea-0').fill('This comment is automated');
        // await page.getByTitle('Save').click();
    } catch (err) {
        console.log("Error encountered with Substrate related navigation" + err);
    }

    // Navigating the Target related pages
    try {
         // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Targets");
    } catch (err) {
        console.log("Error encountered with Target related navigation" + err);
    }

    // Navigating the Collection related pages
    try {
         // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Collections");
    } catch (err) {
        console.log("Error encountered with Collection related navigation" + err);
    }
  
    // Navigating the Project related pages
    try {
         // TO DO: ADD EXPECT TO BE VISIBLE
        await navigateToFromNavigationBar(page, "Projects");
    } catch (err) {
        console.log("Error encountered with Project related navigation" + err);
    }

    // Navigating the Security related pages
    try {
        await navigateToFromNavigationBar(page, "Security");
    } catch (err) {
        console.log("Error encountered with Security related navigation" + err);
    }

    // Navigating the Security related pages
    try {
        await navigateToFromNavigationBar(page, "Security");
    } catch (err) {
        console.log("Error encountered with Security related navigation" + err);
    }


 

    await navigateToFromNavigationBar(page, "Module Types");

    await navigateToFromNavigationBar(page, "Manage Hardware");

    await navigateToFromNavigationBar(page, "Tool Types");

    await navigateToFromNavigationBar(page, "Tool Configuration");

    await navigateToFromNavigationBar(page, "Target Types");

    await navigateToFromNavigationBar(page, "Predefined Types");
   
    await navigateToFromNavigationBar(page, "Settings");

    await navigateToFromNavigationBar(page, "BPS");

    await navigateToFromNavigationBar(page, "EDP");

    await signOut(page);

    await measurePerformance(page, TestInfo);

 });