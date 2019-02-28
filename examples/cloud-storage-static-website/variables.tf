# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to host the site in."
}

variable "website_domain_name" {
  description = "The name of the website and the Cloud Storage bucket to create (e.g. static.foo.com)."
}

variable "create_dns_entry" {
  description = "If set to true, create a DNS A Record in loud DNS with the domain name in var.website_domain_name."
}

variable "dns_managed_zone_name" {
  description = "The name of the Cloud DNS Managed Zone in which to create the DNS A Record specified in var.website_domain_name. Only used if var.create_dns_entry is true."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "dns_record_ttl" {
  description = "The time-to-live fir the site CNAME record set (seconds)"
  default     = 60
}

variable "website_location" {
  description = "Location of the bucket that will store the static website. Once a bucket has been created, its location can't be changed. See https://cloud.google.com/storage/docs/bucket-locations"
  default     = "US"
}

variable "enable_versioning" {
  description = "Set to true to enable versioning. This means the website bucket will retain all old versions of all files. This is useful for backup purposes (e.g. you can rollback to an older version), but it may mean your bucket uses more storage."
  default     = false
}

variable "index_page" {
  description = "Bucket's directory index"
  default     = "index.html"
}

variable "not_found_page" {
  description = "The custom object to return when a requested resource is not found"
  default     = "404.html"
}

variable "force_destroy_website" {
  description = "If set to true, this will force the delete of the website bucket when you run terraform destroy, even if there is still content in it. This is only meant for testing and should not be used in production."
  default     = false
}

variable "force_destroy_access_logs_bucket" {
  description = "If set to true, this will force the delete of the access logs bucket when you run terraform destroy, even if there is still content in it. This is only meant for testing and should not be used in production."
  default     = false
}
