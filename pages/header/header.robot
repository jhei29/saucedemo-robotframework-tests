*** Settings ***
Library  Browser
Resource  headerLocators.robot

*** Keywords ***
Go To Checkout Page
    Click  ${shoppingCartButton}