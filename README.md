# aleo-windows-f2pool
f2pool ALEO mining, restart the mining script in windows

鱼池ALEO挖矿，windows版掉线重启挖矿脚本,
创建一键挖矿脚本：aleo.bat，复制下面内容：然后保存就可以了！

@echo off
set /p POOL_URL="Enter primary pool URL (e.g., stratum+ssl://aleo-asia.f2pool.com:4420): "
set /p WORKER_NAME="Enter worker name (e.g., fujia.4090): "

:loop
echo Starting Aleo Miner...
"%~dp0aleominer.exe" -u %POOL_URL% -w %WORKER_NAME%

echo Miner exited. Restarting in 5 seconds...
timeout /t 5
goto loop

鱼池ALEO挖矿，Ubuntu系统防掉线挖矿脚本
一键运行脚本：

wget -qO- https://gh-proxy.com/https://raw.githubusercontent.com/ShoufuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh | bash

