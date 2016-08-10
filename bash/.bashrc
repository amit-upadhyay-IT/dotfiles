# .bashrc
# Unlike earlier versions, Bash4 sources your bashrc on non-interactive shells.
# The line below prevents anything in this file from creating output that will
# break utilities that use ssh as a pipe, including git and mercurial.
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# history substring search
bind '"\eOA": history-search-backward'
bind '"\e[A": history-search-backward'
bind '"\eOB": history-search-forward'
bind '"\e[B": history-search-forward'
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
set -o vi

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
alias gdb1a='gdb -cd /data/users/alexyang/mysql/5.6/mysql-test -x /data/users/alexyang/mysql/5.6/_build-5.6-ASan/mysql-test/var/tmp/gdbinit.mysqld.1 /data/users/alexyang/mysql/5.6/_build-5.6-ASan/sql/mysqld'
alias notes='cd ~/notes'
alias myb='~/mysql/tools/mysqlbuild.sh'
alias mtri='~/mysql/tools/mysqltest.sh'
alias mtric='~/mysql/tools/mysqltest.sh --clean'
alias mtrr='~/mysql/tools/mysqltest.sh  --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mtrrc='~/mysql/tools/mysqltest.sh --clean --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mtrrca='~/mysql/tools/mysqltest.sh --clean --asan --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mtrra='~/mysql/tools/mysqltest.sh --asan --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mtrrcv='~/mysql/tools/mysqltest.sh --clean --valgrind --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mtrrv='~/mysql/tools/mysqltest.sh --valgrind --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias mps='/usr/local/bin/mysql_pool_util'
# release
alias mtrrr='~/mysql/tools/mysqltest.sh --clean --release --mysqld=--default-storage-engine=rocksdb --mysqld=--default-tmp-storage-engine=MyISAM --mysqld=--skip-innodb --mysqld=--rocksdb'
alias my1d='cd ~/mysql/5.6/_build-5.6-Debug/mysql-test/var/log'
alias rdbdd='cd mysqld.1/data/.rocksdb'

# got this from magicmonty/bash-git-prompt
#export LS_COLORS="di=36;40:ln=35;40:so=31;:pi=0;:ex=1;;40:bd=0;:cd=37;:su=37;:sg=0;:tw=0;:ow=0;:"
eval `dircolors ~/.dir-colors`

# my bash powerline script
source ~/.bash-powerline.sh

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  #export FZF_DEFAULT_OPTS="
    #--color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    #--color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #"
  ## Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}

_gen_fzf_default_opts

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
