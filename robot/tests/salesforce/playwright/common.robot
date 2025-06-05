*** Settings ***
Library   Browser
*** Keywords ***
LoginToSalesforce
    [Documentation]    Login to Salesforce
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1820, 'height': 1080}
    New Page     https://login.salesforce.com
    Fill Text    input#username    satish.r177@agentforce.com
    Fill Text    input#password    Agentforce@2025
    Click    input#Login
    Sleep    5s
    Wait For Elements State    div.slds-icon-waffle    visible    timeout=5s
    Get Text    //span[@class='slds-truncate' and text()='Home']    contains    Home
    Get Url        contains    lightning.force.com
    
LogoutSalesforce
    click    //div[contains(@class, 'profileTrigger')]
    Wait For Elements State    a:has-text("Log Out")    visible    timeout=5s
    Click    a:has-text("Log Out")
    Wait For Elements State    input#Login    visible    timeout=5s
    Get Text     input#Login    contains    Log In

ClickOnMainMenu
    [Documentation]    Click on the main menu in Salesforce
    [Arguments]    ${MenuName}
    ${menu_locator}=    Set Variable    //span[@class='slds-truncate' and text()='${MenuName}']
    Wait For Elements State    ${menu_locator}    visible    timeout=5s
    Click    ${menu_locator}

ClickOnNewButton
    [Documentation]    Click on the New Button
    ${new_locator}=    Set Variable    //div[@title='New']
    Wait For Elements State    ${new_locator}    visible    timeout=10s
    Click     ${new_locator}

ClickOnSaveButton
    [Documentation]    Click on the Save Button
    ${save_locator}=    Set Variable    //button[@name='SaveEdit']
    Wait For Elements State    ${save_locator}    visible    timeout=5s
    Click    ${save_locator}

ClickOnNewTaskButton
        [Documentation]    Click on the New Task Button
        ${new_task_locator}=    Set Variable    //div[@title='New Task']
        Wait For Elements State    ${new_task_locator}    visible    timeout=5s
        Click    ${new_task_locator}

Select Dropdown Option
    [Documentation]    Selects an option from a dropdown by field label and option value
    [Arguments]    ${FieldLabel}    ${OptionValue}

    # Wait for and locate the dropdown button
    ${button_locator}=    Set Variable    //button[@aria-label='${FieldLabel}']
    Wait For Elements State    ${button_locator}    visible    timeout=10s

    # Click to open the dropdown
    Click    ${button_locator}

    # Wait for and select the option
    ${option_locator}=    Set Variable    //lightning-base-combobox-item//span[text()='${OptionValue}']
    Wait For Elements State    ${option_locator}    visible    timeout=5s
    Click    ${option_locator}

    # Verify selection (optional but recommended)
    ${selected_text}=    Get Text    ${button_locator}
    Should Be Equal    ${selected_text}    ${OptionValue}    msg=Selected option does not match expected value
