Repo Structure
HCL_assignment/
  main.tf
  variables.tf
  outputs.tf
  README.md
Steps Completed
#Step 1: What is Infrastructure as Code with Terraform?

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code What I did: Read through IaC concepts and completed the interactive sandbox lab (Docker-based) to understand Terraform's init → plan → apply workflow. Key learning: Terraform doesn't just run commands against infrastructure — it keeps a state file as the source of truth, comparing desired configuration against real-world resources before making any change.

#Step 2: Install Terraform

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli What I did: Installed Terraform CLI locally and verified with terraform -version. Key learning: Terraform is a single static binary — no runtime dependencies — which is why it's so portable across CI/CD systems and different OSes.

#Step 3: Build Infrastructure (AWS)

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create What I did: Wrote main.tf defining an AWS provider and an aws_instance resource, then ran terraform init, plan, and apply to create a real EC2 instance. Key learning: terraform plan is a "dry run" that shows exactly what will change before anything touches real infrastructure — this preview step is what makes Terraform safe to use in production.

#Step 4: Change Infrastructure

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-manage What I did: Modified an attribute (tags) on the existing EC2 instance in main.tf and re-ran plan/apply to see Terraform update the resource in place. Key learning: Terraform only changes what's different between your config and the current state — it doesn't tear everything down and rebuild from scratch unless the change forces resource replacement.

#Step 5: Destroy Infrastructure

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-destroy What I did: Ran terraform destroy to tear down all resources managed by the config. Key learning: Destroy is driven entirely by the state file — Terraform only destroys what it knows it created, which is why manually-created resources are never touched by destroy.

#Step 6: Define Input Variables

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-manage What I did: Created variables.tf and parameterized values like instance_type instead of hardcoding them in main.tf. Key learning: Variables make configurations reusable across environments (dev/stage/prod) without duplicating code — the same .tf files can provision different-sized infrastructure just by changing variable values.

#Step 7: Query Data with Outputs

Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-manage What I did: Created outputs.tf to expose values like instance_id and instance_public_ip after apply, viewable via terraform output. Key learning: Outputs let you surface important resource attributes (like an IP address) without manually digging through the AWS Console — and they're essential for passing data between Terraform modules.

#Step 8: Store Remote State (S3 Backend)

Link: https://developer.hashicorp.com/terraform/tutorials/state/remote What I did: Manually created an S3 bucket (bootstrap step, outside Terraform), then configured a backend "s3" block with use_lockfile = true and migrated my local state into it via terraform init. Key learning: Remote state solves the "state on one laptop" problem — it centralizes state so teams can collaborate safely, and native S3 locking (use_lockfile) prevents two people from running apply at the same time and corrupting the state.