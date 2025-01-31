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
Variables   ../resources/data/testData.yaml

*** Test Cases ***
End To End Testing Retrieve Broker's Phone Number
    [Tags]      TC001
    ${test_data}=       Load Test Case Data From YAML      TC001
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${test_data['search_location']}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    ${all_items}=       searchLocation.Verify Suggestion List Contains Entered Search Item      ${test_data['search_location']}
    #This step was commented out because when I use random selection, no results are displayed.
#    searchLocation.Select Random Item From Location Suggestion List      ${all_items}
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Select Price Range      ${test_data['max_dropdown']}       ${test_data['price_max']}
    searchFiltering.Add Bed Room Until Expected Value Is Found      ${test_data['add_bedrooms']}
    searchFiltering.Select Options From Property Type Section       ${test_data['option_property_type']}
    searchFiltering.Click Result Button To Search
    searchLocation.Navigate To Item Details Page
    itemDetails.Verify Price Is Within Expected Range       ${test_data['price_max']}
    itemDetails.Verify Bed Rooms Is Equal Expected          ${test_data['add_bedrooms']}
    itemDetails.Scroll Down To Realtor Information
    itemDetails.Click Get In Touch On Broker
    itemDetails.Retreive Phone Number Of Broker
    Close Application

Verify Adding Bedroom To Property Listing
    [Tags]      TC002
    ${test_data}=       Load Test Case Data From YAML      TC002
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${test_data['search_location']}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Add Bed Room Until Expected Value Is Found      ${test_data['add_bedrooms']}
    Close Application

Verify Decreasing Bedroom To Property Listing
    [Tags]      TC003
    ${test_data}=       Load Test Case Data From YAML      TC003
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${test_data['search_location']}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Add Bed Room Until Expected Value Is Found      ${test_data['add_bedrooms']}
    searchFiltering.Decrease Bed Room Until Expected Value Is Found      ${test_data['decrease_bedrooms']}
    Close Application

Validate Minimum Price Range In Dropdown List
    [Tags]      TC004
    ${test_data}=       Load Test Case Data From YAML      TC004
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${test_data['search_location']}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Select Price Range      ${test_data['min_dropdown']}       ${test_data['price_min']}
    Close Application

Validate Maximum Price Range In Dropdown List
    [Tags]      TC005
    ${test_data}=       Load Test Case Data From YAML      TC005
    launchApplication.Launch Application
    allowLocations.Allow To Access Location
    searchLocation.Wait For Search Bar To Be Visible
    commons.Enable Proxy Privacy
    searchLocation.Search For Item      ${test_data['search_location']}  # to config in data test
    searchLocation.Wait For Search Suggestion List To Be Visible
    searchLocation.Select The First Locations On Suggestion
    searchLocation.Wait For Horizontal View Icon To Be Visible
    searchLocation.Navigate To Search Filter Page
    searchFiltering.Select Price Range      ${test_data['max_dropdown']}       ${test_data['price_max']}
    Close Application