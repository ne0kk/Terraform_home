locals {
      platform = "${var.project_name}-${var.vpc_name_platform}-${var.version_project}"
      db = "${var.project_name}-${var.vpc_name_db}-${var.version_project}"
}