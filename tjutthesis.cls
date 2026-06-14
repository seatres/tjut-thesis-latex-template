%% ============================================================
%% tjutthesis.cls
%% 天津理工大学本科毕业设计说明书（毕业论文）LaTeX 模版
%% 依据：《天津理工大学本科毕业设计说明书（毕业论文）撰写规范(2025)》
%%
%% 编译方式：XeLaTeX（Overleaf：Menu -> Compiler -> XeLaTeX）
%%
%% 本模版只覆盖：标题/摘要/关键词、目录、正文、参考文献、附录、致谢。
%% 不含封皮、首页、原创性声明、选题审批表、任务书、开题报告、底图
%% （以上均使用教务处统一模板，单独制作后合并装订）。
%%
%% Copyright (c) 2026 seatres (https://github.com/seatres)
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version. The latest version of this
%% license is in https://www.latex-project.org/lppl.txt and version 1.3c
%% or later is part of all distributions of LaTeX version 2008 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is seatres (https://github.com/seatres).
%% This work consists of tjutthesis.cls, main.tex, the files under
%% chapters/, and the documentation (README.md, fonts/README.md).
%% 许可全文见 LICENSE。
%%
%% 注意：本许可不含、也不授权任何第三方字体（中易 宋/黑/楷/仿宋、Times
%%       New Roman 等）；字体版权归各自所有者，获取方式见 fonts/README.md。
%% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tjutthesis}[2026/06/10 v1.0 TJUT undergraduate thesis template. Copyright (c) 2026 seatres]

%% 必须使用 XeLaTeX 编译；用 pdfLaTeX 编译时立即给出明确报错，
%% 避免在 Overleaf 上无声地慢跑直至超时
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{tjutthesis}{%
    This template requires XeLaTeX!\MessageBreak
    Overleaf: Menu -> Settings -> Compiler -> XeLaTeX\MessageBreak
    Local: latexmk -xelatex main.tex}{%
    Switch the compiler to XeLaTeX and recompile.}
\fi

%% 基于 ctexbook：
%%   zihao=-4  : 默认正文字号为小四（规范一(2)）
%%   oneside   : 单面打印（规范一(1)）
%%   openany   : 每章另起一页即可，不强制奇数页
%%   fontset=none : 中文字体由本文件统一配置（见下方“中文字体”一节），
%%                  优先使用与 Word 完全一致的中易字体（宋体/黑体/楷体）
\LoadClass[zihao=-4, oneside, openany, fontset=none, scheme=chinese]{ctexbook}

\RequirePackage[a4paper, margin=2.5cm, headheight=15pt]{geometry} % 页边距上下左右各 2.5cm
\RequirePackage{fancyhdr}        % 页眉页脚
\RequirePackage{amsmath}         % 公式
\RequirePackage{graphicx}        % 插图
\RequirePackage{caption}         % 图题表题格式
\RequirePackage{booktabs}        % 三线表
\RequirePackage[titles]{tocloft} % 目录格式
\RequirePackage{etoolbox}

%% ------------------------------------------------------------
%% 西文字体
%% ------------------------------------------------------------
%% 英文、数字、符号一律 Times New Roman（规范一(2)）；
%% Overleaf 服务器装有 Times New Roman，本地若没有则退回
%% 同尺寸的 TeX Gyre Termes（Times 的开源等宽度替代）。
\IfFontExistsTF{Times New Roman}
  {\setmainfont{Times New Roman}}
  {\setmainfont{TeX Gyre Termes}}

%% ℃、‰ 等符号 Times New Roman 中没有，归入中文字体排印
\xeCJKDeclareCharClass{CJK}{"2103, "2030}

%% ------------------------------------------------------------
%% 中文字体（与 Word/撰写规范完全一致的中易字体）
%% ------------------------------------------------------------
%% 按以下优先级加载：
%%   ① 项目 fonts/ 目录中的字体文件（推荐：本机与 Overleaf 效果完全一致）
%%      所需文件（从 Windows 电脑 C:\Windows\Fonts 复制，文件名小写）：
%%        fonts/simsun.ttc  宋体    fonts/simhei.ttf  黑体
%%        fonts/simkai.ttf  楷体    fonts/simfang.ttf 仿宋
%%   ② 系统已安装的中易字体（SimSun/SimHei/KaiTi/FangSong）
%%   ③ 都没有时退回 TeX Live 自带的 Fandol 字库（外观接近，仅作应急）
%% 宋体、楷体的加粗采用伪粗体（AutoFakeBold），与 Word 中加粗效果一致。
\IfFileExists{./fonts/simsun.ttc}{%
  % ① 项目目录字体文件
  \setCJKmainfont[Path=./fonts/, AutoFakeBold=3, ItalicFont=simkai.ttf]{simsun.ttc}%
  \setCJKsansfont[Path=./fonts/, AutoFakeBold=3]{simhei.ttf}%
  \setCJKmonofont[Path=./fonts/]{simfang.ttf}%
  \setCJKfamilyfont{zhsong}[Path=./fonts/, AutoFakeBold=3]{simsun.ttc}%
  \setCJKfamilyfont{zhhei}[Path=./fonts/, AutoFakeBold=3]{simhei.ttf}%
  \setCJKfamilyfont{zhkai}[Path=./fonts/, AutoFakeBold=3]{simkai.ttf}%
  \setCJKfamilyfont{zhfs}[Path=./fonts/, AutoFakeBold=3]{simfang.ttf}%
  \ClassInfo{tjutthesis}{Using SimSun/SimHei/KaiTi from ./fonts/ directory}%
}{%
\IfFontExistsTF{SimSun}{%
  % ② 系统安装的中易字体
  \setCJKmainfont[AutoFakeBold=3, ItalicFont=KaiTi]{SimSun}%
  \setCJKsansfont[AutoFakeBold=3]{SimHei}%
  \setCJKmonofont{FangSong}%
  \setCJKfamilyfont{zhsong}[AutoFakeBold=3]{SimSun}%
  \setCJKfamilyfont{zhhei}[AutoFakeBold=3]{SimHei}%
  \setCJKfamilyfont{zhkai}[AutoFakeBold=3]{KaiTi}%
  \setCJKfamilyfont{zhfs}[AutoFakeBold=3]{FangSong}%
  \ClassInfo{tjutthesis}{Using system-installed SimSun/SimHei/KaiTi}%
}{%
  % ③ 应急回退：Fandol 字库（TeX Live 自带）
  \setCJKmainfont[BoldFont=FandolSong-Bold.otf, ItalicFont=FandolKai-Regular.otf]{FandolSong-Regular.otf}%
  \setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}%
  \setCJKmonofont{FandolFang-Regular.otf}%
  \setCJKfamilyfont{zhsong}[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}%
  \setCJKfamilyfont{zhhei}[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}%
  \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}%
  \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}%
  \ClassWarningNoLine{tjutthesis}{%
    SimSun/SimHei/KaiTi NOT found! Falling back to Fandol fonts.\MessageBreak
    To fully comply with the 2025 writing standard, copy\MessageBreak
    simsun.ttc/simhei.ttf/simkai.ttf/simfang.ttf from\MessageBreak
    C:\string\Windows\string\Fonts\space into the ./fonts/ directory}%
}}
\newcommand\songti{\CJKfamily{zhsong}}
\newcommand\heiti{\CJKfamily{zhhei}}
\newcommand\kaishu{\CJKfamily{zhkai}}
\newcommand\fangsong{\CJKfamily{zhfs}}

%% 正文行距 1.25 倍（规范一(2)）
\linespread{1.25}\selectfont

%% 段首缩进两个汉字（ctex 默认章节后首段同样缩进，符合中文习惯）
\AtBeginDocument{\setlength{\parindent}{2\ccwd}}

%% ------------------------------------------------------------
%% 页眉页脚（规范一(3)(4)）
%% ------------------------------------------------------------
%% 届别：在导言区用 \gradyear{2026} 设置
\newcommand\gradyear[1]{\def\tjut@gradyear{#1}}
\gradyear{XXXX}
\def\tjut@header{天津理工大学\tjut@gradyear 届本科毕业设计说明书（毕业论文）}

%% 正文页：页眉宋体五号居中 + 页眉线；页码宋体小五居中
\fancypagestyle{tjutmain}{%
  \fancyhf{}%
  \fancyhead[C]{\zihao{5}\songti\tjut@header}%
  \fancyfoot[C]{\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0.4pt}%
}
%% 前置部分（摘要、目录）：无页眉无页码
\fancypagestyle{tjutempty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
}

%% \frontmatter：摘要、目录部分 —— 无页眉、无页码
\renewcommand\frontmatter{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \pagestyle{tjutempty}%
  \fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}%
}
%% \mainmatter：从正文第一页起 —— 页码从 1 连续编排，页眉直到致谢结束
\renewcommand\mainmatter{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}%
  \pagestyle{tjutmain}%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[C]{\zihao{5}\songti\tjut@header}%
    \fancyfoot[C]{\zihao{-5}\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}}%
}

%% ------------------------------------------------------------
%% 章节标题（规范二9①）
%%   章：  三号黑体居中，“第一章 XXX”（章序号与标题间空一个汉字），每章另起一页
%%   节：  小三号黑体居中，“1.1 XXX”（序号与标题间空一个西文字符）
%%   小节：四号黑体左起，“1.1.1 XXX”
%%   标题行距 1.5 倍；标题层级不超过三级
%% ------------------------------------------------------------
\ctexset{
  chapter = {
    format     = {\linespread{1.5}\selectfont\centering\heiti\zihao{3}},
    name       = {第,章},
    number     = \chinese{chapter},
    aftername  = {\hspace{\ccwd}},
    beforeskip = {20pt},
    afterskip  = {30pt},
    fixskip    = true,
  },
  section = {
    format     = {\linespread{1.5}\selectfont\centering\heiti\zihao{-3}},
    aftername  = {\ },
    beforeskip = {18pt plus 1ex minus .2ex},
    afterskip  = {12pt plus .2ex},
  },
  subsection = {
    format     = {\linespread{1.5}\selectfont\raggedright\heiti\zihao{4}},
    aftername  = {\ },
    beforeskip = {12pt plus 1ex minus .2ex},
    afterskip  = {6pt plus .2ex},
  },
}
\setcounter{secnumdepth}{2} % 编号至三级标题 1.1.1 为止

%% 小节内小标题：黑体小四、缩进两个汉字、单列一行（规范二9⑵、示例3）
%% 序号“1、2、3……”由作者自行书写，如 \minisection{1. 机构动力学等效集中参数模型}
\newcommand{\minisection}[1]{\par\noindent{\heiti\zihao{-4}\hspace*{2\ccwd}#1}\par}

%% 段落标题（如“⑴建模假设”）：宋体加黑小四，用于段首，后接正文
\newcommand{\paratitle}[1]{{\bfseries #1}}

%% ------------------------------------------------------------
%% 目录（规范二8）
%%   “目  录”：三号黑体居中，“目”“录”间空四格
%%   章名黑体四号；节、小节名小四号宋体；页码右对齐，“……”连接
%% ------------------------------------------------------------
\renewcommand{\contentsname}{目\hspace{2\ccwd}录}
\setcounter{tocdepth}{2}
\renewcommand{\cftchapfont}{\heiti\zihao{4}}
\renewcommand{\cftchappagefont}{\zihao{4}}
\renewcommand{\cftchapdotsep}{\cftdotsep}   % 章条目也用“……”连接页码
\setlength{\cftchapnumwidth}{62pt}          % 容纳“第一章 ”
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsecpagefont}{\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}}

%% ------------------------------------------------------------
%% 图、表（规范二9②③）
%%   图题：五号楷体，序号 Times New Roman，置于图下方居中，编号如“图 3.2”
%%   表题：五号楷体，序号 Times New Roman，置于表上方居中，编号如“表 5.4”
%%   表内文字：五号
%% ------------------------------------------------------------
\DeclareCaptionFont{tjutcaption}{\zihao{5}\kaishu}
\captionsetup{font=tjutcaption, labelsep=quad}
\captionsetup[figure]{position=below, skip=6pt}
\captionsetup[table]{position=above, skip=6pt}
\AtBeginEnvironment{table}{\zihao{5}}

%% 公式编号按章编排，如 (4.2)，标注于所在行最右边（book 类默认即如此）

%% ------------------------------------------------------------
%% 中文标题 / 摘要 / 关键词（规范二7）
%% 用法：
%%   \begin{cnabstract}[副标题（两人以上课题才需要）]{中文标题}
%%     摘要正文……
%%   \end{cnabstract}
%%   \cnkeywords{关键词1\quad 关键词2\quad 关键词3}
%% ------------------------------------------------------------
\newenvironment{cnabstract}[2][]{%
  \clearpage
  % 标题：黑体二号（不超过 36 个汉字）
  {\centering\linespread{1.5}\selectfont\heiti\zihao{2}#2\par}%
  % 副标题：楷体三号，空一行打印
  \ifblank{#1}{}{%
    \vspace{\baselineskip}%
    {\centering\kaishu\zihao{3}——#1\par}}%
  % 标题后空一行，黑体三号居中“摘 要”（“摘”“要”间空一个汉字）
  \vspace{\baselineskip}%
  {\centering\heiti\zihao{3}摘\hspace{\ccwd}要\par}%
  \vspace{0.5\baselineskip}%
  % 摘要正文：楷体四号，段首缩进，行距固定值 20 磅，300–800 字
  \linespread{1}\fontsize{14pt}{20pt}\selectfont\kaishu
  \setlength{\parindent}{2\ccwd}%
}{\par}

%% 中文关键词：空一行、缩进两个汉字，黑体三号“关键词：”+ 楷体四号关键词 3–8 个
\newcommand{\cnkeywords}[1]{%
  \par\vspace{20pt}%
  \noindent\hspace*{2\ccwd}{\heiti\zihao{3}关键词：}{\kaishu\zihao{4}#1}\par}

%% ------------------------------------------------------------
%% 英文标题 / 摘要 / 关键词（规范二7）
%% 注意：中英文摘要之间不另起新页，紧跟 \cnkeywords 之后使用即可。
%% 用法：
%%   \begin{enabstract}[英文副标题]{英文标题}
%%     英文摘要……
%%   \end{enabstract}
%%   \enkeywords{Keyword One\quad Keyword Two}
%% ------------------------------------------------------------
\newenvironment{enabstract}[2][]{%
  % 空两行后打印英文标题（二号居中）
  \par\vspace{2\baselineskip}%
  {\centering\linespread{1.5}\selectfont\bfseries\zihao{2}#2\par}%
  % 空一行打印英文副标题（三号）
  \ifblank{#1}{}{%
    \vspace{\baselineskip}%
    {\centering\zihao{3}——#1\par}}%
  % 空一行，居中三号加黑打印 ABSTRACT
  \vspace{\baselineskip}%
  {\centering\bfseries\zihao{3}ABSTRACT\par}%
  \vspace{0.5\baselineskip}%
  % 英文摘要正文：四号，段首缩进，行距固定值 20 磅
  \linespread{1}\fontsize{14pt}{20pt}\selectfont
  \setlength{\parindent}{2\ccwd}%
}{\par}

%% 英文关键词：加黑三号“Key Words:”（Key 与 Words 间空一格）+ 四号关键词，首字母大写
\newcommand{\enkeywords}[1]{%
  \par\vspace{20pt}%
  \noindent{\bfseries\zihao{3}Key Words: }{\zihao{4}#1}\par}

%% ------------------------------------------------------------
%% 参考文献（规范二10）
%%   另起一页，“参考文献”三号黑体居中（由章标题格式自动实现）；
%%   条目小四号宋体、左起、悬挂缩进 2 字符、1.25 倍行距，[1] 连续编号
%% ------------------------------------------------------------
\renewcommand{\bibname}{参考文献}
\renewenvironment{thebibliography}[1]
 {\chapter*{\bibname}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \zihao{-4}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \setlength\labelsep{0.5\ccwd}%
        \setlength\leftmargin{2\ccwd}%
        \setlength\itemindent{\dimexpr\labelwidth+\labelsep-2\ccwd\relax}%
        \setlength\itemsep{0pt}%
        \setlength\parsep{0pt}%
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
 {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}

%% ------------------------------------------------------------
%% 附录（规范二11）
%%   “附录1 附录名”三号黑体居中；中文 5 号宋体，英文数字 5 号 Times New Roman，
%%   行距固定值 18 磅
%% 用法：
%%   \begin{appendices}
%%     \chapter{附录名}   % 自动编号为“附录1 附录名”
%%     ……
%%   \end{appendices}
%% ------------------------------------------------------------
\newenvironment{appendices}{%
  \setcounter{chapter}{0}%
  \renewcommand{\theHchapter}{appendix.\arabic{chapter}}% 避免与正文章节的超链接锚点重名
  \ctexset{chapter={name={附录},number=\arabic{chapter},aftername={\hspace{0.5\ccwd}}}}%
  \linespread{1}\fontsize{10.5pt}{18pt}\selectfont
}{\clearpage}

%% ------------------------------------------------------------
%% 致谢（规范二12）
%%   另起一页，“致  谢”三号黑体居中（“致”“谢”间空两个汉字）；
%%   中文小四号宋体，英文数字 Times New Roman，1.25 倍行距
%% ------------------------------------------------------------
\newenvironment{acknowledgements}{%
  \chapter*{致\hspace{2\ccwd}谢}%
  \addcontentsline{toc}{chapter}{致谢}%
}{}

%% ------------------------------------------------------------
%% 超链接（目录、引用可点击；打印无影响）
%% ------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{hidelinks, bookmarksnumbered}

\endinput
