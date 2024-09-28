#!/bin/bash

# 显示欢迎信息
echo -e "\033[35m---------------------------------"
echo -e "|  ----首----     ----富----   |"
echo -e "| |         |   |          |  |"
echo -e "| |  ----   |   |---- ---- |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "|  ----首----     ----富----   |"
echo -e "---------------------------------\033[0m"

# 定义可选的下载链接
ALEO_DOWNLOAD_URL="https://gh-proxy.com/https://raw.githubusercontent.com/ShoufuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh"

# 创建菜单，让用户选择要执行的项目
echo -e "\033[32m请选择操作选项: \033[0m"
echo "1) 下载并运行 ALEO 一键挖矿脚本"
echo "q) 退出"

read -p "请输入选项编号 (1, q): " option

# 检查用户输入的选项并执行相应操作
case $option in
  1)
    echo "您选择了下载并运行 ALEO 一键挖矿脚本。"
    
    # 下载脚本
    wget -O shoufu_f2pool_aleominer.sh "$ALEO_DOWNLOAD_URL"
    
    # 赋予执行权限
    chmod +x shoufu_f2pool_aleominer.sh
    
    # 运行下载的脚本
    ./shoufu_f2pool_aleominer.sh
    ;;
  q)
    echo "已退出脚本。"
    exit 0
    ;;
  *)
    echo "无效的选项，请重新运行脚本并选择正确的选项。"
    ;;
esac
