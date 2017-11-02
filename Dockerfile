FROM sameersbn/ubuntu:14.04.20170228
MAINTAINER Jan Unsleber <j.unsleber@wwu.de>

ENV GITLAB_RUNNER_VERSION=10.1.0 \
    GITLAB_RUNNER_USER=gitlab_runner \
    GITLAB_RUNNER_HOME_DIR="/home/gitlab_runner"
ENV GITLAB_RUNNER_DATA_DIR="${GITLAB_RUNNER_HOME_DIR}/data"

ENV CA_CERTIFICATES_PATH=''
ENV RUNNER_CONCURRENT=''
ENV CI_SERVER_URL=''
ENV RUNNER_TOKEN=''
ENV RUNNER_EXECUTOR='docker'
ENV RUNNER_DESCRIPTION=''

ENV RUNNER_DOCKER_IMAGE='docker:latest'
ENV RUNNER_DOCKER_MODE='socket'
ENV RUNNER_DOCKER_PRIVATE_REGISTRY_URL=''
ENV RUNNER_DOCKER_PRIVATE_REGISTRY_TOKEN=''
ENV RUNNER_DOCKER_ADDITIONAL_VOLUME=''
ENV RUNNER_OUTPUT_LIMIT='4096'
ENV RUNNER_AUTOUNREGISTER='false'

# include additional repos
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ubuntu-toolchain-r/test
RUN add-apt-repository -y ppa:george-edison55/cmake-3.x
RUN apt-get update

# install build essentials
RUN apt-get install -y --no-install-recommends make cmake \
        gfortran-4.9 gfortran-4.9-multilib \
        gcc-5 g++-5 \
        autotools-dev autoconf libtool automake \
        libboost-dev libgmp3-dev liblapack-dev \
        doxygen gcovr graphviz

RUN apt-get install -y libboost-python-dev

# create links for cmake
RUN ln -s  /usr/bin/gcov-5  /usr/bin/gcov
RUN ln -s  /usr/bin/g++-5  /usr/bin/g++
RUN ln -s  /usr/bin/gcc-5  /usr/bin/gcc
RUN ln -s  /usr/bin/gfortran-4.9  /usr/bin/gfortran

RUN chown -R ${GITLAB_CI_MULTI_RUNNER_USER}:${GITLAB_CI_MULTI_RUNNER_USER} ${GITLAB_CI_MULTI_RUNNER_HOME_DIR}

RUN locale-gen en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV RUNNER_DESCRIPTION=c++
ENV RUNNER_DESCRIPTION=fortran
ENV RUNNER_DESCRIPTION=python
ENV RUNNER_DESCRIPTION=shell
ENV RUNNER_TAG_LIST=c++
ENV RUNNER_LIMIT=1

ENV RUNNER_TOKEN=
ENV CI_SERVER_URL=
