FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

RUN sudo apt-get update -y \
  && sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \ 
  && sudo apt-get install -y fastqc roary bedtools cd-hit ncbi-blast+ mcl parallel cpanminus prank mafft fasttree

  
CMD ["roary", "fastqc", "bedtools", "cd-hit", "ncbi-blast+", "mcl", "parallel", "cpanminus", "prank", "mafft", "fasttree"]
