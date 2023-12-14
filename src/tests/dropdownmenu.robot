*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

User Can Select Reference Type From A Dropdown-Menu And The Form Will Change
    Go To  ${HOME_URL}
    Select Reference Type From Menu  book
    Form Changes Correctly To  bookForm
    Select Reference Type From Menu  article
    Form Changes Correctly To  articleForm
    Select Reference Type From Menu  inproceeding
    Form Changes Correctly To  inproceedingForm


*** Keywords ***

Select Reference Type From Menu
    [Arguments]  ${type}
    Select From List By Value  id=ref_type  ${type}


Form Changes Correctly To
    [Arguments]  ${formType}
    Page Should Contain Element  id=${formType}