```
terraform init -backend-config=backends/dev.conf
terraform plan -var-file="envs/dev.tfvars"
terraform apply -var-file="envs/dev.tfvars"
```

