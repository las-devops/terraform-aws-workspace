#######################
# Local
#######################
# data "aws_workspaces_bundle" "value_windows_10" {
#   bundle_id = "wsb-bh8rsxt14" # Value with Windows 10 (English)
# }

resource "aws_workspaces_workspace" "example" {
  directory_id = "d-95671eef35"  #aws_workspaces_directory.example.id
  bundle_id    = "wsb-v9dwk5m2b" #data.aws_workspaces_bundle.value_windows_10.id
  user_name    = "kimjg2"

  root_volume_encryption_enabled = false
  user_volume_encryption_enabled = false
  #   volume_encryption_key          = "alias/aws/workspaces"

  workspace_properties {
    compute_type_name                         = "POWER"
    user_volume_size_gib                      = 100
    root_volume_size_gib                      = 175
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = {
    Service     = "IT",
    Application = "test",
    User        = "jaehwan"
  }
}