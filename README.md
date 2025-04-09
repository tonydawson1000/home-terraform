# home-terraform
Terraform for Public Clouds

## Generic Terraform Commands

| Command                   | Description               |
| -                         | -                         |
| `terraform version`       | Shows the currently install version |
| `terraform init`          | Initialises (downloads and installs) required Providers |
| `terraform fmt`           | Ensures the file(s) are formatted to the HCL Standard |
| `terraform validate`      | Ensures the Terraform code is 'valid' |
| `terraform plan`          | Displays the 'Plan' showing diff of Actual (existing) vs Desired (terraform code) State |
| `terraform apply`         | Apply any changes |
| `terraform destroy`       | Delete ALL |

## Azure

| Command                   | Description               |
| -                         | -                         |
| `az login --use-device-code` | CLI Login to Azure |

#### SECRETS 

Environment Variables can be used with the CLI when working against Azure.
The `subscription id` is required 

| Command                   | Description               |
| -                         | -                         |
| `az account list`         | List all the `subscriptions` available |
| `az account show`         | View the 'Active' Subscription |
| `az account set --subscription "<subscription-id>"` | Set the 'Active' Subscription |

To set the Subscription Id for Terraform to use, add it as an Environment Variable.

- Windows
    - `set ARM_SUBSCRIPTION_ID="<subscription-id>"`

- Linux
    - `export ARM_SUBSCRIPTION_ID="<subscription-id>"`

#### Enable Backend

| Command                   | Description               |
| -                         | -                         |
| `az group list --query "[].name"` | List all the Resource Group Names only |



terraform init -backend-config="tf-state-backend-config.tfbackend"