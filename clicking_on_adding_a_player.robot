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
${ADDING A PLAYER HYPERLINK}        xpath=//div[2]/div/div/a/button/span[1]
${ADD A PLAYER TITLE}       xpath=//form/div[1]/div/span

*** Test Cases ***
Adding a player
    Open login page
    Type in email
    Type in password
    Click on sign in button
    Assert dashboard
    Click on add a player hyperlink
    Assert adding a player form
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
Click on add a player hyperlink
    Click Element  ${ADDING A PLAYER HYPERLINK}
Assert adding a player form
    wait until element is visible  ${ADD A PLAYER TITLE}
    Element Text Should Be      ${ADD A PLAYER TITLE}   Add player

