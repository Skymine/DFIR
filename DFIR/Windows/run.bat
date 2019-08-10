@echo off
echo.
echo ===============================================================
echo.
echo                     《Windows应急取证脚本》   	   
echo                      Version：2018.8.9		   
echo                        作者：SkyMine    	   
echo.
echo                         【工具说明】               	   
echo                本工具主要用于Windows操作系统的应急取	   
echo            证阶段，进行自动化的系统取证，取证内容包括   
echo            操作系统日志、内存Dump数据、操作系统信息、   
echo            进程信息、网络连接信息、防火墙信息、服务列   
echo            表、计划任务、DNS缓存、用户信息、系统时间、  
echo            文件共享信息等。	                           
echo.
echo                           【注意】     
echo                  必须以管理员身份运行此脚本！	 
echo.
echo ===============================================================
echo.
echo             是否开始执行脚本？若执行请按任意键继续……
echo.
cd /d %~dp0
setlocal EnableDelayedExpansion
pause 1 >nul
echo.
set filename=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%
echo 注意：本次的取证信息将输出在【!cd!\%filename%】！
mkdir %filename%
echo.
echo     1.即将开始Dump内存数据，请输入y开始Dump，此过程需时较长，显示绿色Success后请点回车继续下一步……
mkdir !cd!\%filename%\01-内存数据
copy /Y !cd!\tools\Memory.exe !cd!\%filename%\01-内存数据 1>nul
cd !cd!\%filename%\01-内存数据
Memory.exe
del Memory.exe
cd ../../
echo.
echo     2.正在提取操作系统日志……
mkdir !cd!\%filename%\02-操作系统日志
copy /Y %SystemRoot%\System32\Winevt\Logs\* !cd!\%filename%\02-操作系统日志 1>nul
echo.
echo       完成！
echo.
echo     3.正在提取进程详细列表……
mkdir !cd!\%filename%\03-进程
tasklist /V > %filename%/03-进程/01-当前进程详细列表.txt
echo.
echo       完成！
echo.
echo     4.正在提取当前每个进程对应的服务……
tasklist /SVC > %filename%/03-进程/02-当前每个进程对应的服务.txt
echo.
echo       完成！
echo.
echo     5.正在提取Microsoft应用及其关联的进程……
tasklist /APPS > %filename%/03-进程/03-Microsoft应用及其关联的进程.txt
echo.
echo       完成！
echo.
echo     6.正在提取当前进程调用的模块……
tasklist /M > %filename%/03-进程/04-当前进程调用的模块.txt
echo.
echo       完成！
echo.
echo     7.正在提取进程详细信息……
wmic process list full /format:hform > %filename%/03-进程/05-进程详细信息.html
echo.
echo       完成！
echo.
echo     8.正在提取当前网络连接信息……
mkdir !cd!\%filename%\04-网络
netstat -anob > %filename%/04-网络/01-当前网络连接信息.txt
echo.
echo       完成！
echo.
echo     9.正在提取当前网络接口信息……
ipconfig /all > %filename%/04-网络/02-当前网络接口信息.txt
echo.
echo       完成！
echo.
echo     10.正在提取DNS缓存……
ipconfig /displaydns > %filename%/04-网络/03-DNS缓存.txt
echo.
echo       完成！
echo.
echo     11.正在提取Windows防火墙的配置文件属性……
mkdir !cd!\%filename%\05-防火墙
netsh advfirewall show allprofiles > %filename%/05-防火墙/01-Windows防火墙配置文件属性.txt
echo.
echo       完成！
echo.
echo     12.正在提取Windows防火墙的全局属性……
netsh advfirewall show global > %filename%/05-防火墙/02-Windows防火墙全局属性.txt
echo.
echo       完成！
echo.
echo     13.正在提取Windows防火墙的全部规则……
netsh advfirewall firewall show rule name=all > %filename%/05-防火墙/03-Windows防火墙全部规则.txt
echo.
echo       完成！
echo.
echo     14.正在提取Windows防火墙的入站规则……
netsh advfirewall firewall show rule name=all dir=in > %filename%/05-防火墙/04-Windows防火墙入站规则.txt
echo.
echo       完成！
echo.
echo     15.正在提取Windows防火墙的出站规则……
netsh advfirewall firewall show rule name=all dir=out > %filename%/05-防火墙/05-Windows防火墙出站规则.txt
echo.
echo       完成！
echo.
echo     16.正在提取操作系统信息……
echo.
mkdir !cd!\%filename%\06-系统
systeminfo > %filename%/06-系统/01-操作系统信息.txt
echo       完成！
echo.
echo     17.正在提取用户组信息……
echo.
net user > %filename%/06-系统/02-用户组信息.txt
net localgroup > %filename%/06-系统/02-用户组信息.txt
net localgroup administrators > %filename%/06-系统/02-用户组信息.txt
echo       完成！
echo.
echo     18.正在提取文件共享信息……
echo.
net share > %filename%/06-系统/03-文件共享信息.txt
echo       完成！
echo.
echo     19.正在提取系统启动项信息……
echo.
wmic startup > %filename%/06-系统/04-系统启动项信息.txt
echo       完成！
echo.
echo     20.正在提取计划任务信息……
echo.
schtasks /query /FO LIST /V > %filename%/06-系统/05-计划任务信息.txt
echo       完成！
echo.
echo     21.正在提取系统服务列表……
echo.
schtasks /query /FO LIST /V > %filename%/06-系统/06-系统服务列表.txt
echo       完成！
echo.
echo.
echo.   【Windows应急取证已完成，所有取证信息已经被分类归纳】
echo.
echo.
echo.
pause
