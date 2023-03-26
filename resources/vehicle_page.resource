*** Settings ***
Resource        common.resource
Variables       ../data/vehicles.yaml


*** Variables ***
# locators
${make_field}                       id=make
${engine_performance_field}         id=engineperformance
${date_of_manufacture_field}        id=dateofmanufacture
${number_of_seats_field}            id=numberofseats
${fuel_field}                       id=fuel
${list_price_field}                 id=listprice
${license_plate_number_field}       id=licenseplatenumber
${annual_mileage_field}             id=annualmileage
${payload_field}                    id=payload
${total_weight_field}               id=totalweight
${right_hand_drive_yes_btn}         id=righthanddriveyes


*** Keywords ***
Enter Vehicle Data Specific for Automobile
    [Arguments]    ${variant}
    Select Options By    ${fuel_field}    text    ${automobile.${variant}.fuel}

Enter Vehicle Data Specific for Truck
    [Arguments]    ${variant}
    Select Options By    ${fuel_field}    text    ${truck.${variant}.fuel}
    Fill Text    ${payload_field}    ${truck.${variant}.payload}
    Fill Text    ${total_weight_field}    ${truck.${variant}.payload}

Enter Vehicle Data Specific for Camper
    [Arguments]    ${variant}
    Select Options By    ${fuel_field}    text    ${camper.${variant}.fuel}
    Fill Text    ${payload_field}    ${camper.${variant}.payload}
    Fill Text    ${total_weight_field}    ${camper.${variant}.payload}
    Check Checkbox    ${right_hand_drive_yes_btn}

Enter Vehicle Data
    [Arguments]    ${vehicle}    ${variant}
    Select Options By    ${make_field}    text    ${${vehicle}.${variant}.make}
    Fill Text    ${engine_performance_field}    ${${vehicle}.${variant}.engine_performance}
    Fill Text    ${date_of_manufacture_field}    ${${vehicle}.${variant}.date_of_manufacture}
    Select Options By    ${number_of_seats_field}    text    ${${vehicle}.${variant}.number_of_seats}
    Fill Text    ${list_price_field}    ${${vehicle}.${variant}.list_price}
    Fill Text    ${license_plate_number_field}    ${${vehicle}.${variant}.license_plate_number}
    Fill Text    ${annual_mileage_field}    ${${vehicle}.${variant}.annual_mileage}
    IF    "${vehicle}" == "automobile"
        Enter Vehicle Data Specific for Automobile    ${variant}
    END
    IF    "${vehicle}" == "truck"
        Enter Vehicle Data Specific for Truck    ${variant}
    END
    IF    "${vehicle}" == "camper"
        Enter Vehicle Data Specific for Camper    ${variant}
    END

Enter Vehicle Data And Go Next
    [Arguments]    ${vehicle}    ${variant}
    Enter Vehicle Data    ${vehicle}    ${variant}
    Click Next
