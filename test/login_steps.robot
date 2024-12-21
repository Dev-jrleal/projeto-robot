*** Settings ***
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome


*** Test Cases ***
Successful Login
    I navigate to the login page
    I input correct credentials
    I click on the login button
    I can access the home page
    
Unsuccessful Login - No credentials
    I navigate to the login page
    I input no credentials
    I click on the login button
    I am able to see the expected erro message for no credentials

Unsuccessful Login - No Username
    I navigate to the login page
    I input only the password
    I click on the login button
    I am able to see the expected erro message for no username

Unsuccessful Login - No password
    I navigate to the login page
    I input only the username 
    I click on the login button
    I am able to see the expected erro message for no password
    
Unsuccessful Login - Wrong credentials
    I navigate to the login page
    I input wrong credentials
    I click on the login button
    I am able to see the expected erro message for no wrong credentials