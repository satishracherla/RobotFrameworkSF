*** Settings ***
Library                         SeleniumLibrary

*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${initial_sleep_time}           5
${BROWSER}                      chrome
${username}                     satish.r177@agentforce.com
${password}                     Agentforce@2025
${login_url}                    https://login.salesforce.com                            # Salesforce instance
${home_url}                     ${login_url}/lightning/page/home

*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
   # Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
 #   Set Selenium Speed          30s                         #sometimes salesforce is slow

End suite
    Close All Browsers

Disable Notifications In Chrome And Launch
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications

    &{prefs}=    Create Dictionary    profile.default_content_setting_values.notifications=2
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Create Webdriver    Chrome    options=${options}

Login
    [Documentation]             Login to Salesforce instance
    Disable Notifications In Chrome And Launch
    Go To                          ${login_url}
    Maximize Browser Window
    Input Text                  username                    ${username}                 delay=1
    Input Text                  password                    ${password}
    Click Button                Log In

Home
    [Documentation]             Navigate to homepage, login if needed
    Go To                      ${home_url}
    ${login_status}=            Set Test Message           To access this page, you have to log in to Salesforce.               2
    Run Keyword If              ${login_status}             Login

Generate Unique Account Name
    [Documentation]             Generates a unique account name using random number
    ${random}=                  Evaluate                    random.randint(1000, 9999)                              random
    ${account_unique_name}=     Set Variable                Account_${random}
    Set Suite Variable          ${account_unique_name}

Generate Unique Contact Name
    [Documentation]             Generates a unique account name using random number
    ${random}=                  Evaluate                    random.randint(1000, 9999)                              random
    ${lead_contact_name}=       Set Variable                Contact_${random}
    Set Suite Variable          ${lead_contact_name}
Generate Unique Lead Name
    [Documentation]             Generates a unique account name using random number
    ${random}=                  Evaluate                    random.randint(1000, 9999)                              random
    ${lead_unique_name}=        Set Variable                Lead_${random}
    Set Suite Variable          ${lead_unique_name}

Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s

Switch To Classic If Lightning
    [Documentation]             Attempts to switch to Salesforce Classic if the current interface is Lightning.
    ${view_profile_visible}=    Run Keyword And Return Status                           Click Text                  text=View profile    timeout=2
    Run Keyword If              ${view_profile_visible}     Check And Switch To Classic

Check And Switch To Classic
    ${is_lightning}=            Is Text                     text=Switch to Salesforce Classic                       timeout=2
    Run Keyword If              ${is_lightning}             Click Text                  text=Switch to Salesforce Classic

Waiting
    Sleep                       2

Login To Salesforce
    [Arguments]    ${username}    ${password}

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications

    &{prefs}=    Create Dictionary    profile.default_content_setting_values.notifications=2
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window

    Wait Until Element Is Visible    id=username    timeout=10s
    Input Text    id=username    ${username}

    Wait Until Element Is Visible    id=password    timeout=10s
    Input Text    id=password    ${password}

    Wait Until Element Is Enabled        id=Login    timeout=10s
    Click Button    id=Login

    Sleep    2s
    Close Browser



