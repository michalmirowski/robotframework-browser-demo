*** Settings ***
Resource        common.resource

*** Keywords ***
Enter Insurant Data
    Fill Text    id=firstname    Johnny
    Fill Text    id=lastname    Newtest    
    Fill Text    id=birthdate    01/01/1980
    Check Checkbox    text="Gender" >> .. >> text="Male"
    Fill Text    id=streetaddress    Main Street 1
    Select Options By    id=country    text    Austria
    Fill Text    id=zipcode    1120
    Fill Text    id=city    Vienna
    Select Options By    id=occupation    text    Employee
    Check Checkbox    text="Hobbies" >> .. >> text="Other"
    Click Next