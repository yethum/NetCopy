@echo off
rem �ű���;�����ļ���/�ļ����Ƶ�ָ������·��������ʾֱ�Ӹ��ǣ�֧���Ϸ�

set "NetDir=\\192.168.1.105\test"	rem ����·��
set "Partition=X:"	rem ϣ����ӳ���·��
set "Password=mytest" rem �����ļ�������
set "User=test"	rem �����ļ����û�
set "SrcPath=.\test1" rem ��������Ŀ¼
set "DstPath=%Partition%\" rem Ŀ��Ŀ¼
IF NOT "%1"=="" set "SrcPath=%1" rem ֧���Ϸ�

@echo ���Բ��Ҳ����ӹ���Ŀ¼
if exist %Partition% net use %Partition% /delete
if exist %NetDir% net use %Partition% %NetDir% %Password% /User:%User% /Persistent:no
@echo ����Ŀ¼������Ŀ¼
SET COPYCMD=/Y
xcopy /e /s %SrcPath% %DstPath%
if exist %Partition% net use %Partition% /delete
@echo �ɹ�
if NOT ["%errorlevel%"]==["0"] pause