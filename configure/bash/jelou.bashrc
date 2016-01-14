export PATH=~/local/bin/:~/local/bin/cbr:~/local/bin/10k:~/bin:/router/bin:/usr/bin:/usr/sbin:/usr/ucb:/usr/xpg4/bin:/usr/ccs/bin:$PATH
export SHELL=/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/router/bin:/sw/packages/gcc/c2.95.3/sparc-sun-solaris2.8/lib/:~/software/


export cscope='/usr/bin/cscope'
export ctags='/usr/bin/ctags'
alias sc='source ~/.bashrc'
alias emacs="/auto/usrcisco-sunos-5.8-sparc-32/packages/emacs/emacs-21.2+20020205/bin/emacs"

alias vtw="/opt/vde/services/instances/vde_latest/bin/vt_wrapper"
alias vt="/opt/vde/services/instances/vde_latest/bin/vde_tool --Vforce"
alias vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool --Vno_sync"
alias vls="/opt/vde/services/instances/vde_latest/bin/vde_tool --Vno_sync reader ls"
alias vout="vt --Vforce sync_out"
alias vin="vt sync_in"

alias vrin="vtn request -type in -time 29d --reason \"bighorn lb: add docsis 2.0 lb\""
alias vrout="vtn request -type out -time 29d --reason \"bighorn lb: add docsis 2.0 lb\""

alias pf_sim2="./pf_sim -simexe /auto/shgate/tools/toastertools/nt3_sim/v2.20/solaris_bin/nt3_sim -html_output test -debug_cpu c_msg context_switch"
alias pf_sim="./pf_sim -simexe  /auto/shgate/tools/toastertools/nt3pe/v2.04/solaris_bin/nt3cr_full_sim -debug_cpu c_msg context_switch -html_output test"

alias gdbmips="/router/bin/gdb-bleeding.mips64"
alias gdbppc="/router/bin/gdb-6.4.0.ppc"

alias objdump-mips="/router/bin/objdump.c2.95.3-p12.mips64"
alias objdump-ppc="/router/bin/objdump.c2.95.3-p12.ppc"

#alias vi="/usr/cisco/packages/vim/vim-6.3/bin/gvim"
alias vim="/usr/bin/gvim"

alias gdbppc='/router/bin/gdb-bleeding.ppc'
alias perl="/usr/cisco/bin/perl"
alias gcc="/usr/bin/gcc"
export PS1='[\w]$'
alias ws='cd /ws/jelou/'
alias vi="gvim"
alias ls='ls --color=auto'
alias ls7200='ls -altr /tftpboot/jelou | grep jk9su2'
alias lsdiff='ls -altr /tftpboot/jelou/diff_file'
alias lsimage='ls -altr /tftpboot/jelou'
alias lspre4='ls -altr /tftpboot/jelou | grep ubr10k4-k9p6u2'
alias lspre5='ls -altr /tftpboot/jelou | grep ubr10k5-k9p6u2'
alias lscbr='ls -altr /tftpboot/jelou | grep cbrsup-universalk'
alias ftp='ftp 10.74.58.208'
alias lilyftp='ftp 10.75.220.46'
alias ftplotus='ftp 10.74.58.194'
alias ftplily='ftp 10.74.58.195'
alias getlcsym='vt sync_out  ubr10kg4clc-lck9-mz.symbols'
alias getrpsym='vt sync_out ubr10k4-k9p6u2-mz.symbols'
alias pd='pushd'
alias cbr='source dirchange -cbr'
alias ios='source dirchange -ios'
alias binos='source dirchange -binos'
alias doc='source dirchange -docsis'
alias lb='source dirchange -lb'
alias cy='source dirchange -cylon'
alias sup='source dirchange -sup'
alias bin='cd /users/jelou/local/bin'

alias vtco='vt cc_co'
function lt() { ls -ltrsa "$@" | tail; }

function lyp_test()
{
    echo "this is test from lyp";
    }

alias go=go_dir
function go_dir()
{
    cd *$1*
}

