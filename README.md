This folder provides the Devops-Challenge-Demo-Code and IaC-Terraform for Infrastructure as Code Using Terraform and K8S for yml files for kubernetes cluster deployments and services.

## This folder contains the following folders:

    1. Devops-Challenge-Demo-Code - It contains python code.
    2. IaC-Terraform - It contains the essential files (.tf).
    3. K8S - It contains the essential files (.yml).


## Dependencies
 
 1. GCP account
    You would require to have an GCP account to be able to build cloud infrastructure.
 
 2. VS code editor
    An editor would be helpful to visualize the image as well as code. 

 3. Terraform
    You would require to install Terraform to be able to build cloud infrastructure.

 4. Git    


## Required Infrastracture 












## How to Use

   
   1. Set up GCP
     
        After creating your GCP account, create or modify the following resources to enable Terraform to provision your infrastructure:

        A GCP Project:Create one now in the GCP console and make note of the project id.

        Google Compute Engine: Enable Google Compute Engine for your project in the GCP console. Make sure to select the project you are created and click the "Enable" button.

        A GCP service account key: Create a service account key to enable Terraform to access your GCP account. When creating the key, use the following settings:
            Select the project you created in the previous step.
            Click "Create Service Account".
            Give it name(terraform-sa)  and click "Create".
            For the Role, choose "Project -> Editor", then click "Continue".
            Skip granting additional users access, and click "Done".

        After you create your service account, download your service account key.
            Select your service account from the list.
            Select the "Keys" tab.
            In the drop down menu, select "Create new key".
            Leave the "Key Type" as JSON.
            Click "Create" to create the key and save the key file to your system.
    
    2. Clone the repository from https://github.com/ShroukRamadan/Devops-Challenge-01
        
        ```
        cd ./IaC-Terraform
        ```
        Note: Don't forget to copy credintial key to this directory and chenge it in code and also change project id with project id you created 

        ```bash
        #Run terraform init to initialize the project
        terraform init 
        
        #Run terraform plan to preview the changes that will be made
        terraform plan
        #Run terraform apply to create the resources
        terraform apply

        ```
    

     
     
    3. From Local build and push images to GCR
      NOTE: Dockerfile will be found in  Devops-Challenge-Demo-Code folder

      TO BUILD IMAGES 
        ```bash
        docker pull redis:6.0.9-alpine
        # tag should be hostname/projectID/imgName
        docker tag redis:6.0.9-alpine us.gcr.io/shrouk-iti/redis
        docker build . -t us.gcr.io/shrouk-iti-project/python-img:v1.0 

        ```
        
        TO PUSH IMAGES TO GCR

        ```
        gcloud auth configure-docker

        gcloud docker -- push us.gcr.io/shrouk-iti-project/redis:latest

        gcloud docker -- push us.gcr.io/shrouk-iti-project/python-img:v1.0 

        ```

    4. SSH into the private VM and connect to cluster

        ```bash
        gcloud auth login

        #gcloud container clusters get-credentials k8s-cluster --zone us-central1-a --project shrouk-iti
        gcloud container clusters get-credentials [cluster-name] --zone [cluster-zone] --project[project-id]

        sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin


        # sudo apt-get install kubectl

        gcloud components install kubectl

        ```

