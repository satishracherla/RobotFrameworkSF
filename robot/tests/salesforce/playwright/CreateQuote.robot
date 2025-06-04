*** Settings ***
Library   Browser
Resource   ../playwright/common.robot


*** Test Cases ***
Create and Send Quote
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Quotes
    ClickOnNewButton
    Fill Text    input[aria-label="Quote Name"]    Annual Subscription
    ClickOnSaveButton
    Fill Text    input[aria-label="Email"]    client@example.com
    Click    button:has-text("Send")
    Get Text    div.forcePageMessage    contains    Quote sent successfully