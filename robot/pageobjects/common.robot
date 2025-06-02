*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../testdata/Testdata.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser  ${site_url}  ${browser}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5