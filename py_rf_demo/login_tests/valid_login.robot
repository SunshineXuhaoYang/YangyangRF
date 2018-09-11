*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
#导入备注库
# Library           Builtin

*** Test Cases ***
Valid Login
    #添加备注
    # Log To Console      进入
    Open Browser To Login Page
    #输入注册框信息
    Input Username    username15
    Input Password    username15
    Input CfPwd       username15
    Input Email       username15@qq.com
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser