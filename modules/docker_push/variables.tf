variable "image_name" {
  description = "Nombre completo de la imagen Docker"
  type        = string
}

variable "tag" {
  description = "Etiqueta de la imagen"
  type        = string
  default     = "latest"
}
