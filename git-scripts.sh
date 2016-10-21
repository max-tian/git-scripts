#!/bin/sh

# Notice: This command is used for retrieve GIT HEAD information from .git directory.
# And the situation is that all of git repositories have been placed in parent directory.
# There is no more embedded sub-directory which contains another one or more git repositories.
# Thus, there is no recursive invokation to loop sub-direcotories for looking up other repositories.
# Usage:
# First, change your directory to your git repositories holder place. Which means parent directory.
# Second, type '__git_current_heads' in your bash command line and hit enter key.
# You will see follwing results:
# $ __git_current_heads
# Parent Directory: /d/github
#         git: master
# git-scripts: master
__git_current_heads ()
{
    local parent_dir=$(pwd) pattern="ref: refs/heads/" current_dir split_path max=0 current=0 existed=false
    local -a dir_len_array
    local counter=0
    local error_msg="There is no .git directory in parent folder($parent_dir).\nPlease change your directory to your repositories parent folder."
    echo "Parent Directory: "$parent_dir;

    # Looping sub-directories in parent dir and put the length of each direcotry's name
    # into array for next calculation.
    for i in $parent_dir/* ;do
        if [ -d "$i" ]; then
            split_path=${i:${#parent_dir}+1}
            dir_len_array+=("${#split_path}")
            current=${dir_len_array[$counter]}

            if [ $current -gt $max ]; then
                max=$current
            fi

            ((counter++))
        fi
    done

    # Looking for .git folder which contains HEAD file.
    # And read the content from HEAD file.
    # And build up the relation-ship between directory name and refs.
    for k in $parent_dir/* ; do
        current_dir=$k;
        if [ -d "$current_dir" ]; then
            if [ -e "$k/.git" ] && [ -d "$k/.git" ]; then
                existed=true
                if [ -f "$i/.git/HEAD" ]; then
                    while IFS='' read -r line || [[ -n "$line" ]]; do
                        printf '\e[1;32;40m%*s\033[0m: \e[1;31;40m%s\033[0m\n' $((max+1)) "${k:${#parent_dir}+1}" "${line:${#pattern}}"
                    done < "$k/.git/HEAD"
                fi
            fi
	    fi
    done

    if [ "$existed" = false ]; then
        echo -e $error_msg
    fi

    $(cd $parent_dir)
}

# This function aim to clean all of local repositories with specific git alias for git-clean command.
# NOTICE: All of untracked files/directories in local repositories will be clean.
__git_clean_all_repos ()
{
    local parent_dir=$(pwd)
    echo "Parent directory: $parent_dir"

    for i in $parent_dir/* ; do
        echo "===git clean: start===$i"
        if [ -d "$i" ]; then
            cd $i
            clean
        fi
        echo "===git clean: end===$i"
    done

    cd $parent_dir
}
