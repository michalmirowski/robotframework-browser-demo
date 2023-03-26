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
Create Quote for Car
    Get Quote For Automobile
    Enter Vehicle Data And Go Next    automobile    default
    Enter Insurant Data And Go Next    default
    Enter Product Data And Go Next    default
    Select Price Option And Go Next
    Send Quote Successfully

Verify Minimal Start Date Validation
    Get Quote For Automobile
    Enter Vehicle Data And Go Next    automobile    default
    Enter Insurant Data And Go Next    default
    Enter Product Data With Invalid Start Date
    Verify Start Date Field Is Correctly Validated    # add more assertions
    Verify Price Option Cannot Be Selected
