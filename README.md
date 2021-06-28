Please set the environment variables for AWS Access Key ID, AWS Secret Access Key, and optionally AWS session token as needed

* The `master` folder contains terraform setup for the management account of the AWS Organization
* The `member` folder contains terraform setup for each member account of the AWS Organization

Both folders terraform setup is being done remotely using `terraform_state_backend` and individual S3 buckets