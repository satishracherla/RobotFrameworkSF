*** Settings ***
Documentation    Sample test suite for a robot framework

*** Variables ***
${Message}    Hello, Satish Robot Framework!

*** Test Cases ***
My First Test Case
    [Documentation]    This is a simple test case that prints a message.
    Log    ${Message}pip install robotframework-selenium2screenshots