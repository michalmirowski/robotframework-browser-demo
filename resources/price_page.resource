*** Settings ***
Resource    common.resource


*** Variables ***
# locators
${selectpriceoption_link}       id=selectpriceoption


*** Keywords ***
Go To Select Price Option
    Click    ${selectpriceoption_link}

Select Price Option
    Check Checkbox    *css=.ideal-radiocheck-label >> id=selectgold

Select Price Option And Go Next
    Check Checkbox    *css=.ideal-radiocheck-label >> id=selectgold
    Click Next

Verify Price Option Cannot Be Selected
    Go To Select Price Option
    Wait For Elements State
    ...    id=xLoaderPrice >> text="Please, complete the first three steps to see the price table."
    ...    visible
    Wait For Condition
    ...    Style
    ...    id=pricePlans
    ...    display
    ...    ==
    ...    none
