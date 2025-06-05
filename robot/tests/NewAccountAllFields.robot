*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Test Cases ***
Create New Account With All Fields
    [Documentation]    Test filling out all fields in the Account creation form

    Open Browser    ${SALESFORCE_URL}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

    # Wait for and click New Account button (adjust selector as needed)
    Wait Until Element Is Visible    css:button[title="New"]
    Click Element    css:button[title="New"]

    # Wait for form to load
    Wait Until Element Is Visible    css:.slds-modal__title

    # Account Information Section
    Input Text    css:input[aria-label="Account Name"]    Robot Framework Test Account
    Select From List By Label    css:select[aria-label="Rating"]    Hot
    Input Text    css:input[aria-label="Phone"]    5551234567
    Input Text    css:input[aria-label="Parent Account"]    Parent Company
    Input Text    css:input[aria-label="Fax"]    5559876543
    Input Text    css:input[aria-label="Account Number"]    ACC123456
    Input Text    css:input[aria-label="Website"]    www.robotframeworktest.com
    Input Text    css:input[aria-label="Account Site"]    Headquarters
    Input Text    css:input[aria-label="Ticker Symbol"]    RFTA
    Select From List By Label    css:select[aria-label="Type"]    Customer - Direct
    Select From List By Label    css:select[aria-label="Ownership"]    Private
    Select From List By Label    css:select[aria-label="Industry"]    Banking
    Input Text    css:input[aria-label="Employees"]    500
    Input Text    css:input[aria-label="Annual Revenue"]    10000000
    Input Text    css:input[aria-label="SIC Code"]    1234

    # Address Information Section
    # Billing Address
    Input Text    css:textarea[aria-label="Billing Street"]    123 Robot St
    Input Text    css:input[aria-label="Billing City"]    Testville
    Select From List By Label    css:select[aria-label="Billing State/Province"]    California
    Input Text    css:input[aria-label="Billing Zip/Postal Code"]    94105
    Select From List By Label    css:select[aria-label="Billing Country"]    United States

    # Shipping Address (same as billing)
    Click Element    css:button[aria-label="Copy Billing Address to Shipping Address"]

    # Additional Information Section
    Select From List By Label    css:select[aria-label="Customer Priority"]    High
    Select From List By Label    css:select[aria-label="SLA"]    Gold
    Input Text    css:input[aria-label="SLA Expiration Date"]    12/31/2025
    Input Text    css:input[aria-label="SLA Serial Number"]    SLA12345
    Input Text    css:input[aria-label="Number of Locations"]    10
    Select From List By Label    css:select[aria-label="Upsell Opportunity"]    Maybe
    Select From List By Label    css:select[aria-label="Active"]    Yes

    # Description Information
    Input Text    css:textarea[aria-label="Description"]    This account was created by Robot Framework automated test

    # Save the account
    Click Button    Save

    # Verify account was created
    Wait Until Element Is Visible    css:div[data-aura-class="forceToastMessage"]
    Element Should Contain    css:div[data-aura-class="forceToastMessage"]    Robot Framework Test Account

    [Teardown]    Close Browser