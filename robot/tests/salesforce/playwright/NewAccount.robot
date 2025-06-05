*** Settings ***
Library    FakerLibrary
Resource   ../playwright/common.robot
Library    FakerLibrary    WITH NAME    faker

*** Test Cases ***
New Account Creation

#Create New Account in Sales Cloud
    [Tags]    Smoke
    LoginToSalesforce
        FOR    ${index}    IN RANGE    1    11
            New Account Creation
        END

*** Keywords ***
New Account Creation
    ClickOnMainMenu    Accounts
    ClickOnNewButton
    ${number}=    FakerLibrary.Random Number    # Generate a random account number
    ${account_name}=    FakerLibrary.Name    # Generate a random account name
    Fill Text    //input[@name='Name']    ${account_name}_${number}
    Wait For Elements State    //button[@aria-label='Rating']    visible
    Select Dropdown Option    Rating    Hot
    ${phone}=    Faker.Phone Number
    Log    Generated phone number: ${phone}  # Generate a random phone number
    Fill Text    //input[@name='Phone']    ${phone}
    #Fill Text    //lightning-grouped-combobox[@class='slds-form-element']    Parent Company
    Fill Text    //input[@name='Fax']   5559876543
    Fill Text    //input[@name='AccountNumber']    ${number}
    Fill Text    //input[@name='Website']    www.robotframeworktest.com
    Fill Text    //label[text()='Account Site']    Headquarters
    Fill Text    //label[text()='Ticker Symbol']    RFTA
    Select Dropdown Option    Type    Prospect
    Select Dropdown Option    Ownership    Private
    Select Dropdown Option    Industry    Banking
    Fill Text    //input[@name='NumberOfEmployees']    500
    Fill Text    //input[@name='AnnualRevenue']    10000000
    Fill Text    //input[@name='Sic']    1234
    
        # Address Information Section
        # Billing Address
    Fill Text    //label[text()='Billing Street']    123 Robot St
    Fill Text    //label[text()='Billing City']    Testville
    #Select Dropdown Option    Billing State/Province    California
    Fill Text    //label[text()='Billing Zip/Postal Code']    94105
    #Select Dropdown Option    Billing Country    United States
    
        # Shipping Address (same as billing)
    #Click    css:button[aria-label="Copy Billing Address to Shipping Address"]
    
        # Additional Information Section
    Select Dropdown Option    Customer Priority    High
    Select Dropdown Option    SLA   Gold
    Fill Text    //label[text()='SLA Expiration Date']    12/31/2025
    Fill Text    //label[text()='SLA Serial Number']    SLA12345
    Fill Text    //label[text()='Number of Locations']    10
    #Select Dropdown Option    Upsell Opportunity    Maybe
    #Select Dropdown Option    Active    Yes
    
        # Description Information
    Fill Text    //label[text()='Description']    This account was created by Robot Framework automated test
    # Save the account
    ClickOnSaveButton
    Sleep    5s
    Get Text    //lightning-formatted-text[@slot='primaryField']    ==    ${account_name}_${number}
    Sleep    5s