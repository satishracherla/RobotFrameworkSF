*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../testdata/Testdata.py

*** Keywords ***
Input Username
    Input Text  ${LoginUsernameInputBox}  ${Username}

Input Password
    Input Text  ${LoginPasswordInputBox}  ${Password}

Click Login
    Click Element  ${LoginButton}

