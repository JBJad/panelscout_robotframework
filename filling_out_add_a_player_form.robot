*** Settings ***

Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website

*** Variables ***

${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en

${BROWSER}  Chrome

${LOGIN INPUT}      xpath=//*[@id='login']
${PASSWORD INPUT}       xpath=//*[@id='password']
${SIGN IN BUTTON}       xpath=//*[@type='submit']
${LOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDING A PLAYER HYPERLINK}        xpath=//div[2]/div/div/a/button/span[1]
${ADD A PLAYER TITLE}       xpath=//form/div[1]/div/span

${PLAYERS NAME}     xpath=//div/div[2]/div/div/input
${PLAYERS SURNAME}      xpath=//div/div[3]/div/div/input
${PLAYERS AGE}      xpath=//div/div[7]/div/div/input
${PLAYERS MAIN POSITION}        xpath=//div[11]/div/div/input
${SUBMIT BUTTON}        xpath=//form/div[3]/button[1]/span[1]

${MATCHES HYPERLINK}        xpath=//ul[2]/div[2]/div[2]/span
${MAIN PAGE HYPERLINK}      xpath=//ul[1]/div[1]/div[2]/span
${NEWLY ADDED PLAYER}       xpath=//*[@id="__next"]/div[1]/main/div[3]/div[3]/div/div/a[1]/button/span[1]

*** Test Cases ***
Filling out add a player form
    Open login page
    Type in email
    Type in password
    Click on sign in button
    Assert dashboard
    Click on add a player hyperlink
    Assert adding a player form
    Fill out all the obligatory fields
    Click on submit button
    Move to the main page
    Check if the new player has been added
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
Fill out all the obligatory fields
    Input Text      ${PLAYERS NAME}  Maciek
    Input Text      ${PLAYERS SURNAME}  Maciek
    Input Text      ${PLAYERS AGE}  10-04-1990
    Input Text      ${PLAYERS MAIN POSITION}  defence
Click on submit button
    Click Element  ${SUBMIT BUTTON}
Move to the main page
    Wait Until Page Contains Element     ${MATCHES HYPERLINK}
    Click Element  ${MAIN PAGE HYPERLINK}
Check if the new player has been added
    wait until element is visible  ${LOGO}
    Element Should Contain      ${NEWLY ADDED PLAYER}       MACIEK MACIEK




