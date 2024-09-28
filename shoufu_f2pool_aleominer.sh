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

# 提示用户输入矿池地址和工作名称，并设置默认值
read -p "欢迎使用首富一键挖矿脚本命令，记得点赞订阅首富Youtube频道 https://www.youtube.com/@shoufu 加入首富电报财富群：https://t.me/shoufuhuge 一起暴富！请输入ALEO鱼池挖矿软件下载链接，如果官方链接无法下载，推荐使用转发链接（注意：首富VIP群免费提供转发，请确保输入的是 Ubuntu 版挖矿软件，否则会失败，请重新运行此脚本！）: " DOWNLOAD_URL 

# 检查是否已存在下载的文件
if [ -f "aleominer-unbutu-3.0.8.zip" ]; then
  echo "找到已存在的文件，正在解压缩..."
else
  echo "正在下载文件..."
  if ! wget -P ~ "$DOWNLOAD_URL" -O aleominer-unbutu-3.0.8.zip; then
    echo "文件下载失败，请检查链接。"
    exit 1
  fi
fi

# 检查文件是否是有效的 zip 文件
while ! unzip -t aleominer-unbutu-3.0.8.zip > /dev/null 2>&1; do
  echo "下载的文件不是有效的 ZIP 文件，正在删除无效文件..."
  rm -f aleominer-unbutu-3.0.8.zip
  echo "重新下载文件..."
  if ! wget -P ~ "$DOWNLOAD_URL" -O aleominer-unbutu-3.0.8.zip; then
    echo "文件下载失败，请检查链接。"
    exit 1
  fi
done

# 直接解压缩到新创建的目录
mkdir -p ~/shoufu_aleominer
if ! unzip -o aleominer-unbutu-3.0.8.zip -d ~/shoufu_aleominer; then
  echo "解压缩失败，请检查文件。"
  exit 1
fi

# 进入解压目录
cd ~/shoufu_aleominer || { echo "解压缩失败，目录不存在。"; exit 1; }

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

# 持续循环运行挖矿程序
while true; do
  echo "启动 Aleo Miner..."
  
  # 启动挖矿程序
  ./shoufu_aleominer -u "$POOL_URL" -w "$WORKER_NAME"

  # 检查挖矿程序的退出状态
  if [ $? -eq 0 ]; then
    echo "挖矿程序正常退出，5秒后重新启动..."
  else
    echo "挖矿程序意外退出，5秒后重新启动..."
  fi

  sleep 5
done
