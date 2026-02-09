locals {
  project = "11-multiple-projects"

}

locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
  }
}