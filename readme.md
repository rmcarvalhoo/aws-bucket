# Comandos
Documentação https://developer.hashicorp.com/terraform/cli/commands

### Executar as seguintes etapas para criar o bucket na AWS, os comandos abaixo foram retirados do link acima 
> terraform init
``` ************ SAIDA ESPERADA ************
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "4.65.0"...
- Installing hashicorp/aws v4.65.0...
- Installed hashicorp/aws v4.65.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

> terraform validate
``` *********** SAIDA ESPERADA ************
Success! The configuration is valid.
```

> terraform fmt

> terraform plan
``` *********** SE APARECEER O ERRO COMO O DE BAIXO É PQ ESTA FALTANDO EXPORTAR AS CREDENCIAIS AWS ************
Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.
│ 
│ Please see https://registry.terraform.io/providers/hashicorp/aws
│ for more information about providing credentials.
│ 
│ AWS Error: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, request canceled, context deadline exceeded
│ 
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on main.tf line 12, in provider "aws":
│   12: provider "aws" {
│ 
╵
```
Para exportar as credencias basta rodar os exports abaixo, Exemplo: 
```
export AWS_ACCESS_KEY_ID=<COLOCAR A SUA ACCESS KEY>
export AWS_SECRET_ACCESS_KEY=<COLOCAR A SUA ACCESS KEY SECRET>
```

> terraform plan
``` *********** SAIDA ESPERADA ************
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.first_bucket_terraform will be created
  + resource "aws_s3_bucket" "first_bucket_terraform" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "curso-terraform-cremildo"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = {
          + "managed-by" = "terraform"
          + "owner"      = "ricardo"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

> terraform apply
``` *********** SAIDA ESPERADA ************
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.first_bucket_terraform will be created
  + resource "aws_s3_bucket" "first_bucket_terraform" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "curso-terraform-cremildo"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = {
          + "managed-by" = "terraform"
          + "owner"      = "ricardo"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.first_bucket_terraform: Creating...
aws_s3_bucket.first_bucket_terraform: Creation complete after 3s [id=curso-terraform-cremildo]
```
OLHE O SEU BUCKET S3 NA CONTA DA AWS QUE ELE FOI CRIADO

> terraform destroy
``` *********** SAIDA ESPERADA ************
aws_s3_bucket.first_bucket_terraform: Refreshing state... [id=curso-terraform-cremildo]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_s3_bucket.first_bucket_terraform will be destroyed
  - resource "aws_s3_bucket" "first_bucket_terraform" {
      - arn                         = "arn:aws:s3:::curso-terraform-cremildo" -> null
      - bucket                      = "curso-terraform-cremildo" -> null
      - bucket_domain_name          = "curso-terraform-cremildo.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "curso-terraform-cremildo.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "curso-terraform-cremildo" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {
          - "managed-by" = "terraform"
          - "owner"      = "ricardo"
        } -> null

      - grant {
          - id          = "83648494baf49616b2a666b98a113b0594ade082f0bcbdc60ece6ce20eaa368b" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm = "AES256" -> null
                }
            }
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_s3_bucket.first_bucket_terraform: Destroying... [id=curso-terraform-cremildo]
aws_s3_bucket.first_bucket_terraform: Destruction complete after 1s
```
OLHE O SEU BUCKET S3 NA CONTA DA AWS QUE ELE FOI DESTRUIDO
