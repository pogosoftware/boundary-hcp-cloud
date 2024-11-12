
plugin "aws" {
  enabled = true
  version = "0.34.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_comment_syntax.md
rule "terraform_comment_syntax" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_deprecated_index.md
rule "terraform_deprecated_index" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_deprecated_interpolation.md
rule "terraform_deprecated_interpolation" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_documented_outputs.md
rule "terraform_documented_outputs" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_documented_variables.md
rule "terraform_documented_variables" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_module_pinned_source.md
rule "terraform_module_pinned_source" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_module_version.md
rule "terraform_module_version" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_naming_convention.md
rule "terraform_naming_convention" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_required_providers.md
rule "terraform_required_providers" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_required_version.md
rule "terraform_required_version" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_standard_module_structure.md
rule "terraform_standard_module_structure" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_typed_variables.md
rule "terraform_typed_variables" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_unused_declarations.md
rule "terraform_unused_declarations" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_unused_required_providers.md
rule "terraform_unused_required_providers" {
  enabled = true
}

# https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_workspace_remote.md
rule "terraform_workspace_remote" {
  enabled = true
}
