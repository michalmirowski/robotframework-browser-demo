*** Settings ***
Documentation       Setup needed to run tests and common keywords that can be used on various pages
Library             Browser
Library             String


*** Variables ***
# test setup
${BROWSER}              chromium
${HEADLESS}             true
${URL}                  http://sampleapp.tricentis.com/
${DOWNLOADS_PATH}       ${CURDIR}${/}downloads


*** Keywords ***
Open Insurance Application
    [Documentation]    Can be run on selected browser and in headless mode or not
    New Browser    browser=${BROWSER}    headless=${HEADLESS}    downloadsPath=${DOWNLOADS_PATH}
    New Context    locale=en-GB
    New Page    ${URL}

Get Quote For ${vehicle}
    [Documentation]    Vehicle can be Automobile, Truck, Motorcycle, Camper
    ${vehicle}=    Convert To Lower Case    ${vehicle}
    Click    .main-navigation>.menu>.menu-item>#nav_${vehicle}

Click Next
    [Documentation]    Common next screen action used on most pages
    Click    section[style="display: block;"] >> text=Next »

Check Multiple Checkboxes
    [Documentation]    Use locator and list of checkboxes that needs to be checked
    [Arguments]    ${check_loc}    ${check_list}
    FOR    ${check_name}    IN    @{check_list}
        Check Checkbox    ${check_loc}="${check_name}"
    END
