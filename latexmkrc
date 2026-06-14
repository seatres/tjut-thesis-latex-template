# latexmk 配置：本模版必须用 XeLaTeX 编译
# 用法：latexmk main.tex      （自动多次编译至交叉引用收敛）
#       latexmk -c            （清理中间产物，保留 PDF）
#       latexmk -C            （清理全部产物，含 PDF）
$pdf_mode = 5;   # 5 = XeLaTeX（xelatex -> .xdv -> .pdf）
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$clean_ext = 'xdv synctex.gz';
