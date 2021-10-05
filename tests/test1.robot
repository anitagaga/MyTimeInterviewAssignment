*** Settings ***
Documentation     https://planetbids.testrail.io/index.php?/suites/view/1&group_by=cases:section_id&group_id=18&group_order=asc&display_deleted_cases=0
...
...
...               Section name: My Account Page

Resource          ../resources/main.robot

Test Setup    Basic Selenium Test Setup
#Open Test - Sabre Cuts page
Test Teardown     Basic Selenium Test Teardown

*** Variables ***

${service_name}    Men's Haircut

*** Test Cases ***
Test Case 001
    [Documentation]
    ...  This test case steps:
    ...    1 - Open the https://www.mytime.com/consumers page
    ...    2 - Search for “haircut” in “San Francisco, CA”
    ...    3 - Verify that multiple results are shown - at least 3
    ...    4 - Open business with name Test - Sabre Cuts
    ...    5 - On the next screen : Select "All services" in the services filter from the left panel
    ...    6 - Select second staff from the staff filter in the left side panel
    ...    7 - Click the “Book” button for the “Men's Haircut” service
    ...    8 - Press "Select Time" in the add-on modal opened
    ...    9 - Verify that the user is presented with a list of available time slots with at least 2 entries
    ...    10 - Verify in the right side panel :
    ...    11 - Service displayed is the one selected in the step before
    ...    12 - Service price is the same as the one displayed in the step before
    ...    13 - Staff selected is the staff chosen before
    [Tags]    functionality  test_case_id=001
    [Setup]    Open Test - Sabre Cuts page
    #Input text into the Enter a business or service field on Consumers page    haircut
    #Clear Location on Consumers page
    #Input text into the Location field on Consumers page    San Francisco, CA
    #Click Search Button on Consumers page
    #Verify search results number on Consumers page
    #Open business Test - Sabre Cuts page on the next screen #This step has not been implemented due to its relocates to the login page from the consumers page
    Select All Services on Pick A Service - Express Checkout page
    sleep    3s
    Select Staff Member by number on Pick A Service - Express Checkout page    2
    sleep    3s
    ${selectedStaff_addOnModal}    Get Staff Name on Pick A Service - Express Checkout page
    Click Book for service on Pick A Service - Express Checkout page    ${service_name}
    sleep    3s
    ${selectedService_addOnModal}    Get Service from the Add On Modal on Pick A Service - Express Checkout page
    ${selectedPrice_addOnModal}    Get Price from the Add On Modal on Pick A Service - Express Checkout page
    Press Select Time in the add-on modal on Pick A Service - Express Checkout page
    sleep    3s
    Verify Pick Time - Express Checkout Loaded
    sleep    3s
    Verify Right Side Panel Information on Pick Time - Express Checkout Page
    ...    ${service_name}    ${selectedStaff_addOnModal}    ${selectedPrice_addOnModal}
