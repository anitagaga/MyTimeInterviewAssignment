*** Settings ***
Library   SeleniumLibrary

Documentation     Resource file of the *Consumers page*.

Resource          ../../resources/main.robot

*** Variables ***
${loc_input_enterBusiness_pConsumers}    xpath://div[@class="search-container"]//descendant::input[@id="search-query"]
${loc_input_location_pConsumers}     xpath://div[@class="search-container"]//descendant::input[@id="search-location"]
${loc_button_search_pConsumers}    xpath=//button[@class="flat-blue-btn btn-search"]

*** Keywords ***
Input text into the Enter a business or service field on Consumers page
    [Arguments]    ${text}
    [Documentation]    Fill out the Enter a business or service field
    Wait Until Element Is Visible    ${loc_input_enterBusiness_pConsumers}     ${WAIT}    Fail= Enter a business or service field is not visible on Consumers page.
    Input Text    ${loc_input_enterBusiness_pConsumers}    ${text}

Clear Location on Consumers page
    Clear Element Text    ${loc_input_location_pConsumers}

Input text into the Location field on Consumers page
    [Arguments]    ${text}
    [Documentation]    Fill out the Location field
    Wait Until Element Is Visible    ${loc_input_location_pConsumers}      ${WAIT}    Fail= Location field is not visible on Consumers page.
    Input Text    ${loc_input_location_pConsumers}     ${text}

Click Search Button on Consumers page
    [Documentation]    Ensure the Search button is clicked
    Wait Until Element Is Visible    ${loc_button_search_pConsumers}    ${WAIT}    Fail= "Search" button is not visible on Consumers page.
    Click Element    ${loc_button_search_pConsumers}
    Wait Until Element Is Not Visible    ${loc_button_search_pConsumers}