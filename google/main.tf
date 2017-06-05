resource "google_compute_instance" "default" {
    name         = "${var.machine_name}"
    machine_type = "${var.machine_type}"
    zone         = "${var.region_zone}"
    tags         = "${var.machine_tags}"

    disk {
        image = "${lookup(var._machine_images, var.platform)}"
    }

    network_interface {
        network = "${var.network}"

        access_config {
            # Ephemeral
        }
    }

    metadata {
        ssh-keys = "${ trimspace(var.ssh_public_key != "" ? format("%s:%s", lookup(var._users, var.platform), var.ssh_public_key) : var.ssh_public_key_file != "" ? format("%s:%s", lookup(var._users, var.platform), file(var.ssh_public_key_file == "" ? format("%s/%s", path.module, "files/dummy_public_key") : var.ssh_public_key_file)) : "") }"
    }

    connection {
        type = "ssh"
        user = "${lookup(var._users, var.platform)}"
        private_key = "${ trimspace(var.ssh_private_key != "" ? var.ssh_private_key : var.ssh_private_key_file != "" ? file(var.ssh_private_key_file == "" ? format("%s/%s", path.module, "files/dummy_private_key") : var.ssh_private_key_file) : "") }"
    }

    provisioner "file" {
        content     = "${ var.vault_config != "" ? var.vault_config : file(var.vault_config_file == "" ? "${path.module}/../shared/vault.hcl" : var.vault_config_file) }"
        destination = "/tmp/vault.hcl"
    }

    provisioner "file" {
        source      = "${path.module}/../shared/startup/${lookup(var._start_config, var.platform)}"
        destination = "/tmp/${lookup(var._start_config, var.platform)}"
    }

    provisioner "remote-exec" {
        inline = [
            "echo ${var.vault_version} > /tmp/vault-version",
        ]
    }

    provisioner "remote-exec" {
        scripts = [
            "${path.module}/../shared/scripts/${lookup(var._prepare_script, var.platform)}",
            "${path.module}/../shared/scripts/install.sh",
            "${path.module}/../shared/scripts/${lookup(var._finish_script, var.platform)}",
        ]
    }
}
