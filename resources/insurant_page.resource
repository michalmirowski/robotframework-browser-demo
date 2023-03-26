*** Settings ***
Resource        common.resource
Variables       ../data/insurant.yaml


*** Variables ***
# locators
${firstname_field}          id=firstname
${lastname_field}           id=lastname
${birthdate_field}          id=birthdate
${gender_rbtn}              text="Gender" >> .. >> text
${streetaddress_field}      id=streetaddress
${country_field}            id=country
${zipcode_field}            id=zipcode
${city_field}               id=city
${occupation_field}         id=occupation
${hobbies_checkbox}         text="Hobbies" >> .. >> text


*** Keywords ***
Enter Insurant Data
    [Arguments]    ${variant}
    Fill Text    ${firstname_field}    ${insurant.${variant}.firstname}
    Fill Text    ${lastname_field}    ${insurant.${variant}.lastname}
    Fill Text    ${birthdate_field}    ${insurant.${variant}.birthdate}
    Check Checkbox    ${gender_rbtn}="${insurant.${variant}.gender}"
    Fill Text    ${streetaddress_field}    ${insurant.${variant}.streetaddress}
    Select Options By    ${country_field}    text    ${insurant.${variant}.country}
    Fill Text    ${zipcode_field}    ${insurant.${variant}.zipcode}
    Fill Text    ${city_field}    ${insurant.${variant}.city}
    Select Options By    ${occupation_field}    text    ${insurant.${variant}.occupation}
    Check Multiple Checkboxes    ${hobbies_checkbox}    ${insurant.${variant}.hobbies}

Enter Insurant Data And Go Next
    [Arguments]    ${variant}
    Enter Insurant Data    ${variant}
    Click Next
