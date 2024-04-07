# shellcheck disable=SC2034
if [ "${color_prompt}" == "yes" ]; then
	TMP_RED="\[\e[31m\]"
	TMP_GRE="\[\e[32m\]"
	TMP_YEL="\[\e[33m\]"
	TMP_BLU="\[\e[34m\]"
	TMP_PUR="\[\e[35m\]"
	TMP_CYA="\[\e[36m\]"
	TMP_BOL="\[\e[1m\]"

	TMP_RST="\[\e[0m\]"
	TMP_RSTB="\[\e[22m\]"

	TMP_OBRA="\[\e[1m\][\[\e[22m\]"
	TMP_CBRA="\[\e[1m\]]\[\e[22m\]"
else
	TMP_OBRA="["
	TMP_CBRA="]"
fi

export PS1_RETV_BEGIN="${TMP_OBRA}"
export PS1_RETV_END="${TMP_CBRA}"
export PS1_PWD="${TMP_OBRA}${TMP_CYA}\w${TMP_RST}${TMP_CBRA}"
export PS1_SHEBANG="\\$"
TMP_HOST_COLOR="${TMP_GRE}"
[ "${EUID}" == "0" ] && { export PS1_SHE="#"; TMP_HOST_COLOR="${TMP_RED}"; }
export PS1_USER_AT_HOST="${TMP_OBRA}${TMP_BLU}\u${TMP_RST}"
PS1_USER_AT_HOST+="@${TMP_HOST_COLOR}\h\[${TMP_RST}\]${TMP_CBRA}"
export PS1_DATE="${TMP_OBRA}"
PS1_DATE+="\$(date +%T)${TMP_CBRA}"

export PROMPT_COMMAND="getps1"

getps1()
{
	local	retv="${?}"

	if [ "${color_prompt}" == "yes" ]; then
		case ${retv} in
			"0")	retv="\[\e[32m\]${retv}\[\e[0m\]";;
			"130")	retv="\[\e[33m\]${retv}\[\e[0m\]";;
			*)		retv="\[\e[31m\]${retv}\[\e[0m\]";;
		esac
	fi
	retv="${PS1_RETV_BEGIN}${retv}${PS1_RETV_END}"

	export PS1="${PS1_USER_AT_HOST} ${PS1_DATE} ${PS1_PWD}
${retv} ${PS1_SHEBANG} "
}

unset "${!TMP_@}"
