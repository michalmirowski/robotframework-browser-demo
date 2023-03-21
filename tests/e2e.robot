*** Settings ***
Resource    ../resources/common.resource
Resource    ../resources/vehicle_page.resource
Resource    ../resources/insurant_page.resource
Resource    ../resources/product_page.resource
Resource    ../resources/price_page.resource
Resource    ../resources/quote_page.resource


*** Test Cases ***
Create Quote for Car
    Open Insurance Application
    Get Quote For Automobile
    Enter Vehicle Data    automobile    default
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote
