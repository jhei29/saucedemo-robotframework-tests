*** Settings ***
Resource  ../resources/browser-resource.robot
Resource  ../pages/common/common.robot
Resource  ../pages/inventory/inventory.robot
Resource  ../pages/header/header.robot
Resource  ../pages/checkout/checkout.robot
Task Tags  checkoutTests

*** Variables ***
${test_01_item}   Sauce Labs Backpack
${test_01_firstName}  Drake
${test_01_lastName}  Maye
${test_01_postalCode}  1230

*** Test Cases ***
Web Test
    Initialize Browser And Context
    Checkout Workflow Test

Checkout Workflow Test in Iphone 12
    [Tags]   mobileTest
        # iPhone 12 resolution: 1170x2532, but typically viewport is smaller
        Initialize Browser And Context  {'width': 390, 'height': 844}
        Checkout Workflow Test

*** Keywords ***
Checkout Workflow Test
    Initialize Browser And Context
    Go To Page Using Session Cookies  ${loginPageUrl}  ${inventoryPageUrl}  ${sessionNameToUse}  ${usernameToUse}
    Add To Cart Flow  ${test_01_item} 
    Go To Checkout Page
    Proceed to Chekout Form Flow
    Fill Out Checkout Form Flow  ${test_01_firstName}  ${test_01_lastName}  ${test_01_postalCode}
    Finish Checkout Flow And Verify