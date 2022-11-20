init:
	aws-vault exec my-aws-account -- terraform init

apply:
	aws-vault exec my-aws-account -- terraform apply
