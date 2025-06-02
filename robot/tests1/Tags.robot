*** Settings ***
Documentation  Tags in Robot Framework

*** Variables ***
[Arguments]  ${first}  ${second}  ${third}

*** Test Cases ***
Test Case 1
    [Tags]      Smoke
    ${first}=  Set Variable  First variable value
    Log To Console  This is test case 1 ${first}

Test Case 2
    [Tags]  Regression
    ${second}=  Set Variable  Second variable value
    Log To Console  This is test case 2 ${second}

Test Case 3
    [Tags]  Regression
    ${third}=  Set Variable  Third variable value
    Log To Console  This is test case 3 ${third}

Test Case 4
    [Tags]  Smoke
    Log To Console  This is test case 4

Test Case 5
    [Tags]  Sanity
    Log To Console  This is test case 5

Test Case 6
    Log To Console  This is test case 6

*** Keywords ***