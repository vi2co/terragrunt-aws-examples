# Terraform: multiple environments and mutiple backends
```
terraform init -backend-config=backends/dev.conf # initialize the backend
terraform plan -var-file="envs/dev.tfvars"
terraform apply -var-file="envs/dev.tfvars" # apply changes for dev environment  
```

