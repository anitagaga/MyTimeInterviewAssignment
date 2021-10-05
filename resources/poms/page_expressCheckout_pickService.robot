*** Settings ***
Library   SeleniumLibrary

Documentation     Resource file of the *Express Checkout page Pick a Service tab*.

Resource          ../../resources/main.robot

*** Variables ***
${loc_span_allServices_pExpressCheckout_tPickService}    xpath=//*[contains(text(),'All services')]
${loc_span_staffMembers_pExpressCheckout_tPickService}    xpath=//section[@class="staff-member"]//descendant::span[@class="option-text themed-component themed-component--color"]
${loc_span_staffMember_ObiWan_pExpressCheckout_tPickService}    xpath=//*[contains(text(),'Obi Wan')]
${loc_span_mensHaircut_pExpressCheckout_tPickService}    xpath=//span[contains(text(),"Men's Haircut")]

${loc_span_service_name_pExpressCheckout_tPickService}    xpath=//span[@class="variation-title-content"]    #Finds all service names
${loc_button_book_pExpressCheckout_tPickService}    xpath=//button[contains(text(),'book')]    #Finds all book buttons
${loc_span_price_pExpressCheckout_tPickService}    //span[@class="normal-price"]    #Finds all prices

${loc_span_selectedStaff_pExpressCheckout_tPickService}    //*[@name="employee-selector"]//following-sibling::div//descendant::span[@class="Select-value-label"]

#addOnModal
${loc_button_selectTime_addOnModal_pExpressCheckout_tPickService}    xpath=//div[@class="toolbar flex-row tablet-col center-items"]//descendant::button[contains(text(),'Select Time')]    #Select Time on the addOnModal
${loc_span_selectService_addOnModal_pExpressCheckout_tPickService}    xpath=//div[@class="addons-container"]//descendant::span[@class="variation-title-content"]    #Finds Service on the addOnModal
${loc_span_selectPrice_addOnModal_pExpressCheckout_tPickService}    xpath=//div[@class="addons-container"]//descendant::span[@class="normal-price"]    #Finds price on the addOnModal

*** Keywords ***
Select All Services on Pick A Service - Express Checkout page
    [Documentation]    Ensure the Search button is clicked
    Wait Until Element Is Visible    ${loc_span_allServices_pExpressCheckout_tPickService}    ${WAIT}    Fail= "Search" button is not visible on Express Checkout page - Service tab.
    Click Element    ${loc_span_allServices_pExpressCheckout_tPickService}

Select Staff Member by number on Pick A Service - Express Checkout page
    [Arguments]    ${number}
    Wait Until Element Is Visible    ${loc_span_staffMembers_pExpressCheckout_tPickService}    ${WAIT}    Fail:Staff Members are not loaded/displayed on Express Checkout page - Service tab.
    ${elementsMatchingSearchParam}=    Get WebElements    ${loc_span_staffMembers_pExpressCheckout_tPickService}
    ${member}=    Get WebElement    ${elementsMatchingSearchParam}[${number}]
    Click Element    ${member}

Click Book for service on Pick A Service - Express Checkout page
    [Arguments]    ${service_name}
    Wait Until Element Is Visible    ${loc_button_book_pExpressCheckout_tPickService}    ${WAIT}    Fail:Book button is not visible on Express Checkout page - Service tab.
    ${selectedService}=  Get WebElement    xpath://span[contains(text(),"${service_name}")]
    ${bookButtons}=    Get WebElements    ${loc_button_book_pExpressCheckout_tPickService}
    ${services}=    Get WebElements    ${loc_span_service_name_pExpressCheckout_tPickService}
    ${listLenght}=    Get Length    ${bookButtons}
    FOR    ${i}    IN RANGE    ${listLenght}
        ${count}=    Set Variable    {i}
        ${book}=    Get WebElement    ${bookButtons}[${i}]
        ${service}=    Get WebElement    ${services}[${i}]
        Run Keyword if  '${services}[${i}]'=='${selectedService}'    Click Element    ${book}
    END

Press Select Time in the add-on modal on Pick A Service - Express Checkout page
    [Documentation]    Ensure the Select Time button is clicked
    Wait Until Element Is Visible    ${loc_button_selectTime_addOnModal_pExpressCheckout_tPickService}    ${WAIT}    Fail= "Select Time" button is not visible in the add-on modal on Express Checkout page - Service tab.
    Click Element    ${loc_button_selectTime_addOnModal_pExpressCheckout_tPickService}

Get Service from the Add On Modal on Pick A Service - Express Checkout page
    ${service}    Get Text    ${loc_span_selectService_addOnModal_pExpressCheckout_tPickService}
    Return From Keyword    ${service}

Get Price from the Add On Modal on Pick A Service - Express Checkout page
    ${price}    Get Text    ${loc_span_selectPrice_addOnModal_pExpressCheckout_tPickService}
    Return From Keyword    ${price}

Get Staff Name on Pick A Service - Express Checkout page
    ${staff}    Get Text    ${loc_span_selectedStaff_pExpressCheckout_tPickService}
    Return From Keyword    ${staff}
