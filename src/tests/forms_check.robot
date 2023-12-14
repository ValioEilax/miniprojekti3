*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application


*** Test Cases ***

User Can Not Add A Book With Invalid Publisher And URL Is Not Required
    Go To  ${HOME_URL}
    Select Reference Type From Menu  book
    Set Title  b_title  Robot Book
    Set Author  b_author  Book Author
    Set Year  b_year  2022
    Set Publisher  b_publisher  111
    Click Button  Add Book
    Set Publisher  b_publisher  Book Publisher
    Click Button  Add Book
    Page Contains The Newly Added Reference  Robot Book


User Can Not Add An Article With Invalid Title, Author And Journal And URL Is Not Required
    Go To  ${HOME_URL}
    Select Reference Type From Menu  article
    Set Title  a_title  1
    Set Author  a_author  1
    Set Year  a_year  2022
    Set Journal  a_journal  1
    Click Button  Add Article
    Set Title  a_title  Robot Article
    Set Author  a_author  Article Author
    Set Journal  a_journal  Article Journal
    Click Button  Add Article
    Page Contains The Newly Added Reference  Robot Article

User Can Not Add An Inproceeding With Invalid Year But Can Add Many Authors And URL Is Not Required
    Go To  ${HOME_URL}
    Select Reference Type From Menu  inproceeding
    Set Title  i_title  Robot Inproceeding
    Set Author  i_author  Lastname1, Firstname1 and Lastname2, Firstname2 and Lastname3, Firstname3
    Set Year  i_year  Year
    Click Button  Add Inproceeding
    Set Year  i_year  2022
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
