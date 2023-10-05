## Description

Terraform module to create/update Cloudflare DNS Records.




## Usage

```hcl
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_zone" "this" {
  name = "example.com"
}

module "records" {
  source = "../../"

  records = [
    {
      name    = "mail"
      proxied = false
      ttl     = 60
      type    = "A"
      value   = "10.10.10.10"
      zone_id = data.cloudflare_zone.this.id
    },
    {
      name    = "_25._tcp.mail"
      proxied = false
      ttl     = 60
      type    = "TLSA"
      zone_id = data.cloudflare_zone.this.id
      data = {
        certificate   = "T8kKkgeLqC5pi5tVfUN0Nf3vJMzb6NDAB4IBwrOHKunmCSNLHqYgrGnCUAN9SulQ"
        matching_type = 1
        selector      = 1
        usage         = 3
      }
    },
  ]
}

```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 3.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_records"></a> [records](#input\_records) | List of Maps of the records.<br><br>`name`<br>   The name of the record.<br>   Modifying this attribute will force creation of a new resource.<br><br>`type`<br>    The type of the record. Available values: [A, AAAA, CAA, CNAME, TXT, SRV, LOC, MX, NS,<br>    SPF, CERT, DNSKEY, DS, NAPTR, SMIMEA, SSHFP, TLSA, URI, PTR, HTTPS, SVCB].<br>    Modifying this attribute will force creation of a new resource.<br><br>`zone_id`<br>     The zone identifier to target for the resource.<br>     Modifying this attribute will force creation of a new resource.<br><br>`allow_overwrite`<br>    Allow creation of this record in Terraform to overwrite an existing record, if any.<br>    This does not affect the ability to update the record in Terraform and does not prevent<br>    other resources within Terraform or manual changes outside Terraform from overwriting this record.<br>    This configuration is not recommended for most environments. Defaults to false.<br><br>`comment`<br>     Comments or notes about the DNS record. This field has no effect on DNS responses.<br><br>`priority`<br>    The priority of the record.<br><br>`proxied`<br>    Whether the record gets Cloudflare's origin protection.<br><br>`tags`<br>    Custom tags for the DNS record.<br><br>`ttl`<br>    The TTL of the record.<br><br>`value`<br>    The value of the record. Conflicts with data.<br><br>`timeouts`<br>    (Block, Optional) The Timeout settings.<br><br>`data`<br>     (Block List, Max: 1) Map of attributes that constitute the record value. Conflicts with value. | <pre>list(object({<br>    name            = string<br>    value           = optional(string)<br>    type            = string<br>    ttl             = number<br>    proxied         = bool<br>    zone_id         = string<br>    allow_overwrite = optional(bool)<br>    priority        = optional(number)<br><br>    tags    = optional(set(string))<br>    comment = optional(string)<br><br>    data = optional(object({<br>      algorithm      = optional(number)<br>      altitude       = optional(number)<br>      certificate    = optional(string)<br>      content        = optional(string)<br>      digest         = optional(string)<br>      digest_type    = optional(number)<br>      fingerprint    = optional(string)<br>      flags          = optional(string)<br>      key_tag        = optional(number)<br>      lat_degrees    = optional(number)<br>      lat_direction  = optional(string)<br>      lat_minutes    = optional(number)<br>      lat_seconds    = optional(number)<br>      long_degrees   = optional(number)<br>      long_direction = optional(string)<br>      long_minutes   = optional(number)<br>      long_seconds   = optional(number)<br>      matching_type  = optional(number)<br>      name           = optional(string)<br>      order          = optional(number)<br>      port           = optional(number)<br>      precision_horz = optional(number)<br>      precision_vert = optional(number)<br>      preference     = optional(number)<br>      priority       = optional(number)<br>      proto          = optional(string)<br>      protocol       = optional(number)<br>      public_key     = optional(string)<br>      regex          = optional(string)<br>      replacement    = optional(string)<br>      selector       = optional(number)<br>      service        = optional(string)<br>      size           = optional(number)<br>      tag            = optional(string)<br>      target         = optional(string)<br>      type           = optional(number)<br>      usage          = optional(number)<br>      value          = optional(string)<br>      weight         = optional(number)<br>    }))<br><br>    timeouts = optional(object({<br>      create = optional(string)<br>      update = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
