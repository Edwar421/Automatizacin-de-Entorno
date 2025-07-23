module "docker_push" {
  source     = "../modules/docker_push"
  image_name = var.image_name
  tag        = var.tag
}
