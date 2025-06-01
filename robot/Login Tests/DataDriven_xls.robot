*** Settings ***
Library             DataDriver    DataDriven.xls
Resource            login_resources.robot

Suite Setup         Open my Browser
Suite Teardown      Close Browsers
Test Setup          Open Login Page
Test Template       Login To Salesforce


*** Test Cases ***
Login To Salesforce '${username}' and '${password}'    Default    UserData


*** Keywords ***
Login To Salesforce
    [Tags]    flat
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input Password    ${password}
    click login button
    Error page should be visible
