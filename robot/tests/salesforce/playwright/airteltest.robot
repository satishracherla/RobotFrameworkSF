*** Settings ***
Library   Browser


*** Test Cases ***
Airtel locator test
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page     https://airtel.in
    Sleep    5s
    Wait For Elements State    //div[@class='wt-nd-c ']/div/label[text()='Wi-Fi']    visible
    Hover    //div[@class='wt-nd-c ']/div/label[text()='Wi-Fi']
    Wait For Elements State    //label[@class='wt-typography'and text()='Pay Bill / Recharge']    visible
    Click    //label[@class='wt-typography'and text()='Pay Bill / Recharge']
    Wait For Elements State    //label[@class='broadband-label']    visible
    Get Text    //label[@class='broadband-label']    contains    Enter your details below
