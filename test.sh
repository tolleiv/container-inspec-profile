#!/bin/bash -x
set -e


inspec() {
        docker run -it --rm -v $(pwd):/share -v /var/run/docker.sock:/var/run/docker.sock chef/inspec $@
}

TMP1="attrs.tmp.yaml"
trap "{ rm -f $TMP1; }" EXIT
echo "container: $1" > "$TMP1"

inspec exec container-inspec-profile --attrs $TMP1
inspec exec https://github.com/dev-sec/cis-dil-benchmark -t docker://$1
