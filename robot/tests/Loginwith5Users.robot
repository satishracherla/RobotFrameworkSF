*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://login.salesforce.com
${BROWSER}     chrome

@{USERS}
...    user1@example.com, password1
...    user2@example.com, password2
...    user3@example.com, password3
...    user4@example.com, password4
...    user5@example.com, password5

# Locators
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      id=Login

*** Test Cases ***
Login With All Users
    FOR    ${user_data}    IN    @{USERS}
        ${username}=    Set Variable    ${user_data.split('=')[0]}
        ${password}=    Set Variable    ${user_data.split('=')[1]}
        Login To Salesforce    ${username}    ${password}
    END

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

    Wait Until Element Is Enabled       ${LOGIN_BUTTON}    timeout=10s
    Click Button    ${LOGIN_BUTTON}

    Sleep    2s    # Add actual validation as needed
    Close Browser
