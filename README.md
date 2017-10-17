# Docker InSpec Profile

This shows the implementation of an InSpec Matcher and Resource using the Docker API and implements basic tests which should match on all containers.


# Usage (from Mac OSX):

Preparation:

This uses the *alpine* image and will cause a failed test due to the fact that the default alpine image uses 'root' as their user. Using the  *jenkins* image instead will result in a green test result due to the docker USER beeing set to 'jenkins'.

    # Run Guinea-pig container which we want to test
    docker run -d --name "guinea-pig" alpine /bin/sh -c "while true; do sleep 10; done"
    echo "container: guinea-pig" > ./attrs.yaml

Run Tests:

    docker run --rm -v $PWD:/share -v /var/run/docker.sock:/var/run/docker.sock chef/inspec exec https://github.com/tolleiv/container-inspec-profile --attrs attrs.yaml


Running a "suite" of tests:

    git clone https://github.com/tolleiv/container-inspec-profile.git
    container-inspec-profile/test.sh $ID

Cleanup:

    docker rm -f $ID
