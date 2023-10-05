resource "cloudflare_record" "this" {

  for_each = {
    for index, value in var.records : index => value
  }

  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = each.value.ttl
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
  priority        = each.value.priority
  zone_id         = each.value.zone_id
  tags            = each.value.tags
  comment         = each.value.comment

  dynamic "data" {
    for_each = each.value.data != null ? [1] : []

    content {
      algorithm      = each.value.data.algorithm
      altitude       = each.value.data.altitude
      certificate    = each.value.data.certificate
      content        = each.value.data.content
      digest         = each.value.data.digest
      digest_type    = each.value.data.digest_type
      fingerprint    = each.value.data.fingerprint
      flags          = each.value.data.flags
      key_tag        = each.value.data.key_tag
      lat_degrees    = each.value.data.lat_degrees
      lat_direction  = each.value.data.lat_direction
      lat_minutes    = each.value.data.lat_minutes
      lat_seconds    = each.value.data.lat_seconds
      long_degrees   = each.value.data.long_degrees
      long_direction = each.value.data.long_direction
      long_minutes   = each.value.data.long_minutes
      long_seconds   = each.value.data.long_seconds
      matching_type  = each.value.data.matching_type
      name           = each.value.data.name
      order          = each.value.data.order
      port           = each.value.data.port
      precision_horz = each.value.data.precision_horz
      precision_vert = each.value.data.precision_vert
      preference     = each.value.data.preference
      priority       = each.value.data.priority
      proto          = each.value.data.proto
      protocol       = each.value.data.protocol
      public_key     = each.value.data.public_key
      regex          = each.value.data.regex
      replacement    = each.value.data.replacement
      selector       = each.value.data.selector
      service        = each.value.data.service
      size           = each.value.data.size
      tag            = each.value.data.tag
      target         = each.value.data.target
      type           = each.value.data.type
      usage          = each.value.data.usage
      value          = each.value.data.value
      weight         = each.value.data.weight
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [1] : []

    content {
      create = each.value.timeouts.create
      update = each.value.timeouts.update
    }
  }

}
