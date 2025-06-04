*** Settings ***
Library   Browser
Resource   ../playwright/common.robot

*** Test Cases ***
Create Task for Contact
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Tasks
    ClickOnNewTaskButton
    Fill Text    input[aria-label="Subject"]    Follow-up Call
    Select Options By    label:has-text("Priority")    text    High
    Select Options By    label:has-text("Status")    text    Not Started
    ClickOnSaveButton
    Get Text    span.slds-page-header__title    contains    Follow-up Call