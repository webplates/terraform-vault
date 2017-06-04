variable "platform" {
    default = "debian"
    description = "OS Platform"
}

variable "_users" {
    default = {
        debian  = "debian"
    }
    description = "Users for the supported OS Platforms"
}

variable "_machine_images" {
    default = {
        debian  = "debian-cloud/debian-8"
    }
    description = "Machine images for the supported OS Platforms"
}

variable "region" {
    default     = "us-central1"
    description = "The region of Google Cloud where to launch the cluster"
}

variable "region_zone" {
    default     = "us-central1-f"
    description = "The zone of Google Cloud in which to launch the cluster"
}

variable "machine_type" {
    default     = "f1-micro"
    description = "Google Cloud Compute machine type"
}

variable "machine_name" {
    default     = "vault"
    description = "Name used for the machines"
}

variable "machine_tags" {
    default     = ["vault"]
    description = "Tags used for the machines"
}

variable "network" {
    default     = "default"
    description = "The VPC used for the instance"
}

variable "ssh_public_key" {
    type        = "string"
    default     = ""
    description = "Public key to be installed on the machine(s) (if any)"
}

variable "ssh_public_key_file" {
    type        = "string"
    default     = ""
    description = "Public key file to be installed on the machine(s) (if any)"
}

variable "ssh_private_key" {
    type        = "string"
    default     = ""
    description = "Private key used to connect the machine"
}

variable "ssh_private_key_file" {
    type        = "string"
    default     = ""
    description = "Private key file used to connect the machine"
}