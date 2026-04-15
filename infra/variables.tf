variable "aws_region" {
  description = "Primary AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "ghanashyamawsportfolio"
}

variable "alert_email" {
  description = "Email for billing alerts"
  type        = string
}

variable "bedrock_model_id" {
  description = "Bedrock model ID for chatbot — Phase 2"
  type        = string
  default     = "anthropic.claude-3-haiku-20240307-v1:0"
}