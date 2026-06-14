# 字体获取说明（请手动放入本目录）

> ⚠️ **本目录不含字体文件**。中易字体（宋体/黑体/楷体/仿宋）是随 Windows
> 授权分发的**版权字体**，不能公开再分发，因此未包含在本仓库中（已被
> `.gitignore` 排除）。请按下面的步骤，从你**拥有合法授权**的设备自行获取。

## 一、需要哪些文件

把以下 **4 个中文字体文件**放进本 `fonts/` 目录，文件名保持**全小写**：

| 文件名 | 字体 | 用途 |
|---|---|---|
| `simsun.ttc` | 宋体 SimSun | 正文、节/小节名、参考文献、致谢、附录等 |
| `simhei.ttf` | 黑体 SimHei | 各级标题、“摘要/目录/致谢”、关键词标签 |
| `simkai.ttf` | 楷体 KaiTi | 摘要正文、图题、表题、副标题 |
| `simfang.ttf` | 仿宋 FangSong | 备用（部分场合） |

> **西文 Times New Roman 不必放这里**：Overleaf 服务器已预装；本地 macOS /
> Windows 系统通常自带。模版找不到时会自动退回开源的 TeX Gyre Termes
> （度量与 Times New Roman 接近）。如需在无该字体的环境中完全一致，也可
> 把 `Times New Roman.ttf` 一并放入本目录。

## 二、从哪里获取

### Windows 电脑（最简单）
1. 打开 `C:\Windows\Fonts`；
2. 按住 <kbd>Ctrl</kbd> 依次点选“宋体”“黑体”“楷体”“仿宋”，拖到桌面，
   即得到 `simsun.ttc`、`simhei.ttf`、`simkai.ttf`、`simfang.ttf`；
3. 复制到本 `fonts/` 目录。

### macOS 电脑
macOS 默认**不带**中易字体。若你装过 Microsoft Office，可在
`/Library/Fonts/` 或 `~/Library/Fonts/` 中找到；否则需从一台有授权的
Windows 电脑按上面的方法复制过来。

## 三、放好之后怎么用

模版按以下优先级自动选择字体，**无需改任何代码**：

1. **本 `fonts/` 目录中的字体文件**（推荐，最稳定，本地与 Overleaf 一致）；
2. 系统已安装的中易字体（SimSun/SimHei/KaiTi/FangSong）；
3. 都没有时退回 TeX Live 自带的 **Fandol** 字库（外观接近，仅作应急，
   编译日志会给出一条警告）。

### 本地编译
```bash
xelatex main.tex      # 或：latexmk -xelatex main.tex
```

### Overleaf
把整个 `fonts/` 目录（含你放入的 4 个字体文件）连同项目一起上传，
编译器选 **XeLaTeX** 即可，效果与 Word 完全一致。

> 提示：LaTeX/XeLaTeX 能直接使用 `simsun.ttc` 字体集合文件，无需拆分。
> （这一点与 Typst 网页版不同。）

## 四、版权声明

中易字体（SimSun/SimHei/KaiTi/FangSong）版权归**北京中易/微软**所有，
随 Windows 授权分发。请仅在你拥有合法授权的设备上使用，**切勿公开传播**
字体文件本身。本模版只提供获取与使用方法，不分发字体。
