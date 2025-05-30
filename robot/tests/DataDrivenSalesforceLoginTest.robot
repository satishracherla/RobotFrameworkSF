*** Settings ***
Library           SeleniumLibrary
Test Template     Login To Salesforce

*** Variables ***
${BROWSER}        chrome
${URL}            https://login.salesforce.com

# Locators - Replace with actual values if needed
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      id=Login

*** Test Cases ***
Login With User 1    user1@example.com    password1
Login With User 2    user2@example.com    password2
Login With User 3    user3@example.com    password3
Login With User 4    user4@example.com    password4
Login With User 5    user5@example.com    password5

*** Keywords ***
Login To Salesforce
    [Arguments]    ${username}    ${password}

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications

    &{prefs}=    Create Dictionary    profile.default_content_setting_values.notifications=2
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window

    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${username}

    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=10s
    Input Text    ${PASSWORD_FIELD}    ${password}

    Wait Until Element Is Enabled      ${LOGIN_BUTTON}    timeout=10s
    Click Button    ${LOGIN_BUTTON}

    Sleep    3s    # Optional - wait for login to complete or validate success here

    Close Browser
