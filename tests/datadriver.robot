*** Settings ***
Library             DataDriver    ../data/datadriver.csv
Resource            ../resources/common.resource
Resource            ../resources/vehicle_page.resource
Resource            ../resources/insurant_page.resource
Resource            ../resources/product_page.resource
Resource            ../resources/price_page.resource
Resource            ../resources/quote_page.resource

Suite Setup         Run Keywords
...                     Set Log Level    TRACE
...                     AND    Open Insurance Application
Test Template       Create Quote


*** Test Cases ***
Create quote for ${vehicle_variant} ${vehicle_type} with ${insurant_variant} insurant, ${product_variant} product and ${price_option} price option


*** Keywords ***
Create Quote
    [Arguments]    ${vehicle_variant}    ${vehicle_type}    ${insurant_variant}    ${product_variant}    ${price_option}
    Get Quote For ${vehicle_type}
    Enter Vehicle Data And Go Next    ${vehicle_type}    ${vehicle_variant}
    Enter Insurant Data And Go Next    ${insurant_variant}
    Enter Product Data And Go Next    ${vehicle_type}    ${product_variant}
    Verify Data In Price Plans Table
    Select Price Option And Go Next    ${price_option}
    Enter User Data And Send Quote Successfully
