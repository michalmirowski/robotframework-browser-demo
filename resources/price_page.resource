*** Settings ***
Resource        common.resource
Variables       ../data/price.yaml


*** Variables ***
# locators
${selectpriceoption_link}       id=selectpriceoption
${price_plans_table}            id=priceTable
${price_plans_block}            id=pricePlans
${price_plans_warning}
...                             id=xLoaderPrice >> text="Please, complete the first three steps to see the price table."
${silver_rbtn}                  *css=.ideal-radiocheck-label >> id=selectsilver
${gold_rbtn}                    *css=.ideal-radiocheck-label >> id=selectgold
${platinum_rbtn}                *css=.ideal-radiocheck-label >> id=selectplatinum
${ultimate_rbtn}                *css=.ideal-radiocheck-label >> id=selectultimate


*** Keywords ***
Go To Select Price Option
    Click    ${selectpriceoption_link}

Select Price Option
    [Arguments]    ${option}
    Check Checkbox    ${${option}_rbtn}

Select Price Option And Go Next
    [Arguments]    ${option}
    Select Price Option    ${option}
    Click Next

Verify Price Plans Cell
    [Arguments]    ${column}    ${row}    ${expected}
    ${e}=    Get Table Cell Element    ${price_plans_table}    "${column}"    "${row}"
    Get Text    ${e}    ==    ${expected}

Verify Data In Price Plans Table
    FOR    ${plan}    IN    @{price.plans}
        Verify Price Plans Cell    ${plan}    Online Claim    ${price.${plan}.claim}
        Verify Price Plans Cell    ${plan}    Claims Discount (%)    ${price.${plan}.discount}
        Verify Price Plans Cell    ${plan}    Worldwide Cover    ${price.${plan}.worldwide}
    END

Verify Price Option Cannot Be Selected
    Go To Select Price Option
    Wait For Elements State    ${price_plans_warning}    visible
    Wait For Condition    Style    ${price_plans_block}    display    ==    none
