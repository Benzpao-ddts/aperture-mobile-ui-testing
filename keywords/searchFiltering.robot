*** Settings ***
Resource   ../resources/locators/searchFiltering.robot
Resource   ../commons/commons.robot

*** Keywords ***
Select Price Range
    [Arguments]    ${dropdown_type}    ${price_selected}

    ${dropdown_locator}=    Set Variable If    '${dropdown_type}' == 'max'    ${MAX_DROPDOWN}    ${MIN_DROPDOWN}
    ${scroll_keyword}=      Set Variable If    '${dropdown_type}' == 'max'    Scroll Max Price Range Dropdown List    Scroll Min Price Range Dropdown List
    Sleep    2s
    Click Element    ${dropdown_locator}
    ${price_selected_number}=    commons.Convert Number With Comma    ${price_selected}
    @{price_item_dropdown}=    Create List
    FOR    ${i}    IN RANGE    1    10
        Sleep    2s
        ${dropdown_count}=    Get Matching Xpath Count    ${PRICE_DROPDOWN_LIST}
        ${value_found}=    Evaluate    "${price_selected_number}" in ${price_item_dropdown}
        Run Keyword If    ${value_found}    Exit For Loop
        Process Dropdown Items    ${dropdown_count}    ${price_item_dropdown}    ${price_selected}    ${price_selected_number}
        Run Keyword If    not ${value_found}    ${scroll_keyword}
    END

Change Bedroom Until Expected Value Is Found
    [Arguments]     ${expected_value}    ${button}
    # Step 1: Check if the parameter has a value
    Sleep       2s
    Run Keyword If    '${expected_value}' == ''    Fail    "Parameter is empty! Please provide a valid value."
    Log    Parameter has value: ${expected_value}

    Click Element    ${button}  # Use the passed button (either increase or decrease)

    # Step 2: Initialize loop to check text and click button if needed
    WHILE    True
        Sleep    1s
        ${current_text}=    Get Text    ${BEDROOMS_TEXT}
        Log    Current text is: ${current_text}. Expected: ${expected_value}.
        Exit For Loop If    '${current_text}' == '${expected_value}'
        Click Element    ${button}  # Click again if the current value is not as expected
        Sleep    1s
    END

    # Step 3: Confirm the value matches the expected value
    Log    Expected value ${expected_value} found successfully.

Add Bed Room Until Expected Value Is Found
    [Arguments]    ${expected_value}
    Change Bedroom Until Expected Value Is Found    ${expected_value}    ${ADD_BEDROOM_BUTTON}

Decrease Bed Room Until Expected Value Is Found
    [Arguments]    ${expected_value}
    Change Bedroom Until Expected Value Is Found    ${expected_value}    ${DECREASE_BEDROOM_BUTTON}

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