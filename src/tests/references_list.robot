*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

Book References Are Listed Neatly And Display Key Details
    Go To  ${HOME_URL}
    Page Contains List Of Book References
    Page Contains Key Detail  Title
    Page Contains Key Detail  Author
    Page Contains Key Detail  Year
    Page Contains Key Detail  Publisher
    Page Contains Key Detail  URL


Article References Are Listed Neatly And Display Key Details
    Page Should Contain  Articles
    Page Contains Key Detail  Title
    Page Contains Key Detail  Author
    Page Contains Key Detail  Year
    Page Contains Key Detail  Journal
    Page Contains Key Detail  URL


Inproceeding References Are Listed Neatly And Display Key Details
    Page Should Contain  Inproceedings
    Page Contains Key Detail  Title
    Page Contains Key Detail  Author
    Page Contains Key Detail  Year
    Page Contains Key Detail  URL


*** Keywords ***

Page Contains List Of Book References
    Page Should Contain  Books


Page Contains Key Detail
    [Arguments]  ${detail}
    Page Should Contain  ${detail}