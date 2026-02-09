*** Settings ***
Library  Browser

*** Keywords ***

Go To Page Using Session Cookies
    [Arguments]  ${baseUrl}  ${destinationUrl}  ${session_name}  ${username}
    New Browser  chromium  False
    New Page  ${baseUrl}
    Add Cookie  ${session_name}  ${username}  ${baseUrl}
    Go To  ${destinationUrl}