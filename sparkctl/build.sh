#!/usr/bin/env bash
#
# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SCRIPT=$(basename ${BASH_SOURCE[0]})
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
set -e
platforms=("linux:amd64" "darwin:amd64")
for platform in "${platforms[@]}"; do
    GOOS="${platform%%:*}"
    GOARCH="${platform#*:}"
    echo $GOOS
    echo $GOARCH
    CGO_ENABLED=0 GOOS=$GOOS GOARCH=$GOARCH go build -buildvcs=false -o sparkctl-${GOOS}-${GOARCH}
done
