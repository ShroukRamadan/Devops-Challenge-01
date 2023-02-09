####  frist you need to create service accont in your gcp project  with editor role and download a key to use terraform 




## to connect to cluster from vm 

```
gcloud auth login

gcloud container clusters get-credentials k8s-cluster --zone us-central1-a --project shrouk-iti

sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin


# sudo apt-get install kubectl

gcloud components install kubectl

```

### push images to gcr

gcloud auth configure-docker

gcloud docker -- push us.gcr.io/shrouk-iti-project/redis:latest

gcloud docker -- push us.gcr.io/shrouk-iti-project/python-img:v1.0 


### pull images from gcr

```
docker pull us.gcr.io/shrouk-iti/python-img:v1.0

docker pull us.gcr.io/shrouk-iti/redis:latest

```

