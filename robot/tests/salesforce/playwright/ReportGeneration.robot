*** Settings ***
Library   Browser
Resource   ../playwright/common.robot



*** Test Cases ***
Generate Sales Report
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Reports
    Click    button:has-text("New Report")
    Click    span:has-text("Opportunities")
    Click    button:has-text("Create")
    Click    button:has-text("Run Report")
    Get Text    span.slds-page-header__title    contains    Opportunities Report