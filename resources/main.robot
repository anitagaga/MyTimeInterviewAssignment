*** Settings ***
Library   SeleniumLibrary

Resource          setups.robot

Resource          poms/page_consumers.robot
Resource          poms/page_searchResults.robot
Resource          poms/page_expressCheckout_pickService.robot
Resource          poms/page_expressCheckout_pickTime.robot

*** Variables ***
${BROWSER}        ${EMPTY}
${ENVIRONMENT}    ${EMPTY}
${VERSION}        ${EMPTY}
${SERVER_URL}     ${EMPTY}
${WAIT}           15s
${USERNAME}       ${EMPTY}
${PASSWORD}       ${EMPTY}
${BASE_URL}        https://www.mytime.com/

