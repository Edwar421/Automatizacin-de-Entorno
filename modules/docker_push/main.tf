resource "null_resource" "docker_push" {
  provisioner "local-exec" {
    command = <<EOT
      docker tag automatizacion-de-entorno ${var.image_name}:${var.tag}
      docker push ${var.image_name}:${var.tag}
    EOT
  }
}
