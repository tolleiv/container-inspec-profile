# Docker InSpec Profile

This shows the implementation of an InSpec Matcher and Resource using the Docker API and implements basic tests which should match on all containers.


# Usage (from Mac OSX):

Preparation:

    # Run Guinea-pig container which we want to test
    docker run -d --name "guinea-pig" alpine /bin/sh -c "while true; do sleep 10; done"
    ID=$(docker ps --format "{{ .ID }}" --filter="name=guinea-pig")
    echo "container: ${ID}" > ./attrs.yaml

Run Tests:

    docker run --rm -v $(pwd):/share -v /var/run/docker.sock:/var/run/docker.sock chef/inspec exec https://github.com/tolleiv/container-inspec-profile --attrs attrs.yaml


Running a "suite" of tests:

    git clone https://github.com/tolleiv/container-inspec-profile.git
    container-inspec-profile/test.sh $ID
