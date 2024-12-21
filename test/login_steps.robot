*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    browser=chrome


*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I can access the home page
    
Unsuccessful Login - No credentials
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username is required

Unsuccessful Login - No Username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username is required

Unsuccessful Login - No password
    I navigate to the login page    ${URL}
    I input only the username    ${USERNAME}   
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Password is required
    
Unsuccessful Login - Wrong credentials
    I navigate to the login page    ${URL}
    I input wrong credentials    CMEKCE    DXMWKDMW
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username and password do not match any user in this service