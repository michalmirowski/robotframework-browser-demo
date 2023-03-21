*** Settings ***
Resource    common.resource


*** Keywords ***
Select Price Option
    Check Checkbox    *css=.ideal-radiocheck-label >> id=selectgold
    Click Next
