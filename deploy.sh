#!/bin/bash

echo "=== 网站部署脚本 ==="
echo ""

# 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    echo "发现未提交的更改:"
    git status --short
    
    echo ""
    read -p "是否要提交这些更改？(y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        git commit -m "优化网站部署 $(date '+%Y-%m-%d %H:%M:%S')"
        echo "✅ 更改已提交"
    else
        echo "❌ 取消部署"
        exit 1
    fi
else
    echo "✅ 没有未提交的更改"
fi

echo ""
echo "=== 部署步骤 ==="
echo ""
echo "1. 请确保你已经设置了GitHub token"
echo "2. 运行以下命令推送更改:"
echo ""
echo "   git push origin main"
echo ""
echo "或者使用token推送:"
echo ""
echo "   git push https://<YOUR_TOKEN>@github.com/zhangminglang42/zhangminglang42.github.io.git main"
echo ""
echo "3. 等待1-2分钟让GitHub Pages构建"
echo ""
echo "4. 访问以下地址查看效果:"
echo "   - 主站: https://zhangminglang42.github.io"
echo "   - 出版物页面: https://zhangminglang42.github.io/publications/"
echo ""
echo "=== 部署完成 ==="