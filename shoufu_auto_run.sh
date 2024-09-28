#!/bin/bash

purple="\033[35m"
reset="\033[0m"  # 用于重置颜色

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

# 检查是否以root用户运行
if [[ $EUID -ne 0 ]]; then
   echo "请以root用户运行此脚本!" 
   exit 1
fi

# 显示主菜单
while true; do
    echo "========================================================================" 
    echo "1) 安装 ALEO 一键挖矿脚本" 
    echo "2) 待更新..." 
    echo "q) 退出" 
    read -p "请输入选项: " OPTION 

    case $OPTION in 
        1)  
            cd ~
            rm -rf shoufu_f2pool_aleominer.sh
            wget https://raw.githubusercontent.com/ShoufuMining/aleo-windows-f2pool/main/shoufu_f2pool_aleominer.sh
            chmod u+x shoufu_f2pool_aleominer.sh
            ./shoufu_f2pool_aleominer.sh
            ;; 
        2) 
            echo "待更新..." 
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
done
