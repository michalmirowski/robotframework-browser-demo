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
Enter Vehicle Data
    [Arguments]    ${vehicle_type}    ${test_variant}
    Select Options By    id=make    text    ${${vehicle_type}.${test_variant}.make}
    Fill Text    ${engine_performance_field}    ${${vehicle_type}.${test_variant}.engine_performance}
    Fill Text    ${date_of_manufacture_field}    ${${vehicle_type}.${test_variant}.date_of_manufacture}
    Select Options By    ${number_of_seats_field}    text    ${${vehicle_type}.${test_variant}.number_of_seats}
    Fill Text    ${list_price_field}    ${${vehicle_type}.${test_variant}.list_price}
    Fill Text    ${license_plate_number_field}    ${${vehicle_type}.${test_variant}.license_plate_number}
    Fill Text    ${annual_mileage_field}    ${${vehicle_type}.${test_variant}.annual_mileage}
    IF    "${vehicle_type}" == "automobile"
        Enter Vehicle Data Specific for Automobile    ${test_variant}
    END
    IF    "${vehicle_type}" == "truck"
        Enter Vehicle Data Specific for Truck    ${test_variant}
    END
    IF    "${vehicle_type}" == "camper"
        Enter Vehicle Data Specific for Camper    ${test_variant}
    END
    Click Next

Enter Vehicle Data Specific for Automobile
    [Arguments]    ${test_variant}
    Select Options By    ${fuel_field}    text    ${automobile.${test_variant}.fuel}

Enter Vehicle Data Specific for Truck
    [Arguments]    ${test_variant}
    Select Options By    ${fuel_field}    text    ${truck.${test_variant}.fuel}
    Fill Text    ${payload_field}    ${truck.${test_variant}.payload}
    Fill Text    ${total_weight_field}    ${truck.${test_variant}.payload}

Enter Vehicle Data Specific for Camper
    [Arguments]    ${test_variant}
    Select Options By    ${fuel_field}    text    ${camper.${test_variant}.fuel}
    Fill Text    ${payload_field}    ${camper.${test_variant}.payload}
    Fill Text    ${total_weight_field}    ${camper.${test_variant}.payload}
    Check Checkbox    ${right_hand_drive_yes_btn}
