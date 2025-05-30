*** Settings ***
Documentation    Common keywords for various test cases of Salesforce
Library       SeleniumLibrary

*** Variables ***

${LOGIN_BUTTON}        id=Login

*** Keywords ***

click login button
    [Documentation]    Clicks the login button on the page
    Wait Until Element Is Enabled    ${LOGIN_BUTTON}    timeout=10s
    Click Element    ${LOGIN_BUTTON}

Open chrome Browser
    [Documentation]    Opens the Chrome browser with specified options
    Open Browser    about:blank    chrome    options=add_argument("--start-maximized")