FROM rockylinux:9.3

RUN dnf -y update && dnf -y upgrade

RUN dnf -y install dnf-plugins-core \
 && dnf -y config-manager --set-enabled crb \
 && dnf -y makecache

  #RUN update-crypto-policies --set DEFAULT

RUN dnf -y install ncurses epel-release
RUN dnf -y groupinstall "Development Tools"
RUN dnf -y install gcc-toolset-15

RUN dnf clean all

RUN echo "source /opt/rh/gcc-toolset-15/enable" >> /root/.bashrc

# set trimmed paths
RUN echo "export PROMPT_DIRTRIM=2" >> /root/.bashrc
RUN echo "export PROMPT_COMMAND='echo'" >> /root/.bashrc

# define git branch function safely
RUN echo '\
parse_git_branch() { \
  git branch --show-current 2>/dev/null | sed -e "s/.*/(\0)/"; \
} \
' >> /root/.bashrc

# set the colored prompt with git branch call
RUN echo '\
PS1="\[\e[1;36m\]\w\[\e[0m\] \[\e[1;34m\]\$(parse_git_branch)\[\e[0m\]\n\[\e[1;36m\]❯\[\e[0m\] " \
' >> /root/.bashrc
