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
