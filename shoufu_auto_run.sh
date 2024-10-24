#!/bin/bash

purple="\033[35m"
green="\033[32m"  # 设置绿色
reset="\033[0m"   # 用于重置颜色

# 显示引导文本
echo -e "${purple}---------------------------------"
echo -e "|  ----首----     ----富----   |"
echo -e "| |         |   |          |  |"
echo -e "| |  ----   |   |---- ---- |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "| |     |   |   |     |    |  |"
echo -e "|  ----首----     ----富----   |"
echo -e "${purple}---------------------------------${reset}"

echo -e "${purple}======================首富虎哥一键挖矿脚本===================" 
echo "首富频道出品，仅供会员学习使用，请勿用于商业用途"
echo "首富Youtube频道: https://www.youtube.com/@shoufu"
echo "加入首富电报财富群: https://t.me/shoufuhuge 一起暴富"
echo "首富x推特: https://x.com/huge2090"
echo "========================================================================"

# 提示用户按任意键继续
echo -e "${green}按任意键继续...${reset}"
read -n 1

# 清屏
clear 

# 显示主菜单
while true; do
    echo "========================================================================" 
    echo "1) 安装 ALEO 一键挖矿脚本" 
    echo "2) 安装Frp反向代理软件" 
    echo "q) 退出" 
    echo "========================================================================" 
    read -p "请输入选项: " OPTION 

    case $OPTION in 
        1)  
            cd ~
            rm -rf shoufu_f2pool_aleominer.sh
            curl -L -O https://raw.githubusercontent.com/ShouFuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh
            chmod u+x shoufu_f2pool_aleominer.sh
            ./shoufu_f2pool_aleominer.sh
            ;; 
        2) 
            echo -e "${purple}待更新...${reset}" 
            ;; 
        q) 
            echo "退出程序。" 
            exit 0 
            ;; 
        *) 
            echo "无效选项，请重新输入。" 
            sleep 1 
            ;; 
    esac 

    # 提示用户按任意键返回主界面
    echo -e "${green}按任意键返回主界面...${reset}"
    read -n 1  # 等待用户按下任意键
done 
