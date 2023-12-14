*** Settings ***
Resource          resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Application

*** Test Cases ***
App Is Launched Online
    Go To  https://miniprojekti3.fly.dev/
    Page Should Contain  Welcome