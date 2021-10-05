*** Settings ***
Library   SeleniumLibrary

Documentation     Resource file of the *Search Results page*.

Resource          ../../resources/main.robot

*** Variables ***
${loc_li_searchResults_pConsumers}    css=#results > li    #Gets the <li> elements resulting from the search.

${loc_input_location_pConsumers}     xpath://div[@class="search-container"]//descendant::input[@id="search-location"]
${loc_button_search_pConsumers}    xpath=//button[@class="flat-blue-btn btn-search"]

*** Keywords ***
Verify search results number on Consumers page
    [Documentation]    It verifies that search results have more than 3 bussinesses displayed
    ${searchResultsElements}=    Get WebElements    ${loc_li_searchResults_pConsumers}
    ${listLenght}=    Get Length    ${searchResultsElements}
    Should Be True    '${listLenght}'>='3'

Open bussiness by name
    #[Arguments]    ${business_name}

    Click Element    //*[@id="result-214186-108744"]
    Sleep    3s


