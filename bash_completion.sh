#add completion for TSession
function _TSession()
{
    SESSIONDIR=""
    local cmd="$1##*/}"
    local word=${COMP_WORDS[COMP_CWORD]}
    local line=${COMP_LINE}
    local xpat=$(for file in $(find "$SESSIONDIR" -name "*.session"); do basename $file; done)

    COMPREPLY=($(compgen -W "$xpat" -- "${word}"))

    return 0
}
complete -o nospace -F _TSession TSession

