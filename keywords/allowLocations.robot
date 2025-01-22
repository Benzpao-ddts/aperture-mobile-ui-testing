*** Settings ***
Resource   ../resources/locators/allowLocations.robot

*** Keywords ***
Allow To Access Location
    Wait Until Element Is Visible    ${WHILE_USING_APP}    timeout=10
    Click Element    ${WHILE_USING_APP}