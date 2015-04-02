#! /bin/bash
# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and

# Download a backup from GCS if available
if [[ -n "$GCS_RESTORE_URL" && $GCS_RESTORE_URL == gs://* ]]
then
  echo "Restoring from $GCS_RESTORE_URL"
  mkdir -p /tmp/jenkins_restore && cd /tmp/jenkins_restore
  gsutil cp $GCS_RESTORE_URL restore.tgz
  tar -zxvf restore.tgz
  cp -R `ls -d  */`*  /usr/share/jenkins/ref/
  cd $HOME
  rm -rf /tmp/jenkins_restore
fi

# Run jenkins startup script
/usr/local/bin/jenkins.sh "$@"
