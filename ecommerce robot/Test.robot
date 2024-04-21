*** Settings ***
Resource    keywords.robot
Resource    variables.robot 
Test Teardown    Close All Browsers
Library    SeleniumLibrary   
*** Test Cases ***

Create new account
    [Tags]    regression
    Navigate to URL    ${url}
    Create Account    ${email}    ${password}
Sgin In succefully
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Page Should Contain    My Account
Forget password    
    Navigate to URL    ${url}
    Forget password    ${email}
Add product to cart
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Add product 
Modify and delete product
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Modify Delete product
Buy product
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Buy product
    