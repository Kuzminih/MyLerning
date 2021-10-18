# terraform
[Install terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli
)\
Create main.tf
```
 terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = "$YATOKEN" 
  cloud_id  = "$CLOUDID"
  folder_id = "$FOLDERID"
  zone      = "$ZONE"
}
```
export [YATOKEN=](https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token)\
export CLOUDID= from cloud.yandex.ru\
export FOLDERID= from cloud.yandex.ru\
export [ZONE=](https://cloud.yandex.ru/docs/overview/concepts/geo-scope)\
We can use file with variables and [vault](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) to storage secrets

"main.tf" It is our main file, which contains authorization to the cloud and instructions for the provider.
Let's go through authorization\

 teraform init

Next we will be configure our VM in cloud from [yandex cloud manuals](https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart#configure-terraform)\

First i'm wil be using without variables file.\
for image_id i'm using yandex [cli](https://cloud.yandex.ru/docs/cli/quickstart)
yc compute image list --folder-id standard-images

then i'm create hosts.yml file, with parse variables from json terraform state file 
