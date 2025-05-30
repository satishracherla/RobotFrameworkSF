*** Settings ***
Resource                        ../resources/baseclass.robot
Library                         OperatingSystem
Library                         DateTime
Library                         SeleniumLibrary


Documentation                   Test suite for Salesforce Account creation and management

Suite Setup                     Open Browser    about:blank    chrome    options=add_argument("--start-maximized")
#Suite Teardown                  Close All Browsers

*** Variables ***
${PHONE_NUMBER}                +1-415-555-1234
${WEBSITE}                     www.copadotesting.com
${INDUSTRY}                    Technology
${EMPLOYEES}                   500
${ANNUAL_REVENUE}             1000000
${NEW_BUTTON_XPATH}           xpath=//button[@title='New']
${TIMEOUT}                    20s
${Accounts_TAB_XPATH}         //a[@title='Accounts']

*** Test Cases ***
Create Account Contact And Export Report
    [Documentation]             Creates Account and Contact, generates Account report and exports to CSV
    [Tags]                      salesforce    account    contact    regression

    # Initialize and generate unique names
    Login
    Home
    Generate Unique Account Name
    Generate Unique Contact Name

    # Navigate to Accounts section
  #  Wait Until Element Is Visible    ${NEW_BUTTON_XPATH}    timeout=${TIMEOUT}
   # Click Element                    ${NEW_BUTTON_XPATH}
    #Click Link                       Sales

    # Navigate to Accounts tab
    Wait Until Element Is Visible    ${Accounts_TAB_XPATH}    ${TIMEOUT}
    Wait Until Element Is Clickable    ${Accounts_TAB_XPATH}    ${TIMEOUT}
    Click Link                         ${Accounts_TAB_XPATH}

    # Create new Account
    Wait Until Element Is Clickable    New    ${TIMEOUT}
    Click Link                           New

    # Fill Account Details
    Wait Until Page Contains Element    text=*Account Name    ${TIMEOUT}
    Input Text    *Account Name          ${account_unique_name}
    Input Text    Phone                  ${PHONE_NUMBER}
    Input Text    Website                ${WEBSITE}
    Select From List By Value        Industry               ${INDUSTRY}
    Input Text    Employees              ${EMPLOYEES}
    Input Text        Annual Revenue         ${ANNUAL_REVENUE}

    # Save Account
    Wait Until Element Is Clickable    text=Save    timeout=${TIMEOUT}
    Click Link        Save    partial_match=False

    # Verify Account Creation
    Wait Until Page Contains    ${account_unique_name}    timeout=${TIMEOUT}
    Click Link        Accounts
    Page Should Contain        ${account_unique_name}

*** Keywords ***
Wait Until Element Is Clickable
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}

