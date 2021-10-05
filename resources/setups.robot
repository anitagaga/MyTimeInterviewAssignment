*** Settings ***
Library   SeleniumLibrary

Documentation     The setups resource file contains the preconditions that satisfy the test cases on TestRail.
Resource          main.robot

*** Variables ***
${browser}    safari
${url}=    https://www.mytime.com/consumers

*** Keywords ***
Basic Selenium Test Setup
    open browser    ${url}    safari
    Maximize Browser Window
    Set Selenium Implicit Wait  3

Basic Selenium Test Teardown
    [Documentation]    - Logs last location
    ...    - Captures screenshot if test failed
    ...    - Closes all browser windows without logging the user out of the application.
    Log Location
    Log Source
    ${randomString}=    Set Variable    Generate Random String    5
    Run Keyword If    "${PREV_TEST_STATUS}" == "FAIL"    Capture Page Screenshot    onFailScreenshot_${randomString}.png
    Close All Browsers

Open Test - Sabre Cuts page
    open browser    https://www.mytime.com/express_checkout/107941/108744?selectedDeals%5B%5D=214186    safari
    Maximize Browser Window
    Set Selenium Implicit Wait  3