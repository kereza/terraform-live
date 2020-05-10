 # PDFPRINT
 resource "aws_instance" "pdfprint_tfcloud" {
     count = 1
     instance_type           = "r5.xlarge"
     ami                     = "ami-0a66e857c49223ad4"
     key_name                = "dev"
     vpc_security_group_ids  = ["sg-075152b4567538a03"]
     subnet_id               = "subnet-0d5930db6c19999ef"
     ebs_optimized           = "true"
     iam_instance_profile    = "dev-default"
     root_block_device {
         volume_type = "gp2"
         volume_size = "40"
         delete_on_termination = true
         encrypted             = true
     }

#     tags = "${merge(local.tags, var.instance_pdfprint_tags, map("Name", format("%s-%s", data.                       terraform_remote_state.vpc.env, var.instance_pdfprint_name)))}"
#     volume_tags = "${merge(local.tags, var.instance_qlik_tags)}"
 }

