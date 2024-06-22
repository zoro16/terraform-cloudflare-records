output "records" {
  description = <<EOF
Records output:

    * `created_on` (String) The RFC3339 timestamp of when the record was created.
    * `hostname` (String) The FQDN of the record.
    * `id` (String) The ID of this resource.
    * `metadata` (Map of String) A key-value map of string metadata Cloudflare associates with the record.
        ** `auto_added` (Boolean)
        ** `managed_by_apps` (Boolean)
        ** `managed_by_argo_tunnel` (Boolean)

    * `modified_on` (String) The RFC3339 timestamp of when the record was last modified.
    * `proxiable` (Boolean) Shows whether this record can be proxied.
EOF
  value = {
    for k, v in cloudflare_record.this :
    format("%s_[%s]", v.name, k) => {
      "id"          = v.id
      "created_on"  = v.created_on
      "modified_on" = v.modified_on
      "proxiable"   = v.proxiable
      "hostname"    = v.hostname
      "metadata" = {
        "auto_added"             = tobool(v.metadata.auto_added)
        "managed_by_apps"        = tobool(v.metadata.managed_by_apps)
        "managed_by_argo_tunnel" = tobool(v.metadata.managed_by_argo_tunnel)
      }
    }

  }
}
