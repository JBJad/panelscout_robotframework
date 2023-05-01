*** Settings ***

Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website

*** Variables ***

${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en

${BROWSER}  Chrome

${LOGIN INPUT}      xpath=//*[@id='login']
${PASSWORD INPUT}       xpath=//*[@id='password']
${SIGN IN BUTTON}       xpath=//*[@type='submit']
${LOGO}     xpath=//main/div[3]/div[1]/div/div[1]


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on sign in button
    Assert dashboard
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}  ${BROWSER}
Type in email
    Input Text      ${LOGIN INPUT}  user02@getnada.com
Type in password
    Input Text      ${PASSWORD INPUT}  Test-1234
Click on sign in button
    Click Element  ${SIGN IN BUTTON}
Assert dashboard
    wait until element is visible  ${LOGO}
    Title Should Be  Scouts panel
    Capture Page Screenshot  alert.png