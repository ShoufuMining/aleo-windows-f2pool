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

# 检查用户输入的选项并执行相应操作
case $option in
  1)
    echo "您选择了安装 ALEO 一键挖矿脚本。"
    DOWNLOAD_URL="$ALEO_DOWNLOAD_URL"
    echo "正在下载并执行 ALEO 挖矿脚本..."

    # 在执行下载前打印出当前的链接，确保正确性
    echo "当前下载链接: $DOWNLOAD_URL"

    # 检查是否为空链接
    if [[ -z "$DOWNLOAD_URL" ]]; then
      echo "下载链接为空，请检查下载链接的设置。"
      exit 1
    fi

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
