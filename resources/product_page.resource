*** Settings ***
Resource    common.resource
Library    DateTime


*** Keywords ***
Enter Product Data
    ${cur_date}=    Get Current Date
    ${start_date}=    Add Time To Date    ${cur_date}    32 days    result_format=%m/%d/%Y
    Fill Text    id=startdate    ${start_date}
    Select Options By    id=insurancesum    text    5.000.000,00
    Select Options By    id=meritrating    text    Bonus 2
    Select Options By    id=damageinsurance    text    No Coverage
    Check Checkbox    *css=.ideal-radiocheck-label >> id=EuroProtection
    Select Options By    id=courtesycar    text    No
    Click Next
