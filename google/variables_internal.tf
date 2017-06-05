variable "_users" {
    default = {
        debian = "debian"
    }
    description = "Users for the supported OS Platforms"
}

variable "_machine_images" {
    default = {
        debian = "debian-cloud/debian-8"
    }
    description = "Machine images for the supported OS Platforms"
}

variable "_prepare_script" {
    default = {
        debian = "prepare_apt.sh"
    }
    description = "Preparation scripts for the supported OS Platforms"
}

variable "_start_config" {
    default = {
        debian = "vault.service"
    }
    description = "Startup scripts for the supported OS Platforms"
}

variable "_finish_script" {
    default = {
        debian = "finish_systemd.sh"
    }
    description = "Finish scripts for the supported OS Platforms"
}
