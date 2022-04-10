#!/bin/bash

# author: Mateusz Adamowski <mateusz at adamowski dot pl>
# project: https://github.com/mateusza/bash-version-compare

version_compare () {
    local va op vb vs vl
    va="$1"
    op="$2"
    vb="$3"
    case "$op" in
        lt|le|ge|gt|eq) ;;
        "")
            printf "missing operator\n" >&2
            return 2
            ;;
        *)
            printf "unknown operator: \"$op\"\n" >&2
            return 2
            ;;
    esac

    if [ -z "$va" ] || [ -z "$vb" ]; then
        printf "missing operand\n" >&2
        return 2
    fi

    if [ "$va" == "$vb" ]; then
        case "$op" in
            eq|le|ge)
                return 0 ;;
            *)
                return 1 ;;
        esac
    fi

    declare -a vs
    readarray -t vs < <(printf "%s\n%s\n" "$va" "$vb" | sort -V)
    vl="${vs[0]}"

    case "$op" in
        lt|le)
            [ "$va" == "$vl" ] && return 0 || return 1 ;;
        gt|ge)
            [ "$vb" == "$vl" ] && return 0 || return 1 ;;
    esac

    return 99
}
