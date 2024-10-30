# Bootstrap

[Create HCP Service Principal](https://developer.hashicorp.com/hcp/docs/hcp/admin/iam/service-principals)
[Create TFE API Token](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/users#tokens)

Create `SafePass_Sentinel` project with `sps-bootstrap-dev` workspace. 
type: 'Version Control Workflow'

### Workspace Settings
Terraform Working Directory: 'terraform/bootstrap'

### VCS Triggers
Only trigger runs when files in specified paths change: 'terraform/bootstrap/*.tf'

### VCS branch
default branch: 'develop'

### Pull Requests
Automatic speculative plans is checked

### Remote state sharing
Share with all workspaces in this organization is checked

## Variables
| Name | Value | Sensitive | Category |
|------|---------|-------|--------|
| hcp_project_id | `<HCP_PROJECT_ID>` | false | terraform |
| AWS_REGION | `eu-central-1` |false | env |
| TF_VAR_hcp_client_id | `<HCP_CLIENT_ID` | true | env |
| TF_VAR_hcp_client_secret | `<HCP_CLIENT_SECRET` | true | env |
| TF_VAR_tfe_token | `<TFE_TOKEN>` | true | env |
| TFC_AWS_PROVIDER_AUTH | `true` |false | env |
| TFC_AWS_RUN_ROLE_ARN | `arn:aws:iam::<AWS_ACCOUNT_ID>:role/sps-bootstrap` |false | env |
| TFC_AWS_WORKLOAD_IDENTITY_AUDIENCE | `aws.workload.identity` | false | env |

# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~>1.7.0 |
| aws | ~> 5.39 |
| hcp | ~> 0.83 |
| tfe | ~> 0.52 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 5.39 |
| hcp | ~> 0.83 |
| tfe | ~> 0.52 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_destroy\_plan | Determinate to allow query plan or not | `bool` | `true` | no |
| auto\_apply | Determinate to auto apply changes or not | `bool` | `true` | no |
| aws\_region | The name of AWS region | `string` | `"eu-central-1"` | no |
| aws\_workload\_identity\_audience | Will be used as the aud claim for the identity token. Required if `tfc_aws_provider_auth` is set to `true`. Defaults to `aws.workload.identity` | `string` | `"aws.workload.identity"` | no |
| environment | The name of environment. Allowed values: `dev`, `stg`, `prd`. Defaults to `dev` | `string` | `"dev"` | no |
| hcp\_client\_id | The ID of HCP client | `string` | n/a | yes |
| hcp\_client\_secret | The secret of HCP client | `string` | n/a | yes |
| hcp\_project\_id | The ID to HCP project | `string` | n/a | yes |
| name\_prefix | The prefix of names. Defaults to `sps` | `string` | `"sps"` | no |
| tfe\_project\_name | The name of the TFC project | `string` | `"SafePass_Sentinel"` | no |
| tfe\_token | The token to HCP Cloud | `string` | n/a | yes |
| vcs\_repo | The repository where modules are | <pre>object({<br>    identifier = string<br>    branch     = string<br>  })</pre> | <pre>{<br>  "branch": "develop",<br>  "identifier": "pogosoftware/safepass-sentinel"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| boundary\_user\_access\_key\_id | The access key ID |
| boundary\_user\_access\_key\_secret | The access key secret |
| workspaces | The id and name of existing TFC workspaces |

<!--- END_TF_DOCS --->
