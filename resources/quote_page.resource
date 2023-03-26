*** Settings ***
Resource    common.resource


*** Keywords ***
Enter User Data
    Fill Text    id=email    test@example.com
    Fill Text    id=phone    123456789
    Fill Text    id=username    Johnny
    Fill Text    id=password    superSecret1
    Fill Text    id=confirmpassword    superSecret1
    Fill Text    id=Comments    Just testing!

Send Quote Successfully
    Enter User Data
    Click    id=sendemail
    Wait For Condition    Text    .sweet-alert.showSweetAlert>h2    contains    Sending e-mail success!
    Click    .confirm
