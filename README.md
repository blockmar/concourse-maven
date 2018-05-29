# concourse-maven
Test-project for building Maven projects with Concourse

Task files are often identical in multiple pipelines so instead of commiting identical files in all projects I keep them here.

## Pipeline

The pipeline needs to be set by running something similar to:

`fly -t mytarget set-pipeline -c pipeline.yml -p mypipeline -l credentials-etc.yml`

The pipleline has who variables:

 - `github-private-key`: Private key for github access. (Since the git resource is generic we can't use API key access)
 - `git-repo`: Name of github repository including oranization
 - `git-branch`: Name of branch to build.

## Docker

I created a custom docker image to allow buit in support for cache directories instead of putting scripts in a tools repositor dependency. If a tools repo is used (like the pipeline.yml example) then the script `maven-run.sh` can be places there instead.

Also seems like Concourse overrides the default Entrypoint in the docker images that's why the setup script is called directly.
