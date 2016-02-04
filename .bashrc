# .bashrc
# Unlike earlier versions, Bash4 sources your bashrc on non-interactive shells.
# The line below prevents anything in this file from creating output that will
# break utilities that use ssh as a pipe, including git and mercurial.
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source Facebook definitions
if [ -f /usr/facebook/ops/rc/master.bashrc ]; then
  . /usr/facebook/ops/rc/master.bashrc
elif [ -f /mnt/vol/engshare/admin/scripts/master.bashrc ]; then
  . /mnt/vol/engshare/admin/scripts/master.bashrc
fi

# history substring search
bind '"\eOA": history-search-backward'
bind '"\e[A": history-search-backward'
bind '"\eOB": history-search-forward'
bind '"\e[B": history-search-forward'
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
set -o vi

# User specific aliases and functions for all shells
export JAVA_HOME=/usr/local/jdk-7u72-64

#source $ADMIN_SCRIPTS/scm-prompt
#export PS1='\u@\h:\w $(_dotfiles_scm_info)\$ '

export EDITOR=vim
export VISUAL=vim

#alias admin_scripts='[[ -z "$ADMIN_SCRIPTS" ]] && export ADMIN_SCRIPTS="/mnt/vol/engshare/admin/scripts" && source "${ADMIN_SCRIPTS}/master.zshrc" && source "${ADMIN_SCRIPTS}/scm-prompt"'
alias clip="nc localhost 8377"
alias sarc="php /mnt/vol/engshare/svnroot/tfb/trunk/www/scripts/site_integrity/sigma/sarc.php"
alias parc='https_proxy=fwdproxy:8080 arc'
alias my1='cd ~/mysql/5.6/'
alias myt='cd ~/mysql/tools/'
alias rocksdb_log_mysqld1='tail -F -n 30 ~/mysql/5.6/_build-5.6-Debug/mysql-test/var/mysqld.1/data/.rocksdb/LOG'
alias mytest='~/mysql/tools/mysqltest.sh'
alias myrpm='cd /data/users/alexyang/rpmbuild/RPMS/x86_64'
alias gdb='cgdb'
alias t='tmux'
alias ctags_mysql="ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --langdef=errmsg --regex-errmsg='/^(ER_[A-Z0-9_]+)/\1/' --langmap='errmsg:(errmsg*.txt),c:+.ic,yacc:+.yy' --exclude='_build*' --exclude='xtrabackup' --exclude='scripts' --exclude='arcanist' --exclude='BUILD' --exclude='cmake' --exclude='dbug' --exclude='Docs' --exclude='extra' --exclude='lib*' --exclude='man' --exclude='packaging' --exclude='source_downloads' --exclude='support-files' --exclude='win' ."
alias gdb1='gdb -cd /data/users/alexyang/mysql/5.6/mysql-test -x /data/users/alexyang/mysql/5.6/_build-5.6-Debug/mysql-test/var/tmp/gdbinit.mysqld.1 /data/users/alexyang/mysql/5.6/_build-5.6-Debug/sql/mysqld'
alias gdb2='gdb -cd /data/users/alexyang/mysql/5.6/mysql-test -x /data/users/alexyang/mysql/5.6/_build-5.6-Debug/mysql-test/var/tmp/gdbinit.mysqld.2 /data/users/alexyang/mysql/5.6/_build-5.6-Debug/sql/mysqld'
alias notes='cd ~/notes'

# got this from magicmonty/bash-git-prompt
export LS_COLORS="di=36;40:ln=35;40:so=31;:pi=0;:ex=1;;40:bd=0;:cd=37;:su=37;:sg=0;:tw=0;:ow=0;:"

# my bash powerline script
source ~/.bash-powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/mysql/tools/mysqldebugging.sh

#!/usr/bin/bash
#
# ANSI color scheme script featuring Space Invaders
#
# Original: http://crunchbang.org/forums/viewtopic.php?pid=126921%23p126921#p126921
# Modified by lolilolicon
#

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
bld=$'\e[1m'
rst=$'\e[0m'

cat << EOF

 $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀$rst
 $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀$rst

 $bld$f1▄ ▀▄   ▄▀ ▄   $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4▄ ▀▄   ▄▀ ▄   $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $bld$f1█▄█▀███▀█▄█   $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4█▄█▀███▀█▄█   $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $bld$f1▀█████████▀   $f2▀▀▀██▀▀██▀▀▀   $f3▀▀█▀▀█▀▀   $f4▀█████████▀   $f5▀▀▀██▀▀██▀▀▀   $f6▀▀█▀▀█▀▀$rst
 $bld$f1 ▄▀     ▀▄    $f2▄▄▀▀ ▀▀ ▀▀▄▄   $f3▄▀▄▀▀▄▀▄   $f4 ▄▀     ▀▄    $f5▄▄▀▀ ▀▀ ▀▀▄▄   $f6▄▀▄▀▀▄▀▄$rst
EOF
