*** Settings ***
Library           SeleniumLibrary

Library           DataDriver
...               file=C:/Users/satish.r/IdeaProjects/srrobotframework/robot/testdata/leadP22.csv
...               encoding=utf-8
...               dialect=excel

Resource          ../resources/baseclass.robot
Suite Setup       Setup Browser
Suite Teardown    Close Browser
Test Template     Entering A Lead With Data


*** Variables ***
${URL}            https://login.salesforce.com
${USERNAME}       your-username
${PASSWORD}       your-password
${first Name}    ${First Name}
${Last Name}     ${Last Name}
${Phone}         ${Phone}
${Company}       ${Company}
${Website}       ${Website}

*** Test Cases ***
Lead Entry With Data    ${first Name}    ${Last Name}    ${Phone}    ${Company}    ${Website}

*** Keywords ***

Login To Salesforce

Entering A Lead With Data
    [Arguments]    ${First Name}    ${Last Name}    ${Phone}    ${Company}    ${Website}
    
    Click Element    xpath=//span[text()='Sales']
    Click Element    xpath=//span[text()='Leads']
    Wait Until Page Contains    Recently Viewed    timeout=30s

    Click Button    xpath=//div[text()='New']
    Wait Until Page Contains    Lead Information

    # Fill Modal Fields
    Input Text    xpath=//input[@name='firstName']    ${First Name}
    Input Text    xpath=//input[@name='lastName']     ${Last Name}
    Select From List By Label    xpath=//lightning-combobox[@name='Status']//select    Working
    Input Text    xpath=//input[@name='Phone']        ${Phone}
    Input Text    xpath=//input[@name='Company']      ${Company}
    Input Text    xpath=//input[@name='Website']      ${Website}

    Click Element    xpath=//label[text()='Lead Source']/following::input[1]
    Click Element    xpath=//span[text()='Advertisement']

    Click Button    xpath=//button[@name='Save']
    Sleep    1s

    # Delete Lead - Clean up
    Click Element    xpath=//span[text()='Leads']
    Wait Until Page Contains    Recently Viewed    timeout=30s

    Click Element    xpath=//a[text()='${First Name} ${Last Name}']
    Click Element    xpath=//button[@name='Delete']
    Click Element    xpath=//button[@title='Delete']
    Wait Until Page Contains    Recently Viewed
    Page Should Not Contain    ${First Name}
    Page Should Not Contain    ${Last Name}
