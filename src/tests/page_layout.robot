*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

Forms Are On Top With The References Listed Below All On One Page
    Go To  ${HOME_URL}
    Page Contains A Form For References
    Books Are Listed On The Page
    Articles Are Listed On The Page
    Inproceedings Are Listed On The Page


*** Keywords ***

Page Contains A Form For References
    Page Should Contain Element  id=bookForm


Books Are Listed On The Page
    Page Should Contain  Books


Articles Are Listed On The Page
    Page Should Contain  Articles


Inproceedings Are Listed On The Page
    Page Should Contain  Inproceedings