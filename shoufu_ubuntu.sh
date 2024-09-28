#!/bin/bash

# 一键下载并运行 Aleo 挖矿脚本
echo "正在下载 Aleo 挖矿脚本..."
wget -qO- https://gh-proxy.com/https://raw.githubusercontent.com/ShoufuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh | bash

# 提示用户脚本已启动
echo "Aleo 挖矿脚本已成功启动！"
