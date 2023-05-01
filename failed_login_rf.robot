*** Settings ***

Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website

*** Variables ***

${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en

${BROWSER}  Chrome

${LOGIN INPUT}      xpath=//*[@id='login']
${PASSWORD INPUT}       xpath=//*[@id='password']
${SIGN IN BUTTON}       xpath=//*[@type='submit']
${FAILED LOGIN INFO}        xpath=//div[1]/div[3]/span


*** Test Cases ***
Failed to login to the system
    Open login page
    Type in email
    Type in password
    Click on sign in button
    Assert text
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}
Type in email
    Input Text      ${LOGIN INPUT}  user02@getnadanada.com
Type in password
    Input Text      ${PASSWORD INPUT}  Test-1234
Click on sign in button
    Click Element  ${SIGN IN BUTTON}
Assert text
    wait until element is visible  ${FAILED LOGIN INFO}
    Element Text Should Be  ${FAILED LOGIN INFO}    Identifier or password invalid.
    Capture Page Screenshot  alert.png