*** Settings ***
Resource        ../resources/common.resource
Resource        ../resources/vehicle_page.resource
Resource        ../resources/insurant_page.resource
Resource        ../resources/product_page.resource
Resource        ../resources/price_page.resource
Resource        ../resources/quote_page.resource

Suite Setup     Run Keywords
...                 Set Log Level    TRACE
...                 AND    Open Insurance Application


*** Test Cases ***
Create Quote For Automobile For Speeding Driver
    Get Quote For Automobile
    Enter Vehicle Data And Go Next    automobile    default
    Enter Insurant Data And Go Next    speeder
    Enter Product Data And Go Next    automobile    default
    Verify Data In Price Plans Table
    Select Price Option And Go Next    platinum
    Enter User Data And Send Quote Successfully

Create Quote For Truck
    Get Quote For Truck
    Enter Vehicle Data And Go Next    truck    default
    Enter Insurant Data And Go Next    default
    Enter Product Data And Go Next    truck    default
    Verify Data In Price Plans Table
    Select Price Option And Go Next    ultimate
    Enter User Data And Send Quote Successfully

Create Quote For Motorcycle
    Get Quote For Motorcycle
    Enter Vehicle Data And Go Next    motorcycle    default
    Enter Insurant Data And Go Next    default
    Enter Product Data And Go Next    motorcycle    default
    Verify Data In Price Plans Table
    Select Price Option And Go Next    silver
    Enter User Data And Send Quote Successfully

Create Quote For Camper
    Get Quote For Camper
    Enter Vehicle Data And Go Next    camper    default
    Enter Insurant Data And Go Next    default
    Enter Product Data And Go Next    camper    default
    Verify Data In Price Plans Table
    Select Price Option And Go Next    gold
    Enter User Data And Send Quote Successfully

Cannot Create Quote Due To Invalid Start Date
    [Setup]    Run Keywords
    ...    Get Quote For Automobile
    ...    AND    Enter Vehicle Data And Go Next    automobile    default
    ...    AND    Enter Insurant Data And Go Next    default
    Enter Product Data    automobile    default    invalid_start_date=True
    Verify Start Date Field Is Correctly Validated
    Verify Price Option Cannot Be Selected

Cannot Create Quote Due To Missing Quote Data
    [Setup]    Run Keywords
    ...    Get Quote For Automobile
    ...    AND    Enter Vehicle Data And Go Next    automobile    default
    ...    AND    Enter Insurant Data And Go Next    default
    ...    AND    Enter Product Data And Go Next    automobile    default
    ...    AND    Select Price Option And Go Next    platinum
    Enter Incomplete User Data And Send Quote Unsuccessfully

Download Quote On Price Plans Page
    [Setup]    Run Keywords
    ...    Get Quote For Motorcycle
    ...    AND    Enter Vehicle Data And Go Next    motorcycle    default
    ...    AND    Enter Insurant Data And Go Next    default
    ...    AND    Enter Product Data And Go Next    motorcycle    default
    Download Quote
