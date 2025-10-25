variable "use_case_name_short" {
    description = "A short name for the use case, used as a prefix for resource names."
    type        = string  
}

variable "repository_name" {
    description = "The name of the repository, used as part of the S3 bucket name."
    type        = string  
}
