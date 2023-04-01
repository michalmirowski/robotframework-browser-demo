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
Enter Vehicle Data Specific For Automobile
    [Arguments]    ${variant}
    Select Options By    ${number_of_seats_field}    text    ${automobile.${variant}.number_of_seats}
    Select Options By    ${fuel_field}    text    ${automobile.${variant}.fuel}
    Fill Text    ${license_plate_number_field}    ${automobile.${variant}.license_plate_number}

Enter Vehicle Data Specific For Truck
    [Arguments]    ${variant}
    Select Options By    ${number_of_seats_field}    text    ${truck.${variant}.number_of_seats}
    Select Options By    ${fuel_field}    text    ${truck.${variant}.fuel}
    Fill Text    ${payload_field}    ${truck.${variant}.payload}
    Fill Text    ${total_weight_field}    ${truck.${variant}.total_weight}
    Fill Text    ${license_plate_number_field}    ${truck.${variant}.license_plate_number}

Enter Vehicle Data Specific For Camper
    [Arguments]    ${variant}
    Select Options By    ${number_of_seats_field}    text    ${camper.${variant}.number_of_seats}
    Select Options By    ${fuel_field}    text    ${camper.${variant}.fuel}
    Check Checkbox    ${right_hand_drive_rbtn}=${camper.${variant}.right_hand_drive}
    Fill Text    ${payload_field}    ${camper.${variant}.payload}
    Fill Text    ${total_weight_field}    ${camper.${variant}.total_weight}
    Fill Text    ${license_plate_number_field}    ${camper.${variant}.license_plate_number}

Enter Vehicle Data Specific For Motorcycle
    [Arguments]    ${variant}
    Select Options By    ${model_field}    text    ${motorcycle.${variant}.model}
    Fill Text    ${cylinder_capacity_field}    ${motorcycle.${variant}.cylinder_capacity}
    Select Options By    ${number_of_seats_motor_field}    text    ${motorcycle.${variant}.number_of_seats}

Enter Vehicle Data
    [Arguments]    ${vehicle}    ${variant}
    Select Options By    ${make_field}    text    ${${vehicle}.${variant}.make}
    Fill Text    ${engine_performance_field}    ${${vehicle}.${variant}.engine_performance}
    Fill Text    ${date_of_manufacture_field}    ${${vehicle}.${variant}.date_of_manufacture}

    Fill Text    ${list_price_field}    ${${vehicle}.${variant}.list_price}

    Fill Text    ${annual_mileage_field}    ${${vehicle}.${variant}.annual_mileage}
    IF    "${vehicle}" == "automobile"
        Enter Vehicle Data Specific For Automobile    ${variant}
    ELSE IF    "${vehicle}" == "truck"
        Enter Vehicle Data Specific For Truck    ${variant}
    ELSE IF    "${vehicle}" == "camper"
        Enter Vehicle Data Specific For Camper    ${variant}
    ELSE IF    "${vehicle}" == "motorcycle"
        Enter Vehicle Data Specific For Motorcycle    ${variant}
    END

Enter Vehicle Data And Go Next
    [Arguments]    ${vehicle}    ${variant}
    Enter Vehicle Data    ${vehicle}    ${variant}
    Click Next
