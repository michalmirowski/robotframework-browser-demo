*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    chromium
${HEADLESS}    false

*** Keywords ***
Open Insurance Application
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page    http://sampleapp.tricentis.com/
    Set Viewport Size  1920    1080  

Get Quote For ${vehicle_type}
    [Documentation]    Vehicle_type can be Automobile, Truck, Motorcycle, Camper
    Click    .main-navigation>.menu>.menu-item>[name="Navigation ${vehicle_type}"]

Click Next
    Click    section[style="display: block;"] >> text=Next »

