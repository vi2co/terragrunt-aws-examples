# Terraform and remove or comunity modules

* modules are typically git repos
* a lot of ready to use comunity modules
* git source modules allow to specify git branch, tag and the location withing repository
* ideal for the integration testing (new Terraform module can be tested in dev environments)

```
terraform init -backend-config=backends/dev.conf # init providers and modules
terraform plan -var-file="envs/dev.tfvars"
terraform apply -var-file="envs/dev.tfvars"
```

