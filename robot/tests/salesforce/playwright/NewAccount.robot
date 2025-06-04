*** Settings ***
Library   Browser
Library    FakerLibrary
Resource   ../playwright/common.robot

*** Test Cases ***
Create New Account in Sales Cloud
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Accounts
    ClickOnNewButton
    ${name}=  FakerLibrary.name
    Fill Text    //input[@name='Name']    ${name}
    ClickOnSaveButton
    Get Text    //lightning-formatted-text[@slot='primaryField']    ==    ${name}