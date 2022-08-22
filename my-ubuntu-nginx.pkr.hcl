source "yandex" "ubuntu-nginx" {
  token               = "<мой OAuth токен>"
  folder_id           = "<id каталога, например, id каталога default>"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "my-ubuntu-nginx"
  subnet_id           = "<id подсети, которая находится в зоне доступности zone-в данном случае, в ru-central1-a>"
  disk_type           = "network-ssd"
  zone                = "ru-central1-a"
}
 
build {
  sources = ["source.yandex.ubuntu-nginx"]
 
  provisioner "shell" {
    inline = ["sudo apt-get update -y", 
              "sudo apt-get install -y nginx", 
              "sudo systemctl enable nginx.service"
             ]
  }
}