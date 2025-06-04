*** Settings ***
Library   Browser
Resource   ../playwright/common.robot



*** Test Cases ***
Create New Opportunity
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Opportunities
    ClickOnNewButton
    Fill Text    input[aria-label="Opportunity Name"]    Test Opportunity
    Fill Text    input[aria-label="Amount"]    10000
    Select Options By    label:has-text("Stage")    text    Prospecting
    ClickOnSaveButton
    Get Text    //lightning-formatted-text[@slot='primaryField']    ==    Test Opportunity