*** Settings ***
Resource   ../resources/locators/itemDetails.robot
Library    String
Library    BuiltIn

*** Keywords ***
Scroll Down To Realtor Information
    FOR    ${i}    IN RANGE    1    10
        ${status}    ${message}=    Run Keyword And Ignore Error    Element Should Be Visible    ${GET_IN_TOUCH_BUTTON}
        Run Keyword If    "${status}" == "FAIL"    Swipe    900    2200    84    500   1000
        Exit For Loop If    "${status}" == "PASS"
    END

Click Get In Touch On Broker
    Wait Until Element Is Visible       ${GET_IN_TOUCH_BUTTON}      10s
    Click Element       ${GET_IN_TOUCH_BUTTON}

Retreive Phone Number Of Broker
    Wait Until Element Is Visible       ${PHONE_NUMBER_TEXT}        10s
    ${phone_number}=        Get Text        ${PHONE_NUMBER_TEXT}
    Log To Console      Phone Number: ${phone_number}
    Log     Phone Number: ${phone_number}

Verify Price Is Within Expected Range
    [Arguments]     ${price_selected}
    Wait Until Element Is Visible       ${FOR_SALE_TEXT}       20s
    ${price_actual}=        Get Text        ${PRICE_ITEM_DETAILS}       text
    Log     Price Actual displayed: ${price_actual}
    ${price_number_actual}=        commons.Convert Price To Number     ${price_actual}
    Should Be True    ${price_number_actual} < ${price_selected}    expected '${price_number_actual}' should be less than '${price_selected}'

Verify Bed Rooms Is Equal Expected
    [Arguments]     ${bedrooms_selected}
    Wait Until Element Is Visible       ${BEDROOMS_ITEM_DETAILS}        10s
    ${bedrooms_actual}=        Get Text                    ${BEDROOMS_ITEM_DETAILS}       text
    Log     Bed Rooms Actual displayed: ${bedrooms_actual}
    ${bedrooms_number_selected}=         Replace String    ${bedrooms_selected}    +    ${EMPTY}
    Should Be Equal    ${bedrooms_actual}    ${bedrooms_number_selected}      expected '${bedrooms_actual}' should be equal as '${bedrooms_number_selected}'

Verify Property Type Is Equal Expected
    [Arguments]     ${option_property_type}
    Swipe       700    1150    800    599
    Wait Until Element Is Visible       ${PROPERTY_TYPE_ITEM_DETAILS}        10s
    ${property_type_actual}=        Get Text                    ${PROPERTY_TYPE_ITEM_DETAILS}       text
    Log     Bed Rooms Actual displayed: ${property_type_actual}
    ${property_type_actual_format}=         Replace String    ${property_type_actual}    Property type:     ${EMPTY}
    Should Be Equal    ${property_type_actual_format}    ${option_property_type}      expected '${property_type_actual}' should be equal as '${property_type_actual_format}'
