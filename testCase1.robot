*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.google.com/
*** Test Cases ***
Validate Search Results in Google
    open browser     ${url}     ${browser}  #chromedriver.exe has been added into the Scripts folder.
    Maximize Browser Window
    Title Should Be     Google
    testSearchFunctionality
    Close Browser
*** Keywords ***
testSearchFunctionality
    ${"autoSuggestion"}     set variable    xpath://input[@class='gLFyf gsfi']
    element should be visible   ${"autoSuggestion"}
    Input Text  ${"autoSuggestion"}     robotframework
    Press Keys  ${"autoSuggestion"}     ENTER
    ${allLinks}     Set Variable    //a[starts-with(@href,'https://') and contains(@href,'robotframework')]
    ${allLinksCount}    Get Element Count   ${allLinks}
    Log     ${allLinksCount}
    Log To Console  ${allLinksCount}
    @{LinkItems}    Create List
    FOR   ${INDEX}    IN RANGE    1   ${allLinksCount}
        ${linktext}=     Get Text   ${allLinks}
        ${href}=    Get Element Attribute   ${allLinks}     @href
        Log    ${linktext}
        Log To Console    ("link text " ${linktext}"href "  ${href} ${INDEX})
    END




