*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.ebay.com

*** Keywords ***
Print eBay Autocomplete Suggestions
    [Arguments]    ${SEARCH_TERM}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=gh-ac    timeout=10s
    Press Keys    id=gh-ac    ${SEARCH_TERM}
   # Input Text    id=gh-ac    ${SEARCH_TERM}
    Sleep    2s    # Let autocomplete load
    Wait Until Page Contains Element    xpath=//ul[@id='ebay-autocomplete']//li[contains(@class, 'gh-evo')]    timeout=50s
    ${items}=    Get WebElements    xpath=//ul[@id='ebay-autocomplete']//li[contains(@class, 'gh-evo')]
    FOR    ${item}    IN    @{items}
    ${text}=    Get Text    ${item}
    Log    ${text}
    END
    Close Browser    # Close the browser after printing suggestions

*** Test Cases ***
Print Autocomplete Suggestions for Mobile
    Print eBay Autocomplete Suggestions    mobile
Print Autocomplete Suggestions for laptop
    Print eBay Autocomplete Suggestions    laptop
Print Autocomplete Suggestions for camera
    Print eBay Autocomplete Suggestions    camera
