#!/bin/bash

# 下载并执行脚本
DOWNLOAD_URL="https://gh-proxy.com/https://raw.githubusercontent.com/ShoufuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh"

# 显示欢迎信息
echo -e "\033[35m---------------------------------"
echo -e "|  ----首----     ----富----   |"
echo -e "| |         |   |          |  |"
echo -e "| |  ----   |   |---- ---- |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "|  ----首----     ----富----   |"
echo -e "---------------------------------\033[0m"

echo "正在下载 Aleo Ubuntu防掉线挖矿脚本..."
wget -qO- "$DOWNLOAD_URL" | bash
