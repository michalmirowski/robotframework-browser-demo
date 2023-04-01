*** Settings ***
Resource        common.resource
Library         utils.py
Library         DateTime
Variables       ../data/product.yaml


*** Variables ***
# locators
${enterproductdata_link}            id=enterproductdata
${enterproductdata_counter}         \#enterproductdata>.counter
${startdate_field}                  id=startdate
${start_date_icon}                  id=startdate >> .. >> .icon
${start_date warning}               "Must be more than one month in the future"
${insurancesum_field}               id=insurancesum
${meritrating_field}                id=meritrating
${damageinsurance_field}            id=damageinsurance
${optional_products_checkbox}       text="Optional Products" >> .. >> text
${courtesycar_field}                id=courtesycar


*** Keywords ***
Go To Enter Product Data
    Click    ${enterproductdata_link}

Determine Buffor For Start Date
    [Documentation]    Determines valid start date of the insurance, based on the fact that it needs to be more than a one month in advance
    ${cur_date}=    Get Current Date    result_format=datetime
    ${leap_year}=    Is Year Leap    ${cur_date.year}
    IF    ${cur_date.month} in [1, 3, 5, 7, 8, 10, 12]
        Set Test Variable    ${buffor}    32
    ELSE IF    ${cur_date.month} in [4, 6, 9, 11]
        Set Test Variable    ${buffor}    31
    ELSE IF    ${leap_year}
        Set Test Variable    ${buffor}    30
    ELSE
        Set Test Variable    ${buffor}    29
    END
    ${start_date}=    Add Time To Date    ${cur_date}    ${buffor} days
    RETURN    ${start_date}

Enter Valid Start Date
    ${start_date}=    Determine Buffor For Start Date
    ${start_date}=    Convert Date    ${start_date}    result_format=%m/%d/%Y
    Fill Text    ${startdate_field}    ${start_date}

Enter Invalid Start Date
    ${start_date}=    Determine Buffor For Start Date
    ${start_date}=    Subtract Time From Date    ${start_date}    1 day    result_format=%m/%d/%Y
    Fill Text    ${startdate_field}    ${start_date}

Enter Product Data
    [Documentation]    By default enters product data with a valid start date of insurance, but flag can be overriden
    [Arguments]    ${vehicle}    ${variant}    ${invalid_start_date}=False
    IF    ${invalid_start_date}
        Enter Invalid Start Date
    ELSE
        Enter Valid Start Date
    END
    Select Options By    ${insurancesum_field}    text    ${product.${variant}.insurancesum}
    Select Options By    ${damageinsurance_field}    text    ${product.${variant}.damageinsurance}
    Check Multiple Checkboxes    ${optional_products_checkbox}    ${product.${variant}.optional_products}
# handle meritrating and courtesy car fields that are specific for Automobile
    IF    "${vehicle}" == "automobile"
        Select Options By    ${meritrating_field}    text    ${product.${variant}.meritrating}
        Select Options By    ${courtesycar_field}    text    ${product.${variant}.courtesycar}
    END

Enter Product Data And Go Next
    [Arguments]    ${vehicle}    ${variant}
    Enter Product Data    ${vehicle}    ${variant}
    Click Next

Verify Start Date Field Is Correctly Validated
    Get Text    ${enterproductdata_counter}    ==    1
    Click    ${start_date_icon}
    Wait For Elements State    ${start_date warning}    visible
