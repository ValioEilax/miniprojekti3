*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application



*** Test Cases ***

Reference to Bibtex-file
    Go To          ${HOME_URL}
    #there is a download button
    Click Element    name=bibtex
    Page Should Contain    References


