*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***

I navigate to the login page
    Go To    ${URL_DATA["baseUrl"]} 

I input correct credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I input wrong credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["wrongData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["wrongData"]["password"]}

I click on the login button
    Click Button    id=login-button

I can access the home page
    ${location}    Get Location
    ${full_url}    Catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["inventoryUrl"]}
    Should Be Equal    ${location}    ${full_url}

I am able to see the expected erro message for no credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noCredentials"]} 

I am able to see the expected erro message for no username
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noUserName"]}

I am able to see the expected erro message for no password
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noPassword"]}

I am able to see the expected erro message for no wrong credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["wrongCredentials"]}    

I input only the username
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I input no credentials
    Wait Until Element Is Visible    id=user-name
    
