variable "records" {
  description = <<EOF
List of Maps of the records.

name
   The name of the record.
   Modifying this attribute will force creation of a new resource.

type
    The type of the record. Available values: [A, AAAA, CAA, CNAME, TXT, SRV, LOC, MX, NS,
    SPF, CERT, DNSKEY, DS, NAPTR, SMIMEA, SSHFP, TLSA, URI, PTR, HTTPS, SVCB].
    Modifying this attribute will force creation of a new resource.

zone_id
     The zone identifier to target for the resource.
     Modifying this attribute will force creation of a new resource.

allow_overwrite
    Allow creation of this record in Terraform to overwrite an existing record, if any.
    This does not affect the ability to update the record in Terraform and does not prevent
    other resources within Terraform or manual changes outside Terraform from overwriting this record.
    This configuration is not recommended for most environments. Defaults to false.

comment
     Comments or notes about the DNS record. This field has no effect on DNS responses.

priority
    The priority of the record.

proxied
    Whether the record gets Cloudflare's origin protection.

tags
    Custom tags for the DNS record.

ttl
    The TTL of the record.

value
    The value of the record. Conflicts with data.

timeouts
    (Block, Optional) The Timeout settings.

data
     (Block List, Max: 1) Map of attributes that constitute the record value. Conflicts with value.

EOF

  type = list(object({
    name            = string
    value           = optional(string)
    type            = string
    ttl             = number
    proxied         = bool
    zone_id         = string
    allow_overwrite = optional(bool)
    priority        = optional(number)

    tags    = optional(set(string))
    comment = optional(string)

    data = optional(object({
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
    }))

    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
  default = []


  validation {
    condition     = contains(["A", "AAAA", "CNAME", "MX", "NS", "SOA", "SRV", "PTR", "CAA", "APL", "AFSDB", "DNSKEY", "CDNSKEY", "CERT", "DCHID", "DNAME", "HIP", "IPSECKEY", "LOC", "NAPTR", "NSEC", "RRSIG", "RP", "SSHFP"], var.records[0].type)
    error_message = "Valid values are."
  }

}
