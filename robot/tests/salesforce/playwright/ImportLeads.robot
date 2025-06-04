*** Settings ***
Library   Browser
Resource   ../playwright/common.robot







*** Test Cases ***
Bulk Import Leads
    [Tags]    Smoke
    LoginToSalesforce
    ClickOnMainMenu    Leads
    Click    button:has-text("Import Leads")
    Upload File By Selector        input[type="file"]    ${CURDIR}/testdata/leadP22.csv
    Click    button:has-text("Next")
    Click    button:has-text("Next")
    Click    button:has-text("Import Now")
    Get Text    div.slds-m-top_medium    contains    Your import has been submitted