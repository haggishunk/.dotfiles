
##### FUNCTIONS #####
function sshme {
    eval $(ssh-agent)
    ssh-add
}

function sshagent-on {
    if [[ -z $SSH_AGENT_PID ]]; then
        printf ""
    else
        if [[ -z $(ps -q $SSH_AGENT_PID -o comm=) ]]; then
            printf ""
        else
            printf "\uF21D"
        fi
    fi
}

function py3 {
    export VIRTUAL_ENV_DISABLE_PROMPT=1 # do not let virtualenv change the command prompt
    source ~/py3/bin/activate
    complete -C $(which aws_completer) aws
}

function py37 {
    export VIRTUAL_ENV_DISABLE_PROMPT=1 # do not let virtualenv change the command prompt
    source ~/py37/bin/activate
    complete -C $(which aws_completer) aws
}

function py2 {
    export VIRTUAL_ENV_DISABLE_PROMPT=1 # do not let virtualenv change the command prompt
    source ~/py2/bin/activate
    complete -C $(which aws_completer) aws
}

function git-branch {
    # git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \xef\x84\xa6\1/'
    git branch 2>/dev/null | \
    sed -e '/^[^*]/d' \
        -e 's/* \(.*\)/ ICON\1/' \
        -e $'s/ICON/\uf126/'
}

function kube-context {
    kubectl config get-contexts | awk '/^\*/ {if ($5 == "") print " " $2; else print " " $2 " (" $5 ")"}'
}

function terraform-workspace {
    terraform workspace list 2>/dev/null | \
    sed -e '/^[^*]/d' \
        -e '/default/d' \
        -e 's/* \(.*\)/ ICON\1/' \
        -e $'s/ICON/\uf3bd/'
}

function py-virtualenv {
    VIRT=`basename "${VIRTUAL_ENV:-none}"`
    python --version 2>/dev/null | \
    sed -e 's/Python \(.*\)\.[0-9]/\1/' \
        -e "s/\(.*\)/ ICON$VIRT-\1/" \
        -e $'s/ICON/\uf3be/'
}

function tp {
    terraform plan -var-file "$(terraform-workspace | sed -e 's/\xef\x8e\xbd//' -e 's/ //').tfvars" -out plan $@
}
function td {
    terraform destroy -var-file "$(terraform-workspace | sed -e 's/\xef\x8e\xbd//' -e 's/ //').tfvars" $@
}

function kno_externalid {
    kubectl get node -ojson | jq ".items[] | select(.spec.externalID == \"${1}\") | .metadata.name"
}

function kno_metaname {
    kubectl get node -ojson | jq ".items[] | select(.metadata.name == \"${1}\") | .spec.externalID"
}

function kpol {
  kubectl get pod -l $1 -o jsonpath="{.items[0].metadata.name}"
}

function gcm {
    git commit -m "$1"
}
