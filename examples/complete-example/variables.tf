variable "cloudflare_api_token" {
  description = "Cloudflare API Token."
  type        = string
  sensitive   = true
}
variable "zone_id" {
  description = "Cloudflare DNS Zone ID."
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The main domain name to be used."
  type        = string
  default     = null
}

variable "records" {
  description = "List of Maps of the records"
  type = list(object({
    name            = string
    value           = optional(string)
    type            = string
    ttl             = number
    proxied         = bool
    allow_overwrite = optional(bool)
    priority        = optional(number)
    data = optional(list(object({
      algorithm      = optional(number)
      altitude       = optional(number)
      certificate    = optional(string)
      content        = optional(string)
      digest         = optional(string)
      digest_type    = optional(number)
      fingerprint    = optional(string)
      flags          = optional(string)
      key_tag        = optional(number)
      lat_degrees    = optional(number)
      lat_direction  = optional(string)
      lat_minutes    = optional(number)
      lat_seconds    = optional(number)
      long_degrees   = optional(number)
      long_direction = optional(string)
      long_minutes   = optional(number)
      long_seconds   = optional(number)
      matching_type  = optional(number)
      name           = optional(string)
      order          = optional(number)
      port           = optional(number)
      precision_horz = optional(number)
      precision_vert = optional(number)
      preference     = optional(number)
      priority       = optional(number)
      proto          = optional(string)
      protocol       = optional(number)
      public_key     = optional(string)
      regex          = optional(string)
      replacement    = optional(string)
      selector       = optional(number)
      service        = optional(string)
      size           = optional(number)
      tag            = optional(string)
      target         = optional(string)
      type           = optional(number)
      usage          = optional(number)
      value          = optional(string)
      weight         = optional(number)
    })))
  }))
  default = []
}
