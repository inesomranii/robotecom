*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Navigate to URL
    [Arguments]    ${url}   
    Open Browser    ${url}    Chrome
    Maximize Browser Window
      
Create Account
    [Arguments]    ${email}    ${pwd}
    Click Element    xpath=//header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]
    Page Should Contain    New Customer
    Click Element    xpath=//body/div[1]/div[5]/div[1]/div[1]/aside[1]/div[1]/a[2]
    Input Text    css=input[name="firstname"]    inesss
    Input Text    css=input[name="lastname"]    omranii
    Input Text    css=input[name="email"]     ${email}
    Input Text    css=input[name="telephone"]    498723
    Input Password    css=input[name="password"]     ${pwd}         
    Input Password    css=input[name="confirm"]     ${pwd}
    Click Element    css=div[class="custom-control custom-checkbox custom-control-inline"]
    Click Element    css=input[type="submit"]
    Sleep    10S    
    Page Should Contain    Your Account Has Been Created!
Sign In
    [Arguments]    ${email}    ${pwd}
    Click Element    xpath=//header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]   
    Page Should Contain    Returning Customer
    Input Text    css=#input-email    ${email}
    Input Password    css=input[name="password"]    ${pwd}
    Click Element   css=input[type="submit"]   
Forget password 
    [Arguments]    ${email} 
    Click Element    xpath=//header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]   
    Page Should Contain    Returning Customer
    Input Text    css=#input-email    ${email}
    Click Element   //div[@class='form-group']//a[normalize-space()='Forgotten Password']
    Page Should Contain    Forgot Your Password?
    Input Text    //input[@id='input-email']    ${email}
    Page Should Contain    An email with a confirmation link has been sent your email address.
    
Add product 
    Input Text    css=body.account-account:nth-child(2) div.mz-pure-container:nth-child(1) div.mz-pure-pusher-container:nth-child(5) header.header:nth-child(1) div.entry-section.container.d-none.d-md-flex.flex-row.align-items-center.flex-wrap.flex-md-nowrap:nth-child(1) div.entry-widget.widget-search:nth-child(2) div.search-wrapper div.d-flex:nth-child(2) div.search-input-group.flex-fill div.search-input.d-flex div.flex-fill > input:nth-child(1)    HTC Touch HD
    Click Button    css=Button[type="submit"]
    Page Should Contain    Search - HTC Touch HD
    Click Element     xpath=//div[@class='row']//div[1]//div[1]//div[2]//h4[1]//a[1]
    Click Button    xpath=//div[@id='entry_216842']//button[@title='Add to Cart'][normalize-space()='Add to Cart']
    Sleep    15s
    Click Element    xpath=//div[@id='entry_217825']
    Click Element    xpath=//a[normalize-space()='Edit cart']
    Page Should Contain    Shopping Cart
Modify Delete product 
    Click Element    xpath=//div[@id='entry_217825']
    Click Element    xpath=//a[normalize-space()='Edit cart']
    Page Should Contain    Shopping Cart
    Clear Element Text    //input[@name='quantity[53593]']
    Input Text    //input[@name='quantity[53593]']    12
    Click Button    xpath=//i[@class='fas fa-sync-alt']
    
    
Buy product 
    Click Element    xpath=//div[@id='entry_217825']
    Click Element    xpath=//a[normalize-space()='Edit cart']
    Page Should Contain    Shopping Cart
    Click Element    //a[@class='btn btn-lg btn-primary']
    Page Should Contain    Billing Address
    Click Element    //label[@for='input-payment-address-new']
    Input Text    css=input[name="firstname"]    omrani
    Input Text    css=input[name="lastname"]    ines
    Input Text    css=input[name="address_1"]    address
    Input Text    css=input[name="city"]    beja 
    Input Text    css=input[name="postcode"]    5555
    Click Element   //label[@for='input-agree']
    Click Button    //button[@id='button-save']
    Click Button    //button[@id='button-confirm']
    Page Should Contain    Your order has been placed!
    