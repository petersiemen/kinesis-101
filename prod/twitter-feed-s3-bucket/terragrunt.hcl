include {
  path = find_in_parent_folders()
}

dependency "iam" {
  config_path = "../iam"
  mock_outputs_allowed_terraform_commands = [
    "validate",
    "plan"]

  mock_outputs = {
    role_arn = "fake__role_arn"
    role_name = "fake__role_arn"
  }
}

inputs = {
  iam__role_name = dependency.iam.outputs.role_name
}