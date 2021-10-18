terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }

  }
}
# cat ~/yacloudtoken
#or we can use variables from vault https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret
provider "yandex" {
  token     = "AQAAAAAkMxbmAATuwcEXbph6HUqEka330i2YJ78"
  cloud_id  = "b1gkpdskotsvk9pr650f"
  folder_id = "b1go36ct25tsipj5hm4k"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name                      = "web"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8uic3g6hoea6qc52d7"
    }
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    #ip_address = "10.10.11.1"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name                      = "mysql"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8uic3g6hoea6qc52d7"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    #ip_address = "10.10.11.2"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.10.11.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}