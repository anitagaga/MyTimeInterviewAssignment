*** Settings ***
Library   SeleniumLibrary

Documentation     Resource file of the *Express Checkout Pick a Time page*.

Resource          ../../resources/main.robot

*** Variables ***
${loc_h2_pageTitle_pExpressCheckout_tPickTime}    xpath=//h2[@class="title responsive-padding" and contains(text(),'Pick a Time')]    # Finds the Title of Pick a Time - Express Checkout page
${loc_div_openTime_pExpressCheckout_tPickTime}    xpath=//div[@class="opentime-item responsive-padding"]    #Finds all available time spots

#Rigth Panel
${loc_span_serviceName_pExpressCheckout_tPickTime}    xpath=//span[@class="variation-name break-word text-3"]    #Finds Service name on the Rigth Panel of the Pick a Time - Express Checkout page
${loc_span_staff_pExpressCheckout_tPickTime}    xpath=//div[@class="Select employee-selector text-3 has-value is-clearable Select--single"]//descendant::span[@class="Select-value-label"]    #Finds Staff name on the Rigth Panel of the  Pick a Time - Express Checkout page
${loc_span_price_pExpressCheckout_tPickTime}    xpath=//*[@class="variation-price text-3"]//descendant::span[@class="normal-price"]    #Finds Price on the Rigth Panel of the  Pick a Time - Express Checkout page

*** Keywords ***
Verify Pick Time - Express Checkout Loaded
    [Documentation]    Verify if *Checkout Page - Pick Time page* loads.
    Wait Until Element Is Visible    ${loc_h2_pageTitle_pExpressCheckout_tPickTime}    ${WAIT}    Fail= Checkout Page - Pick Time page title is not visible. Checkout Page - Pick Time page might still be loading.

Verify the selected date has more than 2 opened time spots on Pick Time - Express Checkout Page
    [Arguments]    ${date}
    ${selectedDate}=  Get WebElement    //div[@aria-label="Select date - ${date}"]
    Click Element    ${selectedDate}
    Wait Until Element Is Visible    ${loc_div_openTime_pExpressCheckout_tPickTime}    ${WAIT}    Fail= Checkout Page - Open Slots are not visible. Checkout Page - Pick Time page might still be loading.
    ${timeSlots}=    Get WebElements    ${loc_div_openTime_pExpressCheckout_tPickTime}
    ${listLenght}=    Get Length    ${timeSlots}
    Should Be True    ${listLenght} > 2

Verify Right Side Panel Information on Pick Time - Express Checkout Page
    [Arguments]    ${expected_serviceName}    ${expected_staff}    ${expected_price}
    [Documentation]    Verify if Service, Staff & Price displayed are the ones selected
    ${actual_serviceName}    Get Text    ${loc_span_serviceName_pExpressCheckout_tPickTime}
    Should Be Equal As Strings    ${expected_serviceName}    ${actual_serviceName}    Fail= The strings do not match. Service Name must be wrong.
    ${actual_staff}    Get Text    ${loc_span_staff_pExpressCheckout_tPickTime}
    Should Be Equal As Strings    ${expected_staff}    ${actual_staff}    Fail= The strings do not match. Service Staff must be wrong.
    ${actual_price}    Get Text    ${loc_span_price_pExpressCheckout_tPickTime}
    Should Be Equal As Strings    ${expected_price}    ${actual_price}    Fail= The strings do not match. Service price must be wrong.


