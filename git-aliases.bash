# Basic operations
alias add='git add'
alias addl='git add -all'
alias br='git branch'
alias bra='git branch -a'
alias ci='git commit'
alias co='git checkout'
alias go='git checkout'
alias com='git checkout master'
alias cfg='git config'
alias cfgl='git config --list'
alias chp='git cherry-pick'
alias fch='git fetch'
alias mrg='git merge'
alias rh='git reset HEAD'
alias rhh='git reset HEAD --hard'
alias st='git status'
alias sts='git status -s'
alias psh='git push'
alias pul='git pull'
alias cim='git commit -m'
alias rmo='git remote'
alias rmou='git remote update'
alias rmov='git remote -v'
alias undo='git reset --hard'

# Tags
alias taglist='git tag -l'
# $1 tag name
alias fchtag='! f() { git fetch --tags $1; }; f'
# checkout tag to local
# $1 tag name
alias cotag='! f() { git checkout tags/$1; }; f'
# checkout tag as a new local branch
# $1 tag name
# $2 branch name
alias cotag2br='! f() { git checkout tags/$1 -b $2; }; f'

# Diff
alias dif='git diff'
alias dfh='git diff HEAD'
# $1 previous version number
alias dfh2='! f() { git diff HEAD@{$1}; }; f'
# $1 previous version number
# $2 file name
alias dfh3='! f() { git diff HEAD@{$1} -- $2; }; f'
alias dfs='git diff --staged'
alias dfc='git diff --cached'
# $1 commit hash
alias dfci='! f() { git diff $1; }; f'
# $1 commit1 hash
# $2 commit2 hash
alias dfci2='! f() { git diff $1 $2; }; f'
# if one of these two arguments is missing, it will be instead of HEAD
alias dfci3='! f() { git diff $1..$2; }; f'
# diff remote branch with previous version number
# $1 remote branch name
# $2 version number
alias dfr='! f() { git diff origin/$1~$2 }; f'

# Clean
alias clean='git reset --hard && git clean -dfx'
# remove file from commit/cache
# $1 file name
alias rmci='! f() { git rm --cached $1; }; f'
# remove directory from commit/cach
# $1 directory name
alias rmci2='! f() { git rm --cached -r $1 }; f'

# Fetch
alias fetchhead='! f() { git fetch origin:$1; }; f'

# Merge
alias mergehead='! f() { git merge FETCH_HEAD; }; f'

# Push
alias pushhead='! f() { git push origin HEAD:$1; }; f'

# Branch
alias deletebranch='! f() { git branch | grep $1 | xargs git branch -D; }; f'
alias newbranch='! f() { git checkout $1 --track $1; }; f'

# Stash
alias stashlist='git stash list'
alias stashsave='git stash save'
alias stashpop='git stash pop'
alias stashdrop='git stash drop'
alias stashapply='! f() { git stash apply stash@{$1}; }; f'
alias stashshow='! f() { git stash show --text }; f'

# Prune
alias pruneall='git remote | xargs -n 1 git remote prune'

# Ignore
alias ignore='git update-index --assume-unchanged'
alias unignore='git update-index --no-assume-unchanged'

# Log
alias log='git log'
alias lgg='git log --graph'
alias lggx='! f() { git log --graph --max-count=$1; }; f'
alias logfetch='git log ORIG_HEAD.. --stat --no-merges'
alias mlog='git log --graph --pretty=format:"%Cred%H%Creset @%C(yellow)%d%Creset %n Author: %cn <%ce> %n Date: %cd %Cblue(%cr)%Creset %n %n Commit subject: %Cgreen%s%Creset %n"'
