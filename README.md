# Docker image with gitlab-ci-multi-runner to run builds for C++, Python and Fortran applications.

Docker image with gitlab-ci-multi-runner, which can run builds for C++, Python and Fortran, especially the Serenity QC Package. 

## How to use

Example of [Docker Compose](https://docs.docker.com/compose/) file (`docker-compose.yml`)

```
vrunner:
  image: busybox
    volumes:
        - /home/gitlab_ci_multi_runner/data

runner:
    image: thclab.uni-muenster.de/SerenityDevelopers/docker-gitlab-ci-multi-runner-serenity:latest
    volumes_from:
        - vrunner
    environment:
        - CI_SERVER_URL=https://gitlabci.example.com
        - RUNNER_TOKEN=YOUR_TOKEN_FROM_GITLABCI
    restart: always
```
## More information

* Read about [gitlab-ci-multi-runner](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/) to learn how integration works with GitLab CI.
* This image is based on [docker-gitlab-ci-multi-runner](https://github.com/sameersbn/docker-gitlab-ci-multi-runner), which handles registration and startup.
* This image is based on [docker-gitlab-ci-multi-runner-ruby](https://github.com/outcoldman/docker-gitlab-ci-multi-runner-ruby), which helped as reference implementation.