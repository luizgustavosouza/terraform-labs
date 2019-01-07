#!/usr/bin/env bash

terraform fmt
terraform validate
terraform plan
echo "yes" | terraform apply