# 天津理工大学本科毕业设计说明书 LaTeX 模版

依据《天津理工大学本科毕业设计说明书（毕业论文）撰写规范(2025)》制作的
**XeLaTeX** 模版。把规范里的字体、字号、行距、缩进、页眉页码、各级编号
全部封装好，写作时只需填内容，格式自动符合规范。

> 适用范围：标题/摘要/关键词 → 目录 → 正文 → 参考文献 → 附录 → 致谢。
> **不含**封皮、首页、原创性声明、选题审批表、任务书、开题报告、底图
> （这些用教务处统一模板单独制作，打印后按装订顺序合并）。

## 文件结构

内容按部分拆分到 `chapters/` 下，`main.tex` 只做装配（仿 TongjiThesis 形式）：

```
main.tex                      薄主文件，只负责 \input 装配各部分
tjutthesis.cls                文档类，封装全部格式要求（一般不需改动）
chapters/
  metadata.tex                届别等元数据（\gradyear）
  00_abstract.tex             中英文标题、摘要、关键词
  01_introduction.tex         第一章 绪论
  02_experiment.tex           第二章（图/表/公式示例）
  03_conclusion.tex           第三章 结论
  references.tex              参考文献（thebibliography 手工著录）
  appendix.tex                附录
  acknowledgement.tex         致谢
figures/                      插图目录（\includegraphics 直接写文件名）
fonts/README.md               字体获取说明（版权字体须自行放入，不随仓库分发）
latexmkrc / Makefile          本地一键编译（已指定 XeLaTeX）
README.md / LICENSE           本说明 / LPPL-1.3c 许可（仅覆盖源文件，不含字体）
.gitignore                    排除版权字体与编译产物
```

> 新增/调整章节：在 `chapters/` 下新建一个 `.tex`（如 `04_design.tex`），
> 再在 `main.tex` 正文区加一行 `\input{chapters/04_design}` 即可；删除、
> 重排章节同理——改 `main.tex` 里的 `\input` 顺序就行。

> 仓库内**不含**编译产物（`main.pdf` 等）与版权字体——两者已由 `.gitignore`
> 排除；克隆后需自行放入字体并本地编译生成 PDF。

## 快速开始

### Overleaf（推荐，免安装）
1. 按 [`fonts/README.md`](fonts/README.md) 把 4 个中文字体文件放进 `fonts/`；
2. 把整个项目（含 `fonts/`）打包上传：**New Project → Upload Project**；
3. 打开后点 **Menu → Compiler**，选 **XeLaTeX**（必须，否则中文无法编译）；
4. **Recompile** 得到 PDF。

### 本地编译
需要 TeX Live / MacTeX（含 `ctex`、`xeCJK`）：
```bash
git clone https://github.com/seatres/tjut-thesis-latex-template.git
cd tjut-thesis-latex-template
# 按 fonts/README.md 把 4 个中易字体放进 fonts/
latexmk main.tex        # latexmkrc 已指定 XeLaTeX；或手动：xelatex main.tex
make                    # 等价；make cleanall 清理全部产物
```

> ⚠️ 本模版**必须用 XeLaTeX 编译**。若误用 pdfLaTeX，会立即报错提示切换，
> 不会无声卡死。

## 字体（重要）

规范要求的中文字体是 Windows/Word 的**中易字体**（宋体/黑体/楷体/仿宋），
属版权字体，**未包含在本仓库中**。请按 [`fonts/README.md`](fonts/README.md)
从你拥有授权的设备自行获取后放入 `fonts/`。模版会按
「`fonts/` 目录字体 → 系统字体 → Fandol 应急回退」的顺序自动选择。

## 使用要点

- **届别**：在 `chapters/metadata.tex` 改 `\gradyear{2026}` 为实际届别，
  自动生成页眉“天津理工大学2026届本科毕业设计说明书（毕业论文）”。
- **摘要**：写在 `chapters/00_abstract.tex`，
  `\begin{cnabstract}[副标题]{中文标题} … \end{cnabstract}`，
  单人课题去掉 `[副标题]`；英文摘要用 `enabstract`，二者之间**不要**
  `\clearpage`（规范要求中英文摘要不另起新页）。
- **章节**：直接用 `\chapter{}`、`\section{}`、`\subsection{}`，编号
  （第一章 / 1.1 / 1.1.1）与字体自动符合规范；**不要用 `\subsubsection`**
  （规范标题最多三级）。
- **图**：先在正文写“如图 x.x”，再用 `figure` 环境 + `\includegraphics`；
  图题自动排在图下方（五号楷体），按章编号。
- **表**：`\caption` 写在 `tabular` **之前**（表题在表上方）；表内字号已自动五号。
- **公式**：用 `equation` 环境，编号 (x.x) 自动按章靠右。
- **参考文献**：在 `chapters/references.tex` 的 `thebibliography` 中按
  GB/T 7714-2015 手工著录（已给期刊/学位论文/图书/网页/外文五类示例），
  须“前引后列”——每条都在正文 `\cite` 过且按引用先后排序。
- **附录**：在 `chapters/appendix.tex` 的 `appendices` 环境内，
  `\chapter{附录名}` 自动编为“附录1 附录名”；无附录可删去 `main.tex` 中对应的 `\input` 行。
- **致谢**：写在 `chapters/acknowledgement.tex` 的 `acknowledgements` 环境内。

## 已落实的规范要点

- A4、页边距上下左右 2.5cm；正文小四宋体、1.25 倍行距、段首缩进两个汉字；
- 西文与数字 Times New Roman；
- 页眉宋体五号居中加线（正文起至致谢止），页码宋体小五居中、阿拉伯数字连续；
- 章标题三号黑体居中“第一章 ×××”每章另起一页，节小三黑体居中、
  小节四号黑体左起，标题 1.5 倍行距；
- 目录“目　录”三号黑体居中，章名黑体四号、节/小节小四宋体、点线连接、页码右对齐；
- 中文标题黑体二号；“摘　要”黑体三号居中、正文楷体四号固定 20 磅；
  英文 ABSTRACT 三号加黑、正文四号固定 20 磅；
- 图题/表题五号楷体（图下/表上）按章编号；公式按章编号靠右；
- 参考文献另起一页、小四宋体悬挂缩进、`[1]` 连续编号；
- 附录三号黑体标题、正文 5 号固定 18 磅；致谢“致　谢”三号黑体、正文小四宋体。

## 版权与许可

模版源文件 © 2026 **seatres**（https://github.com/seatres），依据
[**LaTeX Project Public License 1.3c**](LICENSE)（或更新版本）发布——
LaTeX 宏包/文档类的生态标准许可：

- 可自由使用、修改、再分发（**包括商业用途**）；
- 维护状态 `maintained`，**当前维护者：seatres**（https://github.com/seatres）；
- 再分发**修改后**的版本时，须按 LPPL 要求更改文件名/作品标识、标注修改者为
  新的“当前维护者”，并**保留原作者 seatres 的署名与许可信息**，
  使原版不被冒名或混淆。

> **字体不在许可范围内**：中易字体等为第三方版权字体，未随本模版分发，
> 须使用者自行从授权设备获取，详见 [`fonts/README.md`](fonts/README.md)。
