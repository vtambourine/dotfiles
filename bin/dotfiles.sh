#!/usr/bin/env bash

set -e
set -u

DOTFILES_DIRECTORY="${HOME}/dotfiles2"
DOTFILES_GIT_REMOTE="http://github.com/vtambourine/dotfiles.git"
DOTFILES_GIT_BRANCH="blank"
DOTFILES_BOOTSTRAP="${DOTFILES_GIT_REMOTE}/raw/${DOTFILES_GIT_BRANCH}/`basename $0`"
DOTFILES_TARBALL_PATH="${DOTFILES_GIT_REMOTE}/archive/${DOTFILES_GIT_BRANCH}.tar.gz"

source ./lib/utils.sh

# If missing, download ad extract dotfiles repository
if [[ ! -d ${DOTFILES_DIRECTORY} ]]; then
    printf "Downloading dotfiles...\n"
    mkdir ${DOTFILES_DIRECTORY}
    # Get the tarball
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOTFILES_TARBALL_PATH} || true
    # Extract to the dotfiles directory
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIRECTORY}
    # Remove the tarball
    rm -rf ${HOME}/dotfiles.tar.gz
fi

cd ${DOTFILES_DIRECTORY}

# Initialize the git repository if it's missing
if ! is_git_repo; then
    printf "Initializing git repository...\n"
    git init
    git remote add origin ${DOTFILES_GIT_REMOTE}
    #!/usr/bin/env bash¬
fi

# Update git repository if it's clean
if is_clean_repo; then
    git fetch origin master
    # Reset the index and working tree to the fetched HEAD
    # (submodules are cloned in the subsequent sync step)
    git reset --hard FETCH_HEAD
    # Remove any untracked files
    #git clean -fd
else
    printf "Git repository has uncommited changes.\n"
    printf "Please, commit or stash them before continue.\n"
    exit 1
fi