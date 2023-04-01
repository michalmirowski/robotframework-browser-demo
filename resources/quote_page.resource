*** Settings ***
Resource    common.resource
Variables    ../data/quote.yaml


*** Variables ***
# locators
${phone_field}              id=phone
${username_field}           id=username
${password_field}           id=password
${confirmpassword_field}    id=confirmpassword
${email_field}              id=email
${comments_field}           id=Comments
${sendemail_btn}            id=sendemail
${alert}                    .sweet-alert.showSweetAlert>h2
${confirm_btn}              .confirm


*** Keywords ***
Enter User Data
    [Arguments]    ${variant}
    Fill Text    ${phone_field}    ${quote.${variant}.phone}
    Fill Text    ${username_field}    ${quote.${variant}.username}
    Fill Text    ${password_field}    ${quote.${variant}.password}
    Fill Text    ${confirmpassword_field}    ${quote.${variant}.confirmpassword}
    Fill Text    ${email_field}    ${quote.${variant}.email}
    Fill Text    ${comments_field}    ${quote.${variant}.comments}

Enter User Data And Send Quote Successfully
    Enter User Data    default
    Click    ${sendemail_btn}
    Wait For Condition    Text    ${alert}    contains    Sending e-mail success!
    Click    ${confirm_btn}

Enter Incomplete User Data And Send Quote Unsuccessfully
    Enter User Data    default
    Clear Text    ${email_field} 
    Click    ${sendemail_btn}
    Wait For Condition    Text    ${alert}    contains    Not finished yet...
    Click    ${confirm_btn}