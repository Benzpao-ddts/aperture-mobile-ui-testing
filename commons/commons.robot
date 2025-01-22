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
    ${price_without_dollar}=    Replace String    ${price_selected}    $    ${EMPTY}
    ${price_without_comma}=    Replace String    ${price_without_dollar}    ,    ${EMPTY}
    ${cleaned_number}=    Convert To Number    ${price_without_comma}
    ${formatted_number}=    Evaluate    "{:,}".format(${cleaned_number})
    Log    Formatted Number: ${formatted_number}
    RETURN    ${formatted_number}

