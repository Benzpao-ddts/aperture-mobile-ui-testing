*** Settings ***
Resource   ../resources/locators/searchFiltering.robot
Resource   ../commons/commons.robot

*** Keywords ***
Select Max Price Range
    [Arguments]         ${price_selected}
    Wait Until Element Is Visible       ${PRICE_RANGE_TEXT}           20s
    Click Element       ${MAX_DROPDOWN}
#    Tap    ${MAX_DROPDOWN}  # Open the dropdown
    ${price_selected_number}=       commons.Convert Number With Comma       ${price_selected}
    @{max_price_item_dropdown}=     Create List
    FOR    ${i}    IN RANGE    1    10
        Sleep       2s
        ${max_dropdown_count}=    Get Matching Xpath Count    ${PRICE_DROPDOWN_LIST}
        ${value_found}=    Evaluate    "${price_selected_number}" in ${max_price_item_dropdown}
        Run Keyword If    ${value_found}    Exit For Loop
        Process Dropdown Items    ${max_dropdown_count}    ${max_price_item_dropdown}       ${price_selected}       ${price_selected_number}
        Run Keyword If    ${value_found}==False       Scroll Max Price Range Dropdown List
    END


Add Bed Room Until Expected Value Is Found
    [Arguments]     ${expected_value}
    # Step 1: Check if the parameter has a value
    Sleep       2s
    Run Keyword If    '${expected_value}' == ''    Fail    "Parameter is empty! Please provide a valid value."
    Log    Parameter has value: ${expected_value}
    Click Element    ${ADD_BEDROOM_BUTTON}
    # Step 2: Initialize loop to check text and click button if needed
    WHILE    True
        Sleep    1s
        ${current_text}=    Get Text    ${BEDROOMS_TEXT}
        Log    Current text is: ${current_text}. Expected: ${expected_value}.
        Exit For Loop If    '${current_text}' == '${expected_value}'
        Click Element    ${ADD_BEDROOM_BUTTON}
        Sleep    1s
    END

    # Step 3: Confirm the value matches the expected value
    Log    Expected value ${expected_value} found successfully.

Scroll Max Price Range Dropdown List
    Swipe    700    1150    800    599

Scroll Min Price Range Dropdown List
    Swipe    90    1200    90    750

Process Dropdown Items
    [Arguments]    ${max_dropdown_count}    ${max_price_item_dropdown}      ${price_selected}       ${price_selected_number}
    FOR    ${max_dropdown_number}    IN RANGE    1    ${max_dropdown_count}+1
        ${text_desc}=    Get Element Attribute    ${ITEM_PRICE.replace('{index}', str(${max_dropdown_number}))}    text
        Append To List    ${max_price_item_dropdown}    ${text_desc}
        Exit For Loop If    "${text_desc}" == "${price_selected}"
        Run Keyword If    "${text_desc}" == "${price_selected_number}"    Click Element    ${ITEM_LOCATOR.replace('{price_value}', str(${price_selected}))}
    END

Select Options From Property Type Section
    [Arguments]     ${property_type}
    Click Element                       id=x:id/accordian.property_type.header
    Wait Until Element Is Visible       ${OPTIONS_PROPPERTY_TYPE.replace('{option_property_type}', '${property_type}')}      10s
    Click Element                       ${OPTIONS_PROPPERTY_TYPE.replace('{option_property_type}', '${property_type}')}

Click Result Button To Search
    Click Element       ${RESULT_BUTTON}