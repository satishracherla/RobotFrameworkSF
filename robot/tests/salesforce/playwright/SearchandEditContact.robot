*** Settings ***
Library   Browser
Resource   ../playwright/common.robot







*** Test Cases ***
Search and Edit Contact
    LoginToSalesforce
    [Tags]    Smoke
    Click    div.slds-icon-waffle
    Click    text=Contacts
    Fill Text    input[aria-label="Search Contacts"]    John Doe
    Press Keys    input[aria-label="Search Contacts"]    Enter
    Click    a:has-text("John Doe")
    Click    button:has-text("Edit")
    Fill Text    input[aria-label="First Name"]    Updated John
    Click    button:has-text("Save")
    Get Text    span.slds-page-header__title    contains    Updated John