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
echo "1) 安装 ALEO 一键挖矿脚本"
echo "2) 待更新..."
echo "q) 退出"
read -p "请输入选项编号 (1, 2, q): " option

# 根据用户的选择执行不同的操作
case $option in
  1)
    echo "您选择了安装 ALEO 一键挖矿脚本。"
    DOWNLOAD_URL="$ALEO_DOWNLOAD_URL"
    echo "正在下载并执行 ALEO 挖矿脚本..."
    wget -qO- "$DOWNLOAD_URL" | bash
    ;;
  2)
    echo "该选项尚未更新，敬请期待！"
    ;;
  q)
    echo "已退出脚本。"
    exit 0
    ;;
  *)
    echo "无效的选项，请重新运行脚本并选择正确的选项。"
    ;;
esac
