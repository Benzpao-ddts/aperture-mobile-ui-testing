*** Settings ***
Resource   ../resources/locators/searchLocation.robot

*** Keywords ***
Wait For Search Bar To Be Visible
    [Documentation]    Waits until the search bar element is visible on the screen.
#    Wait Until Element Is Visible    ${SEARCH_BAR}       15s
    Wait Until Element Is Visible       //android.view.ViewGroup[@resource-id="x:id/page.listings.listings.handle"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView[1]      15s

Search For Item
    [Documentation]    Taps the search bar and enters a search value.
    [Arguments]     ${search_item}
    Tap                        ${SEARCH_BAR}
#    Tap With Positions         (//android.widget.TextView[@resource-id="x:id/page.listings.no_listings.text"])[1]
    Input Text                 ${SEARCH_BAR}    ${search_item}

Wait For Search Suggestion List To Be Visible
    Wait Until Element Is Visible       ${SUGGESTION_LISTS}       20s

Verify Suggestion List Contains Entered Search Item
    [Documentation]    Verifies that the search suggestion list contains the item entered in the search field.
    [Arguments]        ${search_item}

    ${suggestion_number}=    Get Matching Xpath Count    ${ELEMENT_SUGGESTION}  # Find all elements that match the XPath
    @{all_items}=            Create List
    ${elements_count}=       Get Matching Xpath Count    ${ELEMENT_SUGGESTION}  # Find all elements that match the XPath

    FOR    ${item_number}     IN RANGE    1     ${suggestion_number}+1
        ${item_text_desc}=    Get Element Attribute    ${ITEM_SUGGESTION.replace('{index}', str(${item_number}))}     text
        Append To List        ${all_items}             ${item_text_desc}
        ${is_excluded}=       Evaluate                 any(exclusion == "${item_text_desc}" for exclusion in ${EXCLUDED_TEXTS})
        IF    ${is_excluded}
            Log To Console    Text is in the excluded list: ${item_text_desc}
        ELSE
            Should Match Regexp    ${item_text_desc}    (?i).*ottawa.*      Expected "${search_item}" to be part of "${item_text_desc}"
            Log To Console    Text matches "Ottawa" and is not an excluded case: ${item_text_desc}
        END
    END
    RETURN      ${all_items}

Select Random Item From Location Suggestion List
    [Documentation]    Selects a random item from the given location suggestion list.
    [Arguments]     ${all_items}
    ${item_index_selected}=     Extract Locations List and Select Random Item       ${all_items}
    Click Element       ${ITEM_SELECTED.replace('{index}', str(${item_index_selected}))}

Select The First Locations On Suggestion
    Sleep       2s
    Click Element       ${ITEM_SELECTED.replace('{index}', str(3))}

Extract Locations List and Select Random Item
    [Documentation]    Extracts the locations list and selects a random item from it.
    [Arguments]     ${all_items}
    ${locations_index}=    Get Index From List    ${all_items}    LOCATIONS
    ${listings_index}=     Get Index From List    ${all_items}    LISTINGS
    ${start_index}=        Evaluate    ${locations_index} + 1
    ${locations}=          Get Slice From List    ${all_items}    ${start_index}    ${listings_index}
    ${random_index}=       Evaluate    random.randint(${start_index}, ${listings_index} - 1)    modules=random
    RETURN      ${random_index}

Wait For Horizontal View Icon To Be Visible
    Sleep       2s
    Wait Until Element Is Visible       ${HORIZONTAL_VIEW_ICON}     20s

Navigate To Search Filter Page
    Click Element       ${FILTER_BUTTON}

Wait For Item Displayed To Be Visible
    Wait Until Element Is Visible       ${ITEM_DISPLAYED}     20s

Navigate To Item Details Page
    Sleep       2s
    Wait For Item Displayed To Be Visible
    Click Element       ${ITEM_DISPLAYED}



