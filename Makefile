# 天津理工大学毕业设计说明书 LaTeX 模版 —— 构建脚本
# 需要 TeX Live / MacTeX（含 ctex、xeCJK）；编译器 XeLaTeX（见 latexmkrc）
.PHONY: all clean cleanall

all:
	latexmk main.tex

clean:
	latexmk -c

cleanall:
	latexmk -C
