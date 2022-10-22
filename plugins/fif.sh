fif() {
    rg  \
    --column \
    --no-heading \
    --fixed-strings \
    --ignore-case \
    --hidden \
    --follow \
    --glob '!.git/*' \
    --glob '!.vscode-server/*' \
     "$1" \
    | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " $3 " " start ":" end}' \
    | fzf \
        --bind 'ctrl-o:execute(code --goto {1}:{2}:{3})+cancel' \
        --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {4}' \
        --preview-window wrap
}