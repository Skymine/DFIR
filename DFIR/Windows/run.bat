@echo off
echo.
echo ===============================================================
echo.
echo                     ��WindowsӦ��ȡ֤�ű���   	   
echo                      Version��2018.8.9		   
echo                        ���ߣ�SkyMine    	   
echo.
echo                         ������˵����               	   
echo                ��������Ҫ����Windows����ϵͳ��Ӧ��ȡ	   
echo            ֤�׶Σ������Զ�����ϵͳȡ֤��ȡ֤���ݰ���   
echo            ����ϵͳ��־���ڴ�Dump���ݡ�����ϵͳ��Ϣ��   
echo            ������Ϣ������������Ϣ������ǽ��Ϣ��������   
echo            ���ƻ�����DNS���桢�û���Ϣ��ϵͳʱ�䡢  
echo            �ļ�������Ϣ�ȡ�	                           
echo.
echo                           ��ע�⡿     
echo                  �����Թ���Ա������д˽ű���	 
echo.
echo ===============================================================
echo.
echo             �Ƿ�ʼִ�нű�����ִ���밴�������������
echo.
cd /d %~dp0
setlocal EnableDelayedExpansion
pause 1 >nul
echo.
set filename=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%
echo ע�⣺���ε�ȡ֤��Ϣ������ڡ�!cd!\%filename%����
mkdir %filename%
echo.
echo     1.������ʼDump�ڴ����ݣ�������y��ʼDump���˹�����ʱ�ϳ�����ʾ��ɫSuccess�����س�������һ������
mkdir !cd!\%filename%\01-�ڴ�����
copy /Y !cd!\tools\Memory.exe !cd!\%filename%\01-�ڴ����� 1>nul
cd !cd!\%filename%\01-�ڴ�����
Memory.exe
del Memory.exe
cd ../../
echo.
echo     2.������ȡ����ϵͳ��־����
mkdir !cd!\%filename%\02-����ϵͳ��־
copy /Y %SystemRoot%\System32\Winevt\Logs\* !cd!\%filename%\02-����ϵͳ��־ 1>nul
echo.
echo       ��ɣ�
echo.
echo     3.������ȡ������ϸ�б���
mkdir !cd!\%filename%\03-����
tasklist /V > %filename%/03-����/01-��ǰ������ϸ�б�.txt
echo.
echo       ��ɣ�
echo.
echo     4.������ȡ��ǰÿ�����̶�Ӧ�ķ��񡭡�
tasklist /SVC > %filename%/03-����/02-��ǰÿ�����̶�Ӧ�ķ���.txt
echo.
echo       ��ɣ�
echo.
echo     5.������ȡMicrosoftӦ�ü�������Ľ��̡���
tasklist /APPS > %filename%/03-����/03-MicrosoftӦ�ü�������Ľ���.txt
echo.
echo       ��ɣ�
echo.
echo     6.������ȡ��ǰ���̵��õ�ģ�顭��
tasklist /M > %filename%/03-����/04-��ǰ���̵��õ�ģ��.txt
echo.
echo       ��ɣ�
echo.
echo     7.������ȡ������ϸ��Ϣ����
wmic process list full /format:hform > %filename%/03-����/05-������ϸ��Ϣ.html
echo.
echo       ��ɣ�
echo.
echo     8.������ȡ��ǰ����������Ϣ����
mkdir !cd!\%filename%\04-����
netstat -anob > %filename%/04-����/01-��ǰ����������Ϣ.txt
echo.
echo       ��ɣ�
echo.
echo     9.������ȡ��ǰ����ӿ���Ϣ����
ipconfig /all > %filename%/04-����/02-��ǰ����ӿ���Ϣ.txt
echo.
echo       ��ɣ�
echo.
echo     10.������ȡDNS���桭��
ipconfig /displaydns > %filename%/04-����/03-DNS����.txt
echo.
echo       ��ɣ�
echo.
echo     11.������ȡWindows����ǽ�������ļ����ԡ���
mkdir !cd!\%filename%\05-����ǽ
netsh advfirewall show allprofiles > %filename%/05-����ǽ/01-Windows����ǽ�����ļ�����.txt
echo.
echo       ��ɣ�
echo.
echo     12.������ȡWindows����ǽ��ȫ�����ԡ���
netsh advfirewall show global > %filename%/05-����ǽ/02-Windows����ǽȫ������.txt
echo.
echo       ��ɣ�
echo.
echo     13.������ȡWindows����ǽ��ȫ�����򡭡�
netsh advfirewall firewall show rule name=all > %filename%/05-����ǽ/03-Windows����ǽȫ������.txt
echo.
echo       ��ɣ�
echo.
echo     14.������ȡWindows����ǽ����վ���򡭡�
netsh advfirewall firewall show rule name=all dir=in > %filename%/05-����ǽ/04-Windows����ǽ��վ����.txt
echo.
echo       ��ɣ�
echo.
echo     15.������ȡWindows����ǽ�ĳ�վ���򡭡�
netsh advfirewall firewall show rule name=all dir=out > %filename%/05-����ǽ/05-Windows����ǽ��վ����.txt
echo.
echo       ��ɣ�
echo.
echo     16.������ȡ����ϵͳ��Ϣ����
echo.
mkdir !cd!\%filename%\06-ϵͳ
systeminfo > %filename%/06-ϵͳ/01-����ϵͳ��Ϣ.txt
echo       ��ɣ�
echo.
echo     17.������ȡ�û�����Ϣ����
echo.
net user > %filename%/06-ϵͳ/02-�û�����Ϣ.txt
net localgroup > %filename%/06-ϵͳ/02-�û�����Ϣ.txt
net localgroup administrators > %filename%/06-ϵͳ/02-�û�����Ϣ.txt
echo       ��ɣ�
echo.
echo     18.������ȡ�ļ�������Ϣ����
echo.
net share > %filename%/06-ϵͳ/03-�ļ�������Ϣ.txt
echo       ��ɣ�
echo.
echo     19.������ȡϵͳ��������Ϣ����
echo.
wmic startup > %filename%/06-ϵͳ/04-ϵͳ��������Ϣ.txt
echo       ��ɣ�
echo.
echo     20.������ȡ�ƻ�������Ϣ����
echo.
schtasks /query /FO LIST /V > %filename%/06-ϵͳ/05-�ƻ�������Ϣ.txt
echo       ��ɣ�
echo.
echo     21.������ȡϵͳ�����б���
echo.
schtasks /query /FO LIST /V > %filename%/06-ϵͳ/06-ϵͳ�����б�.txt
echo       ��ɣ�
echo.
echo.
echo.   ��WindowsӦ��ȡ֤����ɣ�����ȡ֤��Ϣ�Ѿ���������ɡ�
echo.
echo.
echo.
pause
