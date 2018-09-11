*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
#所有用例执行之前执行
Suite Setup       Open Browser To Login Page
#所有用例执行完后执行
Suite Teardown    Close Browser
#每一个用例执行前执行
Test Setup        Go To Login Page
# 测试模板
Test Template     Login With Invalid Credentials Should Fail
#导入源文件
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD              CFPWD               EMAIL
Invalid Username                 123              ${VALID PASSWORD}     ${VALID CfPwd}      ${VALID Email}
Invalid Password                 ${VALID USER}    123                   ${VALID CfPwd}      ${VALID Email}
Invalid Email                    ${VALID USER}    ${VALID PASSWORD}     ${VALID CfPwd}      123

Empty Username                   ${EMPTY}         ${VALID PASSWORD}     ${VALID CfPwd}      ${VALID Email}
Empty Password                   ${VALID USER}    ${EMPTY}              ${VALID CfPwd}      ${VALID Email}
Empty CfPwd                      ${VALID USER}    ${VALID PASSWORD}     ${EMPTY}            ${VALID Email}
Empty EMPTY                      ${VALID USER}    ${VALID PASSWORD}     ${VALID CfPwd}      ${EMPTY}
Empty Information                ${EMPTY}         ${EMPTY}              ${EMPTY}            ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}   ${CfPwd}    ${Email}
    Input Username    ${username}
    Input Password    ${password}
    Input CfPwd     ${CfPwd}
    Input Email     ${Email}   
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    CNode：Node.js专业中文社区