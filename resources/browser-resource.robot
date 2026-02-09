*** Settings ***
Library  Browser

*** Keywords ***

Initialize Browser And Context
    [Arguments]  ${viewport}=None
    New Browser  chromium  False
    New Context  viewport=${viewport}

Go To Page Using Session Cookies
    [Arguments]  ${baseUrl}  ${destinationUrl}  ${session_name}  ${username}
    New Page  ${baseUrl}
    Add Cookie  ${session_name}  ${username}  ${baseUrl}
    Go To  ${destinationUrl}