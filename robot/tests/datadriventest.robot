*** Settings ***
Library                    QWeb
Library                    DataDriver             reader_class=TestDataApi    name=Account.xlsx
Resource                   robot/resources/baseclass.robot
Suite Setup                Open Browser           about:blank                 Chrome
Suite Teardown             Close All Browsers
Test Template              Example Test

*** Test Cases ***
Example Test with     ${RecordType} ${Name} ${SLA__c}    ${SLASerialNumber__c}    ${SLAExpirationDate__c}

*** Keywords ***
Example Test
    [Arguments]            ${RecordType}          ${Name}                     ${SLA__c}            ${SLASerialNumber__c}    ${SLAExpirationDate__c}
    [Documentation]       Example test case for creating an account in Salesforce with data-driven approach.
    Login To Salesforce
    LaunchApp             Sales
    ClickText             Accounts
    ClickText              New
    ClickText              ${Record_Type}
    ClickText              Next
    UseModal               On
    TypeText               Account Name           ${Name}
    PickList               SLA                    Gold
    TypeText               SLA Expiration Date    ${SLAExpirationDate__c}
    ClickText              SLA Expiration Date
    ClickText              30
    TypeText               SLA Serial Number      ${SLASerialNumber__c}
    ClickText              Save                   anchor=2
    UseModal               Off
    Set Global Variable    ${CreatedAccount}      ${Name}
    VerifyText             ${CreatedAccount}
