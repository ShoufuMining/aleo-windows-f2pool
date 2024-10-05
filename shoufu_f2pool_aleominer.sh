#!/bin/bash

# 定义颜色
purple="\033[35m"
green="\033[32m"  # 添加绿色
reset="\033[0m"   # 用于重置颜色
red="\033[31m"    # 红色用于错误提示

# 定义 show_banner 函数
show_banner() {
    echo -e "${purple}===================首富虎哥一键挖矿脚本====================="
    echo "首富出品---必属精品！本脚本供VIP学习使用，请勿用于商业用途"
    echo "首富 Youtube 频道:  https://www.youtube.com/@shoufu"
    echo "首富 TG 财富群:  https://t.me/shoufuhuge  加入一起暴富"
    echo "首富  X  推特:  https://x.com/huge2090"
    echo -e "============================================================${reset}"
}

# 启动挖矿程序
start_miner() {
    read -p "请输入ALEO鱼池挖矿软件下载链接,推荐官方链接.请勿重复开启 (按 Ctrl + C 退出)..." DOWNLOAD_URL 

    # 检查是否已存在下载的文件
    if [ -f "shoufu_aleominer.zip" ]; then
        echo "找到已存在的文件，正在解压缩..."
    else
        echo "正在下载文件..."
        if ! wget -P ~ "$DOWNLOAD_URL" -O shoufu_aleominer.zip; then
            echo "文件下载失败，请重新输入正确地址。"
            exit 1
        fi
    fi

    # 检查文件是否是有效的 zip 文件
    while ! unzip -t shoufu_aleominer.zip > /dev/null 2>&1; do
        echo "下载的文件不是有效的 ZIP 文件，正在删除无效文件..."
        rm -f shoufu_aleominer.zip
        echo "重新下载文件..."
        if ! wget -P ~ "$DOWNLOAD_URL" -O shoufu_aleominer.zip; then
            echo "文件下载失败，请检查链接。"
            exit 1
        fi
    done

    # 直接解压缩到新创建的目录
    mkdir -p ~/shoufu_aleominer
    if ! unzip -o shoufu_aleominer.zip -d ~/shoufu_aleominer; then
        echo "解压缩失败，请检查文件。"
        exit 1
    fi

    # 进入解压目录
    cd ~/shoufu_aleominer || { echo "解压缩失败，目录不存在。"; exit 1; }

    # 删除原来的日志文件
    if [ -f "miner.log" ]; then
        rm -f miner.log
        echo "已删除旧的日志文件 miner.log"
    fi

    # 将挖矿程序重命名
    mv aleominer shoufu_aleominer

    # 给挖矿程序和脚本设置执行权限
    chmod +x shoufu_aleominer
    chmod +x ~/shoufu_f2pool_aleominer.sh

    # 提示用户输入矿池地址和工作名称
    read -p "请输入矿池地址 (默认: stratum+ssl://aleo-asia.f2pool.com:4420): " POOL_URL
    POOL_URL=${POOL_URL:-stratum+ssl://aleo-asia.f2pool.com:4420}

    read -p "请输入工作名称 (默认: fujia.5090): " WORKER_NAME
    WORKER_NAME=${WORKER_NAME:-fujia.5090}

    echo "请确认您输入的矿池地址是: $POOL_URL"
    echo "请确认您输入的账号名称是: $WORKER_NAME"

    # 启动挖矿程序，并将输出写入 miner.log
    nohup ./shoufu_aleominer -u "$POOL_URL" -w "$WORKER_NAME" > miner.log 2>&1 &

    # 确保在成功启动后提示用户
    sleep 3  # 等待 3 秒，确认程序启动
    if pgrep -f "shoufu_aleominer" > /dev/null; then
        echo -e "${green}挖矿程序启动成功......${reset}"
    else
        echo -e "${red}挖矿程序启动失败，请检查日志。${reset}"
        exit 1
    fi

    echo "按任意键退回主菜单..."
    read -n 1
}

# 停止挖矿程序
stop_miner() {
    if pgrep -f "shoufu_aleominer" > /dev/null; then
        pkill -f "shoufu_aleominer"
         echo -e "${red}挖矿程序已停止......${reset}"
    else
         echo -e "${red}未检测到正在运行的挖矿程序...${reset}"
    fi
    echo "按任意键退回主菜单..."
    read -n 1
}

# 检查挖矿程序状态
check_mining_status() {
    if pgrep -f "shoufu_aleominer" > /dev/null; then
         echo -e "${green}挖矿程序正在运行......${reset}"
    else
        echo -e "${red}未检测到正在运行的挖矿程序...${reset}"
    fi
    echo "按任意键退回主菜单..."
    read -n 1
}

# 查看挖矿日志
view_miner_log() {
    # 修改 miner.log 的路径为 shoufu_aleominer 目录中的 miner.log 文件
    LOG_FILE="$HOME/shoufu_aleominer/miner.log"

    if [ -f "$LOG_FILE" ]; then
        echo "正在查看挖矿日志...(按 Ctrl + C 退出)..."

        # 启动 tail -f 命令，并记录其 PID
        tail -f "$LOG_FILE" &
        LOG_PID=$!

        # 设置 trap 捕捉 Ctrl + C 信号，并在退出时杀掉 tail 进程
        trap "kill $LOG_PID 2>/dev/null; return" SIGINT

        # 等待 tail -f 进程结束
        wait $LOG_PID
        trap - SIGINT
    else
        echo -e "${red}未找到挖矿日志文件：$LOG_FILE${reset}"
    fi
}

# 显示主菜单
show_menu() {
    while true; do
        show_banner
    echo -e "${green}---------------------------------"
    echo "  首富ALEO挖矿管理菜单"
    echo -e "---------------------------------${reset}"
        echo "1. 启动挖矿程序"
        echo "2. 停止挖矿程序"
        echo "3. 检查挖矿程序状态"
        echo "4. 查看挖矿日志"
        echo "5. 退出"
        read -p "请选择操作 (1-5): " choice

        case $choice in
            1)
                start_miner
                ;;
            2)
                stop_miner
                ;;
            3)
                check_mining_status
                ;;
            4)
                view_miner_log
                ;;
            5)
                echo "退出首富一键挖矿管理脚本。"
                exit 0
                ;;
            *)
                echo "无效的选择，请输入 1-5 之间的数字。"
                ;;
        esac
    done
}

# 入口函数，显示菜单
show_menu
