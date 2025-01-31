*** Keywords ***
Convert Number With Comma
    [Arguments]     ${price_selected}
    ${formatted_number}=    Evaluate    "{:,}".format(${price_selected})
    Log    ${formatted_number}
    RETURN      ${formatted_number}

Enable Proxy Privacy
    ${status}    ${message}=    Run Keyword And Ignore Error    Element Should Be Visible    id=x:id/banner.dismiss_button.text
    Run Keyword If    "${status}" == "PASS"    Click Element    id=x:id/banner.dismiss_button.text

Convert Price To Number
    [Arguments]     ${price_selected}
    ${price_number_actual_cleaned} =    Evaluate    re.sub(r'[^0-9.]', '', '${price_selected}')
    ${formatted_number}=    Convert To Number    ${price_number_actual_cleaned}
    Log    Formatted Number: ${formatted_number}
    RETURN    ${formatted_number}

Load Test Case Data From YAML
    [Arguments]     ${testcase_id}
    ${test_data}    Get From Dictionary    ${TestCases}    ${testcase_id}
    RETURN          ${test_data}