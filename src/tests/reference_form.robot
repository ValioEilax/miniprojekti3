*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application



*** Test Cases ***


Add A Book With Invalid Publisher And Without URL
    Go To          ${HOME_URL}
    Select From List By Value  id=ref_type  book
    Input Text  id=b_title  Robot Book
    Input Text  id=b_author  Book Author
    Input Text  id=b_year  2022
    Input Text  id=b_publisher  111
    Click Button  Add Book
    Input Text  id=b_publisher  Book Publisher
    Click Button  Add Book
    Add Reference Succeeds With Message  Robot Book

Add An Article With Invalid Title, Author And Journal Input And Without URL
    Go To          ${HOME_URL}
    # Select the "article" option from the dropdown
    Select From List By Value  id=ref_type  article
    Input Text  id=a_title  1
    Input Text  id=a_author  1
    Input Text  id=a_year  2022
    Input Text  id=a_journal  1
    Click Button  Add Article
    # change the invalid inputs
    Input Text  id=a_title  Robot Article
    Input Text  id=a_author  Article Author
    Input Text  id=a_journal  Article Journal
    Click Button  Add Article
    Add Reference Succeeds With Message  Robot Article

Add A Inproceeding With Many Authors And Invalid Year And Without URL
    Go To          ${HOME_URL}
    # Select the "inproceeding" option from the dropdown
    Select From List By Value  id=ref_type  inproceeding
    Input Text  id=i_title  Robot Inproceeding
    Input Text  id=i_author  Inproceeding Author1, Inproceeding Author2, Inproceeding Author3
    Input Text  id=i_year  Year
    Click Button  Add Inproceeding
    Input Text  id=i_year  2022
    Click Button  Add Inproceeding
    Add Reference Succeeds With Message  Robot Inproceeding


*** Keywords ***

Set Title
    [Arguments]  ${title}
    Input Text  title  ${title}


Set Author
    [Arguments]  ${author}
    Input Text  author  ${author}


Set Year
    [Arguments]  ${year}
    Input Text  year  ${year}


Set Publisher
    [Arguments]  ${publisher}
    Input Text  publisher  ${publisher}


Set Url
    [Arguments]  ${url}
    Input Text  url  ${url}

Add Reference Succeeds With Message
    [Arguments]  ${message}
    Page Should Contain  ${message}