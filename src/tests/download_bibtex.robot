*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application



*** Test Cases ***

References Can Be Downloaded Into Bibtex-file
    Go To  ${HOME_URL}
    Page Contains Download Bibtex-file -button
    Click Download Bibtex-file -button


*** Keywords ***

Page Contains Download Bibtex-file -button
    Page Should Contain Element  name=bibtex


Click Download Bibtex-file -button
    Click Element  name=bibtex