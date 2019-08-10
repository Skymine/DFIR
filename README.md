                   《Windows应急取证脚本》   	   
                     Version：2018.8.9		   
                       作者：SkyMine    	   

                       【工具说明】               	   
              本工具主要用于Windows操作系统的应急取	   
          证阶段，进行自动化的系统取证，取证内容包括   
          操作系统日志、内存Dump数据、操作系统信息、   
          进程信息、网络连接信息、防火墙信息、服务列   
          表、计划任务、DNS缓存、用户信息、系统时间、  
          文件共享信息等。	                           

                         【注意】     
                 必须以管理员身份运行此脚本！	 

取证后的目录结构：
├─01-内存数据
│      USER-PC-20190810-153739.raw
│      
├─02-操作系统日志
│      Application.evtx
│      HardwareEvents.evtx
│      Internet Explorer.evtx
│      Key Management Service.evtx
│      Media Center.evtx
│      Microsoft-Windows-Application-Experience%4Problem-Steps-Recorder.evtx
│      Microsoft-Windows-Application-Experience%4Program-Compatibility-Assistant.evtx
│      Microsoft-Windows-Application-Experience%4Program-Compatibility-Troubleshooter.evtx
│      Microsoft-Windows-Application-Experience%4Program-Inventory.evtx
│      Microsoft-Windows-Application-Experience%4Program-Telemetry.evtx
│      Microsoft-Windows-Bits-Client%4Operational.evtx
│      Microsoft-Windows-BranchCacheSMB%4Operational.evtx
│      Microsoft-Windows-Dhcp-Client%4Admin.evtx
│      Microsoft-Windows-Dhcpv6-Client%4Admin.evtx
│      Microsoft-Windows-Diagnosis-DPS%4Operational.evtx
│      Microsoft-Windows-Diagnosis-Scheduled%4Operational.evtx
│      Microsoft-Windows-Diagnostics-Performance%4Operational.evtx
│      Microsoft-Windows-DiskDiagnosticDataCollector%4Operational.evtx
│      Microsoft-Windows-GroupPolicy%4Operational.evtx
│      Microsoft-Windows-Kernel-Power%4Thermal-Operational.evtx
│      Microsoft-Windows-Kernel-StoreMgr%4Operational.evtx
│      Microsoft-Windows-Kernel-WHEA%4Errors.evtx
│      Microsoft-Windows-Kernel-WHEA%4Operational.evtx
│      Microsoft-Windows-Known Folders API Service.evtx
│      Microsoft-Windows-MUI%4Admin.evtx
│      Microsoft-Windows-MUI%4Operational.evtx
│      Microsoft-Windows-NCSI%4Operational.evtx
│      Microsoft-Windows-NetworkAccessProtection%4Operational.evtx
│      Microsoft-Windows-NetworkAccessProtection%4WHC.evtx
│      Microsoft-Windows-NetworkProfile%4Operational.evtx
│      Microsoft-Windows-OfflineFiles%4Operational.evtx
│      Microsoft-Windows-PrintService%4Admin.evtx
│      Microsoft-Windows-ReadyBoost%4Operational.evtx
│      Microsoft-Windows-ReliabilityAnalysisComponent%4Operational.evtx
│      Microsoft-Windows-Resource-Exhaustion-Detector%4Operational.evtx
│      Microsoft-Windows-RestartManager%4Operational.evtx
│      Microsoft-Windows-TerminalServices-LocalSessionManager%4Admin.evtx
│      Microsoft-Windows-TerminalServices-LocalSessionManager%4Operational.evtx
│      Microsoft-Windows-UAC%4Operational.evtx
│      Microsoft-Windows-User Profile Service%4Operational.evtx
│      Microsoft-Windows-Windows Defender%4Operational.evtx
│      Microsoft-Windows-Windows Defender%4WHC.evtx
│      Microsoft-Windows-Windows Firewall With Advanced Security%4ConnectionSecurity.evtx
│      Microsoft-Windows-Windows Firewall With Advanced Security%4Firewall.evtx
│      Microsoft-Windows-WindowsBackup%4ActionCenter.evtx
│      Microsoft-Windows-WindowsSystemAssessmentTool%4Operational.evtx
│      Microsoft-Windows-WindowsUpdateClient%4Operational.evtx
│      Microsoft-Windows-Winlogon%4Operational.evtx
│      Security.evtx
│      Setup.evtx
│      System.evtx
│      ThinPrint Diagnostics.evtx
│      Windows PowerShell.evtx
│      
├─03-进程
│      01-当前进程详细列表.txt
│      02-当前每个进程对应的服务.txt
│      03-Microsoft应用及其关联的进程.txt
│      04-当前进程调用的模块.txt
│      05-进程详细信息.html
│      
├─04-网络
│      01-当前网络连接信息.txt
│      02-当前网络接口信息.txt
│      03-DNS缓存.txt
│      
├─05-防火墙
│      01-Windows防火墙配置文件属性.txt
│      02-Windows防火墙全局属性.txt
│      03-Windows防火墙全部规则.txt
│      04-Windows防火墙入站规则.txt
│      05-Windows防火墙出站规则.txt
│      
└─06-系统
        01-操作系统信息.txt
        02-用户组信息.txt
        03-文件共享信息.txt
        04-系统启动项信息.txt
        05-计划任务信息.txt
        06-系统服务列表.txt
        
