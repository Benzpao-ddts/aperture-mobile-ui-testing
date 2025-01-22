*** Variables ***
${SEARCH_BAR}               id=x:id/page.listings.search_textbox.textbox
${SUGGESTION_LISTS}         //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]/android.view.ViewGroup/android.view.ViewGroup[2]

${ELEMENT_SUGGESTION}       //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]/android.view.ViewGroup/android.view.ViewGroup
${ITEM_SUGGESTION}          //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]/android.view.ViewGroup/android.view.ViewGroup[{index}]//android.widget.TextView
${ITEM_SELECTED}            //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]/android.view.ViewGroup/android.view.ViewGroup[{index}]
${FILTER_BUTTON}            //android.view.ViewGroup[@resource-id="x:id/page.listings.filters"]
${HORIZONTAL_VIEW_ICON}     id=x:id/page.listings.listings.vertical_list
${ITEM_DISPLAYED}           //android.view.ViewGroup[@resource-id="x:id/listing_browser.vertical.large_card.0"]
