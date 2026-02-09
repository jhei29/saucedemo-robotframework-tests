*** Settings ***
Library  Browser
Library  String
Resource  inventoryLocators.robot

*** Variables ***
${color_after_add}  rgb(226, 35, 26)

*** Keywords ***
Add To Cart Flow
    [Arguments]  ${itemName}
    ${itemLocatorNormalized}  Replace String  ${itemAddToCartButton}  ITEM_NAME  ${itemName}
    Wait For Elements State  ${itemLocatorNormalized}  visible
    Wait For Elements State  ${itemLocatorNormalized}  enabled
    Click  ${itemLocatorNormalized}
    ${textColor}    Get Style    ${itemLocatorNormalized}    color
    Should Be Equal    ${color_after_add}    ${textColor}
    

