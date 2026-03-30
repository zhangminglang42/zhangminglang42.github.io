#!/bin/bash

echo "=== 网站配置测试 ==="
echo ""

# 检查关键文件
echo "1. 检查关键文件是否存在:"
files=("_config.yml" "index.md" "_pages/publications.md" "assets/css/custom-publications.scss")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file"
    else
        echo "  ✗ $file (缺失)"
    fi
done

echo ""
echo "2. 检查_config.yml配置:"
if grep -q 'baseurl: ""' _config.yml; then
    echo "  ✓ baseurl 配置正确 (空字符串)"
else
    echo "  ✗ baseurl 配置错误"
    grep 'baseurl:' _config.yml
fi

if grep -q 'custom-publications.scss' _config.yml; then
    echo "  ✓ 自定义CSS已包含"
else
    echo "  ✗ 自定义CSS未包含"
fi

echo ""
echo "3. 检查图片文件:"
if [ -f "assets/images/bio-photo.jpg" ]; then
    echo "  ✓ 个人照片存在"
    file_size=$(stat -c%s "assets/images/bio-photo.jpg" 2>/dev/null || stat -f%z "assets/images/bio-photo.jpg" 2>/dev/null)
    if [ "$file_size" -gt 0 ]; then
        echo "  ✓ 照片文件大小: $file_size 字节"
    else
        echo "  ⚠ 照片文件可能为空"
    fi
else
    echo "  ⚠ 个人照片不存在 (需要上传)"
    echo "    请将照片保存为: assets/images/bio-photo.jpg"
fi

echo ""
echo "4. 检查GitHub Pages设置:"
echo "   请访问: https://github.com/zhangminglang42/zhangminglang42.github.io/settings/pages"
echo "   确保:"
echo "   - Source: 设置为 'main' 分支"
echo "   - Folder: 设置为 '/ (root)'"
echo ""

echo "5. 网站地址:"
echo "   - 主站: https://zhangminglang42.github.io"
echo "   - 出版物页面: https://zhangminglang42.github.io/publications/"
echo ""

echo "=== 测试完成 ==="
echo ""
echo "下一步:"
echo "1. 上传个人照片到 assets/images/bio-photo.jpg"
echo "2. 运行: git add . && git commit -m '更新网站' && git push"
echo "3. 等待1-2分钟让GitHub Pages构建"
echo "4. 访问 https://zhangminglang42.github.io 查看效果"