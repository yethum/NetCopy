@echo off
rem 脚本用途：将文件夹/文件复制到指定网络路径，无提示直接覆盖，支持拖放

set "NetDir=\\192.168.1.105\test"	rem 网络路径
set "Partition=X:"	rem 希望被映射的路径
set "Password=mytest" rem 共享文件夹密码
set "User=test"	rem 共享文件夹用户
set "SrcPath=.\test1" rem 被拷贝的目录
set "DstPath=%Partition%\" rem 目标目录
IF NOT "%1"=="" set "SrcPath=%1" rem 支持拖放

@echo 尝试查找并连接共享目录
if exist %Partition% net use %Partition% /delete
if exist %NetDir% net use %Partition% %NetDir% %Password% /User:%User% /Persistent:no
@echo 复制目录到共享目录
SET COPYCMD=/Y
xcopy /e /s %SrcPath% %DstPath%
if exist %Partition% net use %Partition% /delete
@echo 成功
if NOT ["%errorlevel%"]==["0"] pause