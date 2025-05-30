*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://login.salesforce.com/
${BROWSER}             chrome
${username}            satish.r177@agentforce.com
${password}            Agentforce@2025

# Locators - Replace these with actual values
${USERNAME_FIELD}      xpath=//input[@id='username']
${PASSWORD_FIELD}      id=password
${LOGIN_BUTTON}        id=Login
${DASHBOARD_HEADER}    xpath=//h1[text()='Dashboard']
${MENU_ICON}           xpath=//div[@class='menu-icon']
${PROFILE_LINK}        link=Profile

*** Test Cases ***
Disable Notifications In Chrome And Launch
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications

    &{prefs}=    Create Dictionary    profile.default_content_setting_values.notifications=2
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    # Add your login or test steps here

    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}

    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=10s
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}

    Wait Until Element Is Enabled    ${LOGIN_BUTTON}    timeout=10s
    Click Element    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${DASHBOARD_HEADER}    timeout=10s
    Log    Login successful, dashboard loaded.

    Wait Until Element Is Enabled    ${MENU_ICON}    timeout=10s
    Click Element    ${MENU_ICON}

    Wait Until Element Is Enabled    ${PROFILE_LINK}    timeout=10s
    Click Link    ${PROFILE_LINK}

    Log    Navigated to profile page.

   # [Teardown]    Close Browser
