include {
  path = find_in_parent_folders()
}

dependency "s3" {
  config_path = "../s3"
  mock_outputs_allowed_terraform_commands = [
    "validate", "plan"]

  mock_outputs = {
    bucket_arn = "fake__bucket_arn"
  }
}

dependency "iam" {
  config_path = "../iam"
  mock_outputs_allowed_terraform_commands = [
    "validate", "plan"]

  mock_outputs = {
    role_arn = "fake__role_arn"
  }
}


inputs = {
  s3__bucket_arn = dependency.s3.outputs.bucket_arn
  iam__role_arn = dependency.iam.outputs.role_arn
}