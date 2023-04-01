*** Settings ***
Library     Browser


*** Keywords ***
Open Insurance Application
    [Documentation]    Can be run on selected browser and in headless mode or not
    [Arguments]    ${browser}   ${headless}
    New Browser    browser=${browser}    headless=${headless}
    New Context    locale=en-GB
    New Page    http://sampleapp.tricentis.com/

Get Quote For ${vehicle}
    [Documentation]    Vehicle can be Automobile, Truck, Motorcycle, Camper
    Click    .main-navigation>.menu>.menu-item>[name="Navigation ${vehicle}"]

Click Next
    [Documentation]    Common next screen action used on most pages
    Click    section[style="display: block;"] >> text=Next »

Check Multiple Checkboxes
    [Documentation]    Use locator and list of checkboxes that needs to be checked
    [Arguments]    ${check_loc}    ${check_list}
    FOR    ${check_name}    IN    @{check_list}
        Check Checkbox    ${check_loc}="${check_name}"
    END
