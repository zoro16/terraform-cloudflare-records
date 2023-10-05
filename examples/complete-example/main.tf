provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_zone" "this" {
  name = "example.com"
}

module "this" {
  source = "../../"

  records = [
    {
      name    = "testing"
      proxied = false
      ttl     = 60
      type    = "A"
      value   = "10.10.10.10"
      zone_id = data.cloudflare_zone.this.id
    },
    {
      name    = "dev"
      proxied = false
      ttl     = 60
      type    = "A"
      value   = "10.10.10.10"
      zone_id = data.cloudflare_zone.this.id
    },
  ]
}
