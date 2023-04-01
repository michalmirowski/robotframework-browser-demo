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
${right_hand_drive_rbtn}            text="Right Hand Drive" >> .. >> text
${cylinder_capacity_field}          id=cylindercapacity
${model_field}                      id=model
${number_of_seats_motor_field}      id=numberofseatsmotorcycle


*** Keywords ***
Enter Vehicle Data
    [Arguments]    ${vehicle}    ${variant}

# Common vehicle data
    Select Options By    ${make_field}    text    ${${vehicle}.${variant}.make}
    Fill Text    ${engine_performance_field}    ${${vehicle}.${variant}.engine_performance}
    Fill Text    ${date_of_manufacture_field}    ${${vehicle}.${variant}.date_of_manufacture}
    Fill Text    ${list_price_field}    ${${vehicle}.${variant}.list_price}
    Fill Text    ${annual_mileage_field}    ${${vehicle}.${variant}.annual_mileage}

# Data common for automobile, truck and camper
    IF    "${vehicle}" in ["automobile", "truck", "camper"]
        Select Options By    ${number_of_seats_field}    text    ${${vehicle}.${variant}.number_of_seats}
        Select Options By    ${fuel_field}    text    ${${vehicle}.${variant}.fuel}
        Fill Text    ${license_plate_number_field}    ${${vehicle}.${variant}.license_plate_number}
    END

# Data common for truck and camper
    IF    "${vehicle}" in ["truck", "camper"]
        Fill Text    ${payload_field}    ${${vehicle}.${variant}.payload}
        Fill Text    ${total_weight_field}    ${${vehicle}.${variant}.total_weight}
    END

# Data specific for camper
    IF    "${vehicle}" == "camper"
        Check Checkbox    ${right_hand_drive_rbtn}=${${vehicle}.${variant}.right_hand_drive}
    END

# Data specific for motorcycle
    IF    "${vehicle}" == "motorcycle"
        Select Options By    ${model_field}    text    ${${vehicle}.${variant}.model}
        Fill Text    ${cylinder_capacity_field}    ${${vehicle}.${variant}.cylinder_capacity}
        Select Options By    ${number_of_seats_motor_field}    text    ${${vehicle}.${variant}.number_of_seats}
    END

Enter Vehicle Data And Go Next
    [Arguments]    ${vehicle}    ${variant}
    Enter Vehicle Data    ${vehicle}    ${variant}
    Click Next
