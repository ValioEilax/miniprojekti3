*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

Book Reference With Valid Information Can Be Added To Database
    Go To  ${HOME_URL}
    Select Reference Type From Menu  book
    Set Title  b_title  Robot Book
    Set Author  b_author  Book Author
    Set Year  b_year  2022
    Set Publisher  b_publisher  Book Publisher
    Set Url  b_url  https://www.helsinki.fi
    Click Button  Add Book
    Page Contains The Newly Added Reference  Robot Book


Article Reference With Valid Information Can Be Added To Database
    Go To  ${HOME_URL}
    Select Reference Type From Menu  article
    Set Title  a_title  Robot Article
    Set Author  a_author  Article Author
    Set Year  a_year  2022
    Set Journal  a_journal  Article Journal
    Set Url  a_url  https://www.helsinki.fi
    Click Button  Add Article
    Page Contains The Newly Added Reference  Robot Article


Inproceeding Reference With Valid Information Can Be Added To Database
    Go To  ${HOME_URL}
    Select Reference Type From Menu  inproceeding
    Set Title  i_title  Robot Inproceeding
    Set Author  i_author  Inproceeding Author
    Set Year  i_year  2021
    Set Url  i_url  https://www.helsinki.fi
    Click Button  Add Inproceeding
    Page Contains The Newly Added Reference  Robot Inproceeding


*** Keywords ***

Select Reference Type From Menu
    [Arguments]  ${type}
    Select From List By Value  id=ref_type  ${type}


Set Title
    [Arguments]  ${id}  ${title}
    Input Text  ${id}  ${title}


Set Author
    [Arguments]  ${id}  ${author}
    Input Text  ${id}  ${author}


Set Year
    [Arguments]  ${id}  ${year}
    Input Text  ${id}  ${year}


Set Publisher
    [Arguments]  ${id}  ${publisher}
    Input Text  ${id}  ${publisher}


Set Url
    [Arguments]  ${id}  ${url}
    Input Text  ${id}  ${url}


Set Journal
    [Arguments]  ${id}  ${journal}
    Input Text  ${id}  ${journal}


Page Contains The Newly Added Reference
    [Arguments]  ${message}
    Page Should Contain  ${message}
