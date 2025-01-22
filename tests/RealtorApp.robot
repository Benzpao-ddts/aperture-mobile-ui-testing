*** Settings ***
Library     AppiumLibrary
Library     BuiltIn
Library     Collections
Library     Process
Resource    ../keywords/allowLocations.robot
Resource    ../keywords/launchApplication.robot
Resource    ../keywords/searchLocation.robot
Resource    ../keywords/searchFiltering.robot
Resource    ../keywords/itemDetails.robot
Resource    ../commons/commons.robot
Resource    ../resources/data/testData.robot

*** Test Cases ***
End To End Testing
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${SEARCH_ITEM}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    ${all_items}=       searchLocation.Verify Suggestion List Contains Entered Search Item      ${SEARCH_ITEM}
    #This step was commented out because when I use random selection, no results are displayed.
#    searchLocation.Select Random Item From Location Suggestion List      ${all_items}
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Select Max Price Range      ${PRICE_SELECTED}
    searchFiltering.Add Bed Room Until Expected Value Is Found      ${BEDROOMS_SELECTED}
    searchFiltering.Select Options From Property Type Section       ${OPTION_PROPERTY_TYPE}
    searchFiltering.Click Result Button To Search
    searchLocation.Navigate To Item Details Page
    itemDetails.Verify Price Is Within Expected Range       ${PRICE_SELECTED}
    itemDetails.Verify Bed Rooms Is Equal Expected          ${BEDROOMS_SELECTED}
    itemDetails.Scroll Down To Realtor Information
    itemDetails.Click Get In Touch On Broker
    itemDetails.Retreive Phone Number Of Broker

