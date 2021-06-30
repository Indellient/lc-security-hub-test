_Please set the environment variables for **AWS Access Key ID**, **AWS Secret Access Key**, and optionally AWS session token as needed_

## Single Account Setup

* The `simple` folder contains terraform setup for an individual account on AWS

Terraform setup is being done remotely using `terraform_state_backend` through an S3 bucket

To run this:
```
cd simple
terraform apply
```

## AWS Organization Setup

* The `master` folder contains terraform setup for the management account of the AWS Organization
* The `member` folder contains terraform setup for each member account of the AWS Organization

Both folders terraform setup is being done remotely using `terraform_state_backend` and individual S3 buckets

To run this:
* For `master`:
    ```
    cd master
    terraform apply -var-file='dev.tfvars'
    ```
* For `member`:
    ```
    cd member
    terraform apply
    ```