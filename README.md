# Docker image of a GitLab CI Runner to run builds using GCC-7 and Python2 on Ubuntu 16.04.

Docker image with GitLab CI Runner, which can run builds for C++, Python and Fortran.

## How to use

Example of [Docker Compose](https://docs.docker.com/compose/) file (`docker-compose.yml`)

```
CPFRunner:
  image: nabbelbabbel/gitlab-cir-ubuntu-gcc7-python2:latest
  environment:
    - CI_SERVER_URL=<enter gitlab-ci url here>
    - RUNNER_TOKEN=<enter runner token here>
    - RUNNER_DESCRIPTION=<name the runner>
  restart: always
```
## More information

* Read about [gitlab-ci-multi-runner](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/) to learn how integration works with GitLab CI.
* This image is based on [docker-gitlab-ci-multi-runner](https://github.com/sameersbn/docker-gitlab-ci-multi-runner), which handles registration and startup.
* This image is based on [docker-gitlab-ci-multi-runner-ruby](https://github.com/outcoldman/docker-gitlab-ci-multi-runner-ruby), which helped as reference implementation.
