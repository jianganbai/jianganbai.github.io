# Agent 维护指引

## 项目定位

本仓库是 Anbai Jiang（姜安柏）的个人学术网站，线上地址为 https://jianganbai.github.io，通过 GitHub Pages 发布。技术栈为 Academic Pages / Jekyll、Liquid、Markdown、HTML 和 SCSS；npm 用于 JavaScript 打包。

- 先阅读 [README.md](README.md) 和本次任务涉及的源文件，再修改。
- 按用户要求完成内容或设计调整；保留未涉及的个人定制，避免恢复上游模板示例或引入无关重构。
- 页面正文目前使用英文。新增内容沿用现有语言和表达风格，除非用户要求改变。
- 个人经历、毕业时间、论文状态、作者顺序、奖项及联系方式必须有用户提供的信息或可靠来源；不要根据文件名或当前日期推测、更新事实。
- 下文描述的章节顺序、样式数值和展示方式是当前实现，可以随明确的任务要求调整，不是永久不变的限制。

## 修改入口

| 任务 | 主要文件 |
| --- | --- |
| 首页内容、章节顺序 | `_pages/about.md` |
| 论文元数据、作者、摘要及链接 | `_publications/*.md` |
| 完整论文页的分组与排序 | `_pages/publications.md` |
| 首页精选论文卡片 | `_includes/publication-card.html` |
| 完整论文页的紧凑条目 | `_includes/publication-list-item.html` |
| 网站身份、作者信息、头像、主题选择 | `_config.yml` |
| 导航、CV 按钮 | `_data/navigation.yml`、`_includes/masthead.html` |
| 侧栏信息和联系链接的结构 | `_includes/author-profile.html` |
| CV PDF | `files/cv.pdf` |
| 头像与论文图 | `images/`、`images/publications/` |
| 首页、论文卡片、论文列表的样式 | `_sass/layout/_research-home.scss` |
| 宽度、断点、全局变量 | `_sass/_themes.scss` |
| 正文、侧栏、导航、页脚布局 | `_sass/layout/_page.scss`、`_sidebar.scss`、`_masthead.scss`、`_navigation.scss`、`_footer.scss` |
| SCSS 导入入口、明暗主题变量 | `assets/css/main.scss`、`_sass/theme/` |
| 页面外壳与公共内容 | `_layouts/default.html`、`_layouts/single.html`、`_includes/` |
| 交互与主题切换 | `assets/js/_main.js`、`assets/js/theme.js` |

## 内容维护

### 首页、导航与 CV

- 首页由 Markdown 文件中的 HTML section 和 Liquid 组成，目前依次为 Profile、Education、Selected Publications、Challenges、Services、Internships、Awards。
- 移动章节时移动完整的 `<section>...</section>`，保留有效的 HTML、唯一的 `id` 及匹配的 `aria-labelledby`。
- 首页地址为 `/`，保留 `/about/` 和 `/about.html` 的重定向；完整论文页为 `/publications/`。除非任务要求迁移地址，否则保留这些公开路径和已有论文 permalink。
- 导航目前包含 Home、Publications 和 CV。顶部 CV 按钮直接指向 `/files/cv.pdf`；侧栏 CV 链接仅在构建时能找到该文件时出现。
- 更新 CV 时替换 `files/cv.pdf`，确认 PDF 可打开、下载链接可访问。`scripts/update_cv_json.sh` 和 `cv_markdown_to_json.py` 是模板遗留工具，所需的 `_pages/cv.md` 当前不存在，不属于 PDF CV 更新流程。
- 修改 `_config.yml` 后重启本地 Jekyll 服务。保存文本时使用 UTF-8，保留 YAML 缩进及文件头部的 front matter。

### 论文

每篇论文以 `_publications/` 中的一个 Markdown 文件为数据源。新增时复制相近记录，设置唯一的文件名和 permalink，再核对元数据。例如：

```yaml
---
title: "Paper title"
collection: publications
permalink: /publication/unique-paper-slug
date: 2026-01-01
venue: "Venue name"
publication_group: other
selected: false
authors: "First Author, <strong>Anbai Jiang</strong>, Other Author"
---
```

- `publication_group` 必须为 `lead`、`other` 或 `technical_report`；完整论文页分别显示第一作者/导师第一作者论文、其他论文和技术报告。不在这些分组中的记录不会出现在该页。
- Technical Reports 当前用于 DCASE 技术报告，不要把报告当作已通过同行评审的论文。
- 首页仅显示布尔值 `selected: true` 的记录。首页与完整论文页各组都使用 front matter 的 `date` 倒序排列；文件名中的日期不是排序和显示年份的依据。
- 保留准确的作者顺序，沿用 `<strong>Anbai Jiang</strong>` 标记以显示作者高亮。作者和摘要支持内联 HTML，修改后检查标签闭合及 YAML 引号。
- 精选记录补充 `summary`、`image`、`image_alt`、`image_width`，按需添加 `links`（由 `label` 和 `url` 组成的列表）。字段示例见 README。
- `image` 相对于 `images/`，例如 `publications/fisher.png`；不要再添加 `/images/` 前缀。省略图片字段会显示占位框，指定不存在的图片会产生坏图。
- 首页卡片显示图片、摘要和外链；完整论文页的紧凑条目目前只显示 venue、年份、标题和作者，不显示图片或逐篇链接。仅修改某篇论文时改记录，改变共享结构时改对应 include。
- `category` 是模板的分类字段，不能代替本站用于分组的 `publication_group`。

## 样式与脚本

- 优先修改对应 SCSS 源文件，通过 `assets/css/main.scss` 的导入关系生效；保留该入口开头的两行 `---`，它们用于触发 Jekyll 处理。
- 沿用现有主题 CSS 变量，例如 `var(--global-link-color)`，同时考虑明暗主题的对比度。
- 当前 `$large` 为 925px，`$x-large` 为 1440px。`$x-large` 同时控制最大宽度和宽屏断点；侧栏/正文在中等桌面使用 3/9 列，在宽屏使用 2/10 列，宽屏侧栏为 fixed。调整时联动检查 `_page.scss` 和 `_sidebar.scss`。
- `_main.js` 也包含与布局相关的常量，如 `scssLarge`；修改对应 SCSS 参数时检查 JS 是否需要同步。
- 修改 JS 源文件后运行以下命令，并将生成的 `assets/js/main.min.js` 与源文件一起纳入改动。不要只编辑压缩文件。

```sh
npm install
npm run build:js
```

- 普通内容和 SCSS 修改不需要运行 npm 打包。不要编辑 `_site/` 的生成结果或随任务提交依赖目录、缓存文件。

## 构建与验证

命令均从仓库根目录运行。Ruby 3.2 与现有工作流和 Docker 镜像一致；需安装 Bundler 和 Gemfile 依赖。

```sh
bundle install
bundle exec jekyll serve
```

预览地址为 `http://localhost:4000/`。生产构建在 PowerShell 中执行：

```powershell
$env:JEKYLL_ENV = "production"
bundle exec jekyll build --strict_front_matter
```

后续开发预览使用新终端，或先将 `$env:JEKYLL_ENV` 改回 `"development"`。也可使用 `docker compose up --build`，服务使用 `_config.yml,_config_docker.yml` 并映射端口 4000。

按改动范围选择验证：

- 文档修改：核对路径、链接和命令与实现一致，运行 `git diff --check`。
- 内容、Liquid、配置或 SCSS 修改：具备环境时运行严格 front matter 构建；检查对应页面、图片、链接及 CV。
- 布局或交互修改：检查 Home 和 Publications 的手机、普通桌面、宽屏显示与明暗主题，重点确认导航选中态、移动端菜单、侧栏、论文图片和页脚是否正常。
- JS 修改：运行打包并在浏览器验证受影响的交互。

仓库已跟踪两个源级布局检查，修改相关布局时运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File test/footer-layout.test.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File test/sidebar-layout.test.ps1
```

以下检查仅在部分本地工作区存在；先确认文件存在再运行：

```powershell
python scripts/validate_personal_site.py
powershell -NoProfile -ExecutionPolicy Bypass -File test/publication-index.test.ps1
```

- `.gitignore` 忽略 `test/` 和 `valid*.py`，但已跟踪的两个布局检查仍在版本控制中。上述 Python 校验脚本和论文索引检查未被跟踪，新克隆不包含它们；不要把它们作为必备验证步骤。
- 部分检查硬编码论文数量、精选论文集合、文案和样式数值。遇到失败时先判断是回归还是任务有意改变了约定；不要为了通过过时断言撤销用户要求，也不要未经分析就删除断言。
- 源级检查不能替代 Jekyll 构建和浏览器验证。若缺少 Ruby/Bundler、Docker 或浏览器能力，交付时明确说明未执行的检查，不要宣称构建或视觉验证通过。

## 发布与交付

- `.github/workflows/jekyll-build.yml` 在 `Cleanup bad PR` 工作流完成后触发，并使用 `main` 分支过滤；它只做生产构建，没有 Pages 发布步骤，也不是每次 push 都运行的构建工作流。
- 实际发布来源以 GitHub 仓库 Settings → Pages 为准。检查工作流时核对当前分支和触发条件，不要根据本地分支或工作流名称推断发布设置。
- `.github/CONTRIBUTING.md`、PR 模板及部分生成工具仍包含上游 Academic Pages 的说明；涉及贡献目标、分支或发布行为时，以本站配置和用户要求为准。
- 完成前检查差异和工作区状态，保留用户已有改动；涉及维护流程变化时同步更新 README 和本文件。
- 向用户简洁说明改了什么、验证了什么，以及剩余限制。修改文件本身不等于已提交、已推送或已发布；按用户授权执行相应操作并如实报告状态。
