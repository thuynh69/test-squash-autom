*** Settings ***
Documentation     Test Authentification
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.amazon.fr
${BROWSER}        Firefox
${login}          thanh24@hotmail.com
${mdp}            Tknh1625
${username}       Thanh

*** Test Cases ***
Valid Login
    Open Browser To Home Page
    Accept Cookie
    Click To Login Page
    Input Login
    Click To Continue
    Send Password
    Click To SignIn
    Verify Login
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Accept Cookie
    Wait Until Element Is Visible    sp-cc-accept
    Click Element      sp-cc-accept

Click to Login Page
    Wait Until Element Is Visible    nav-link-accountList
    Click Element    nav-link-accountList

Input Login
    Input Text    ap_email    ${login}

Click To Continue
    Click Element    continue

Send Password
    Input Password    ap_password    ${mdp}

Click To SignIn
    Click Element    signInSubmit

Verify Login
    Element Should Contain    nav-link-accountList-nav-line-1    ${username}
    