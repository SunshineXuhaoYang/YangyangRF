*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               测试登录
#导入库
Library           Selenium2Library
Library           Builtin
#定义变量
*** Variables ***
${url}  http://118.31.19.120:3000
#用户定义关键字
*** Keywords ***
用户登录
    Open Browser    url=${url}   browser=chrome
    Click Element	link:登录
    Input Text      id:name                         testuser1
    Input Text      id:pass                         123456
    Click Button    class:span-primary
    ${item}     Get Time
    Log To Console  ${item} 
*** Test Cases *** 
open login
# 测试登录
    
    用户登录
发帖
# 测试发帖
   
    用户登录