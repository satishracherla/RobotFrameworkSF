*** Settings ***
Library    SeleniumLibrary
Library    DataDriver
Resource    robot/resources/baseclass.robot
Documentation    Data-driven test case for logging into Salesforce using user credentials from an Excel file.


*** Variables ***
${EXCEL_PATH}    login_users.xlsx
${URL}           https://login.salesforce.com

*** Test Cases ***
Login With Users From Excel
    Open Workbook    ${EXCEL_PATH}
    ${data}=    Read Worksheet As Table    header=True

    FOR    ${row}    IN    @{data}
        ${username}=    Set Variable    ${row['username']}
        ${password}=    Set Variable    ${row['password']}
        Login To Salesforce    ${username}    ${password}
    END
    Close Workbook

