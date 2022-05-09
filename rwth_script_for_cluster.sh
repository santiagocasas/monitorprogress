#!/usr/local_rwth/bin/zsh


# ask for four tasks (which are 4 MPI ranks)
#SBATCH --ntasks=1
 
# ask for 24 threads per task=MPI rank (which is 1 thread per core on one socket on CLAIX18)
#SBATCH --cpus-per-task=1
#SBATCH --time=18:00:00
#SBATCH --output="git_commits.txt"
#SBATCH --job-name="pygit"
#
#SBATCH --mem-per-cpu=4G   #M is the default and can therefore be omitted, but could also be K(ilo)|G(iga)|T(era)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/qh043052/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/qh043052/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/qh043052/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/qh043052/anaconda3/bin:$PATH"
    fi
fi
# <<< conda initialize <<<

conda activate base

python scheduler.py


