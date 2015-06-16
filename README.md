jenkins-swarm-gcp
====================

Docker image for Jenkins, with Swarm, git, and Google Cloud Platform plugins installed. GCP plugins support Google OAuth, Cloud Storage and Source, as well as GCE Service Accounts, ideal for running builds on Google Cloud Platform.

# Running

```shell
docker run --name jenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home gcr.io/cloud-solutions-images/jenkins-gcp-leader
```

# Backup and Restore
The image includes a job to perform backups to Google Cloud Storage. You must modify the job to include the name of your GCS bucket if you wish to perform backups.

To restore from an existing backup stored in a GCS bucket, launch the container with an environmetn variabled named GCS_RESTORE_URL that points to the backup (including the gs:// scheme). For example:

```shell
docker run --name jenkins \
  -e GCS_RESTORE_URL:gs://your-bucket/your-backup.tgz \
  -p 8080:8080 -p 50000:50000 \
  -v /var/jenkins_home gcr.io/cloud-solutions-images/jenkins-gcp-leader
```

