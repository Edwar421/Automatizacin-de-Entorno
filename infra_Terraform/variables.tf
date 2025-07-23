variable "image_name" {
  type        = string
  description = "Nombre de la imagen Docker"
}

variable "tag" {
  type        = string
  default     = "latest"
}
