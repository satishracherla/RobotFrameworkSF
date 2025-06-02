*** Settings ***
Library    CumulusCI
Library           cumulusci.robotframework.CumulusCI
Library           cumulusci.robotframework.Salesforce
Library           cumulusci.robotframework.PageObjects


*** Test Cases ***
Get Chrome Options
    Get Chrome Options
    Locate Element By Title
    Get Page Object
    Current Page Should Be     "Google Search"
    Get Page Object    "Google Search"
    Set Test Metric
    Get Current Record Id
    Click Object Button
    Click Modal Button
    Click Header Field Link
    Click Header Field Link    "Accounts"
    Wait until loading is complete

    