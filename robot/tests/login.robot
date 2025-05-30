*** Settings ***
Documentation    Sample test for login functionality
Library       SeleniumLibrary

*** Variables ***

${username}    satish.r177@agentforce.com
${password}    R.agiliance5#
${Url}    https://login.salesforce.com/


*** Test Cases ***

Login Test
    [Documentation]    Test the login functionality of the application
    Open Browser    ${Url}    chrome
    Input Text    username    ${username}
    Input Text    password    ${password}
    Click Button  Login
  #  Wait Until Page Contains Element    id=welcome-message
    #Close Browser

