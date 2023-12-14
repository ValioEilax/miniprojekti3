*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

Delete Book
    Go To  ${HOME_URL}
    Click Delete Button
    Wait Until Confirmation Window Pops Up
    Click Confirm Delete Button
    Delete Reference Succeeds With Message  Deleted book from database


*** Keywords ***

Click Delete Button
    Click Element  name=book


Wait Until Confirmation Window Pops Up
    Wait Until Element Is Visible  id=del_btn


Click Confirm Delete Button
    Click Element  id=del_btn


Delete Reference Succeeds With Message
    [Arguments]  ${message}
    Page Should Contain  ${message}