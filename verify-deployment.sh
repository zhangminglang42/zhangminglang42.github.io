#!/bin/bash

echo "=== 网站部署验证 ==="
echo "部署时间: $(date)"
echo ""

# 网站URL
SITE_URL="https://zhangminglang42.github.io"
PUBLICATIONS_URL="https://zhangminglang42.github.io/publications/"

echo "1. 检查网站可访问性:"
if curl -s -o /dev/null -w "%{http_code}" "$SITE_URL" | grep -q "200"; then
    echo "  ✅ 主站可访问: $SITE_URL"
else
    echo "  ❌ 主站无法访问"
fi

echo ""
echo "2. 检查出版物页面:"
if curl -s -o /dev/null -w "%{http_code}" "$PUBLICATIONS_URL" | grep -q "200"; then
    echo "  ✅ 出版物页面可访问: $PUBLICATIONS_URL"
    
    # 检查页面内容
    echo ""
    echo "3. 检查页面内容:"
    
    # 检查是否包含两栏布局的CSS类
    if curl -s "$PUBLICATIONS_URL" | grep -q "publications-container"; then
        echo "  ✅ 两栏布局CSS已加载"
    else
        echo "  ⚠ 未检测到两栏布局CSS"
    fi
    
    # 检查是否包含个人照片
    if curl -s "$PUBLICATIONS_URL" | grep -q "bio-photo.jpg"; then
        echo "  ✅ 个人照片引用存在"
    else
        echo "  ⚠ 个人照片引用未找到"
    fi
    
    # 检查是否包含出版物列表
    if curl -s "$PUBLICATIONS_URL" | grep -q "publication-item"; then
        echo "  ✅ 出版物列表存在"
    else
        echo "  ⚠ 出版物列表未找到"
    fi
    
else
    echo "  ❌ 出版物页面无法访问"
fi

echo ""
echo "4. 检查GitHub Pages构建状态:"
echo "   请访问: https://github.com/zhangminglang42/zhangminglang42.github.io/actions"
echo "   查看最新的构建是否成功"
echo ""

echo "5. 手动测试建议:"
echo "   a. 访问 $SITE_URL"
echo "   b. 点击'📄 论文发表'按钮"
echo "   c. 确认左侧显示个人照片"
echo "   d. 确认右侧显示出版物列表"
echo "   e. 调整浏览器窗口大小，测试响应式设计"
echo "   f. 点击PDF/Code链接测试功能"
echo ""

echo "6. 已知问题检查:"
echo "   - 如果照片不显示: 确认 bio-photo.jpg 已上传到 assets/images/"
echo "   - 如果样式异常: 清除浏览器缓存 (Ctrl+F5)"
echo "   - 如果页面404: 等待1-2分钟让GitHub Pages完成构建"
echo ""

echo "=== 验证完成 ==="
echo ""
echo "网站地址汇总:"
echo "  - 主站: $SITE_URL"
echo "  - 出版物页面: $PUBLICATIONS_URL"
echo "  - GitHub仓库: https://github.com/zhangminglang42/zhangminglang42.github.io"
echo ""
echo "如需进一步优化，请参考 DEPLOYMENT.md 文件"