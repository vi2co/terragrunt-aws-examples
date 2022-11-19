# Terraform and local modules
```
terraform init -backend-config=backends/dev.conf # init providers and modules
terraform plan -var-file="envs/dev.tfvars"
terraform apply -var-file="envs/dev.tfvars"
```

