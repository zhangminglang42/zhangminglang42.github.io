# 部署说明

## 网站地址
- **新地址**: https://zhangminglang42.github.io
- **旧地址**: https://zhangminglang42.github.io/Guowen.github.io (已废弃)

## 主要更新

### 1. 配置文件更新
- `_config.yml` 中的 `baseurl` 已从 `/Guowen.github.io` 改为 `""`
- 添加了新的CSS样式文件：`assets/css/custom-publications.scss`

### 2. 出版物页面优化
- 全新的两栏布局：左侧个人照片+信息，右侧出版物列表
- 响应式设计，适配所有设备
- 按年份和类别清晰分组
- 不同链接类型有不同颜色标识

### 3. 导航改进
- 首页按钮添加了emoji图标
- 保持原有的研究方向和项目信息

## 部署步骤

### 方法一：直接推送（推荐）
```bash
# 进入项目目录
cd zhangminglang42.github.io

# 添加所有更改
git add .

# 提交更改
git commit -m "优化网站：更新仓库名，添加两栏布局出版物页面"

# 推送到GitHub
git push origin main
```

### 方法二：本地测试后部署
```bash
# 安装依赖
bundle install

# 本地运行
bundle exec jekyll serve

# 在浏览器访问 http://localhost:4000
# 确认无误后推送
git add .
git commit -m "优化网站"
git push origin main
```

## 需要手动完成的事项

### 1. 上传个人照片
将你的个人照片文件重命名为 `bio-photo.jpg` 并放置到：
```
zhangminglang42.github.io/assets/images/bio-photo.jpg
```

### 2. 更新出版物内容
编辑 `_pages/publications.md` 文件：
- 更新真实的出版物信息
- 添加PDF文件到 `assets/papers/` 目录
- 更新作者姓名和机构信息

### 3. 检查链接
确保所有内部链接正常工作：
- 首页按钮链接
- 出版物PDF链接
- 外部链接（Google Scholar, GitHub等）

## 故障排除

### 问题1：网站无法访问
- 检查GitHub Pages设置：Settings → Pages → Source 应为 `main` 分支
- 等待几分钟让GitHub Pages构建完成

### 问题2：图片不显示
- 确认 `bio-photo.jpg` 文件已上传
- 检查文件路径：`/assets/images/bio-photo.jpg`
- 确认文件权限正确

### 问题3：样式不生效
- 检查浏览器缓存，尝试强制刷新 (Ctrl+F5)
- 确认 `_config.yml` 中包含了新的CSS文件
- 查看GitHub Actions构建日志是否有错误

## 后续优化建议

1. **添加更多页面**：
   - 详细的研究项目页面
   - 教学材料页面
   - 博客/新闻页面

2. **SEO优化**：
   - 添加更多meta描述
   - 优化页面标题
   - 添加结构化数据

3. **性能优化**：
   - 压缩图片
   - 使用CDN加速
   - 优化CSS和JS

## 联系方式
如有问题，请通过以下方式联系：
- Email: ligw8@mail2.sysu.edu.cn
- GitHub: https://github.com/zhangminglang42

---
*最后更新: 2024年3月*