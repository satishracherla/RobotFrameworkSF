*** Settings ***
Library    QWeb     # Import library
Library    SeleniumLibrary

*** Variables ***
    ${URL}    https://qentinelqi.github.io/shop
    ${BROWSER}    chrome
    ${EXPECTED_HEADING}    The animal friendly clothing company
    ${PRODUCT}    Scar the Lion
    ${SIZE}    Large

 *** Keywords ***
    Verify Text
        [Arguments]    ${expected_text}
        Page Should Contain    ${expected_text}

*** Test Cases ***
Basic interaction
    Go To               https://qentinelqi.github.io/shop      chrome   # Open chrome and goto given url
    Verify Text          The animal friendly clothing company            # Assert heading text
    ClickText           Scar the Lion                                   # Click link text
    ClickText           Add to cart                                     # Click *button* with specific text
    DropDown            Size            Large                           # Select value (Large) from dropdown (Size)

Basic interaction1
        [Documentation]    Test basic shopping interactions
        [Setup]    Open Browser    ${URL}    ${BROWSER}

        # Verify page loaded correctly
        Wait Until Page Contains    ${EXPECTED_HEADING}    timeout=10s
        Verify Text    ${EXPECTED_HEADING}

        # Product selection and cart addition
        Click Button        ${PRODUCT}
        Wait Until Element Is Visible    xpath://button[contains(text(),'Add to cart')]
        Click Button    Add to cart

        # Size selection
        Wait Until Element Is Enabled    xpath://select[@id='size' or @name='Size']
        Select dropdown    Size    ${SIZE}

        [Teardown]    Close Browser







