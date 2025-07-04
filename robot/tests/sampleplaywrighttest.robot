*** Settings ***
Library   Browser

Suite Setup     New Browser    chromium    headless=False
Suite Teardown  Close Browser

*** Keywords ***
Example Test
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright

Open Google And Check Title
    New Context
    New Page    https://www.google.com
    ${title}=   Get Title
    Log    Page title is: ${title}
    Should Contain    ${title}    Google

*** Test Cases ***
Example Playwright Test
    New Page    https://airtel.in
