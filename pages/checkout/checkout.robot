*** Settings ***
Library  Browser
Resource  checkoutLocators.robot

*** Keywords ***
Proceed to Chekout Form Flow
    Wait For Elements State  ${checkoutButton}  visible
    Wait For Elements State  ${checkoutButton}  enabled
    Click  ${checkoutButton}

Fill Out Checkout Form Flow
    [Arguments]  ${firstName}  ${lastName}  ${postalCode}
    Fill Text  ${firstNameTextBox}  ${firstName}
    Fill Text  ${lastNameTextBox}  ${lastName}
    Fill Text  ${postalCodeTestBox}  ${postalCode}

Finish Checkout Flow And Verify
    Wait For Elements State  ${continueButton}  visible
    Wait For Elements State  ${continueButton}  enabled
    Click  ${continueButton}
    Wait For Elements State  ${finishButton}  visible
    Wait For Elements State  ${finishButton}  enabled
    Click  ${finishButton}    
    Wait For Elements State  ${completeOrderText}  visible
    Hover  ${completeOrderText}