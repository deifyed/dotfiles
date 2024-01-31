local primarycolor=066 # blue
local secondarycolor=130 # red
local tertiarycolor=285 # grey

time_info() {
	echo "%{$FG[$primarycolor]%}[`date +%H:%M`]"
}

dir_info() {
	echo "%{$FG[$tertiarycolor]%}%1~/"
}

last_command_info() {
  local delim="λ"

  if [[ -n ${IN_NIX_SHELL+x} ]]; then
    delim="Ξ"
  fi

	echo " %(?.%F{$primarycolor}${delim}%f.%F{$secondarycolor}${delim}%f)"
}

mkube_info() {
	local namespace=

	if [[ -n $KUBECONFIG ]]; then
		local namespace=$(kubectl --kubeconfig=${KUBECONFIG} config view --minify --output 'jsonpath={..namespace}')

		echo " %{$FG[$primarycolor]%}${namespace:-default}"
	fi
}

aws_profile_info() {
	if [[ -n $AWS_PROFILE ]]; then
		echo " %{$FG[$primarycolor]%}$AWS_PROFILE"
	fi
}

mgit_info() {
	if [[ -n $(git rev-parse --git-dir 2> /dev/null) ]]; then
		local cb=$(git branch --show-current)
		local color="%{$FG[$primarycolor]%}"

		if [[ -n "$cb" ]]; then
			if [[ -n "$(git status --porcelain)" ]]; then
				color="%{$FG[$secondarycolor]%}"
			fi

			echo " ${color}`git branch | grep \* | cut -d ' ' -f2`"
		else
			echo ""
		fi
	fi
}

PS1='$(time_info)%{$reset_color%} $(dir_info)$(aws_profile_info)%{$reset_color%}$(mkube_info)%{$reset_color%}$(mgit_info)%{$reset_color%}$(last_command_info)%{$reset_color%} '
