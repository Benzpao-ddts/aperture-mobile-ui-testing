*** Variables ***
${ITEM_PRICE}                       //android.widget.ScrollView[@resource-id="x:id/dropdown.scrollview"]/android.view.ViewGroup/android.view.ViewGroup[{index}]/android.widget.TextView
${HEADER_FILTER_PAGE}               What are you searching for?
${ITEM_LOCATOR}                     //android.widget.TextView[@resource-id="x:id/dropdown.{price_value}.text"]
${PROPERTY_SEARCH_TITLE}            id=x:id/page.property_search.title
${MIN_DROPDOWN}                     id=x:id/filters.range.min_dropdown
${MAX_DROPDOWN}                     id=x:id/filters.range.max_dropdown
${PRICE_RANGE_TEXT}                 //android.widget.TextView[@text="Price range"]
${PRICE_DROPDOWN}                   //android.widget.ScrollView[@resource-id="x:id/dropdown.scrollview"]
${PRICE_DROPDOWN_LIST}              //android.widget.ScrollView[@resource-id="x:id/dropdown.scrollview"]/android.view.ViewGroup/android.view.ViewGroup
${ADD_BEDROOM_BUTTON}               //android.widget.Button[@content-desc="Increase bedroom count"]
${DECREASE_BEDROOM_BUTTON}          //android.widget.Button[@content-desc="Decrease bedroom count"]
${BEDROOMS_TEXT}                    //android.widget.TextView[@resource-id="x:id/options_sequence.value"]
${OPTIONS_PROPPERTY_TYPE}           //android.view.ViewGroup[@content-desc="x:id/{option_property_type}.deselected"]/android.view.ViewGroup/android.view.ViewGroup
${RESULT_BUTTON}                    id=x:id/page.property_search.search_button

