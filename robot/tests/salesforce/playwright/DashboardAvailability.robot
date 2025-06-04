*** Settings ***
Library   Browser
Resource   ../playwright/common.robot


*** Test Cases ***
Verify Sales Dashboard Loads
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Dashboards
    Click    a:has-text("Sales Performance")
    Get Text    h1.slds-page-header__title    ==    Sales Performance