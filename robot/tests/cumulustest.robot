*** Settings ***
Library           cumulusci.robotframework.CumulusCI
Library           cumulusci.robotframework.Salesforce
Library           cumulusci.robotframework.PageObjects
#Library           cumulusci.robotframework.Builtin

Suite Setup       Run Task    robot_test_setup
Suite Teardown    Run Task    robot_test_teardown

*** Variables ***
${CONTACT_NAME}      Test Contact
${CONTACT_LASTNAME}  Robot
${CONTACT_EMAIL}     robot@example.com

*** Test Cases ***
Create And Verify Contact In Salesforce
    [Documentation]    Demonstrates usage of core CumulusCI keywords.

    # CumulusCI Keywords
    Log CumulusCI Version
    Run Task    deploy_pre
    Run Task    deploy_post
    Run Task    run_tests
    Run Task    data_load
    Run Task    robot_test_setup

    # Salesforce Library Keywords
    Salesforce Login
    Salesforce Insert    Contact    FirstName=${CONTACT_NAME}    LastName=${CONTACT_LASTNAME}    Email=${CONTACT_EMAIL}
    ${contact}=    Salesforce Get    Contact    LastName=${CONTACT_LASTNAME}
    Log    Contact Created: ${contact[Email]}

    # PageObjects (if using browser-based UI tests)
    Open Test Browser
    Load Page Object    Contact    New
    Current Page Should Be    Contact    New

    Fill Field    First Name    ${CONTACT_NAME}
    Fill Field    Last Name     ${CONTACT_LASTNAME}
    Click Button    Save

    Page Should Contain    ${CONTACT_NAME} ${CONTACT_LASTNAME}

    # Cleanup
    Run Task    robot_test_teardown
