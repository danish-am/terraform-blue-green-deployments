## 🚀 Terraform Blue-Green Deployment for Azure Function Apps Using Traffic Manager

This project implements **Blue-Green Deployment** for Azure Function Apps using **Azure Traffic Manager** to achieve zero-downtime deployments with automatic traffic routing.

---

### 📂 Project Structure

```bash
.
├── backend.tf                      # Backend configuration for Terraform state
├── main.tf                         # Root module calling other modules
├── provider.tf                     # Azure provider configuration
├── variables.tf                    # Global variables
├── terraform.tfvars                # Global variable values (resource group, TM name, etc.)
├── output.tf                       # Outputs like Traffic Manager FQDN
├── blue/                           # Blue environment configuration
│   ├── backend.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars            # Blue-specific variable values
│   └── variables.tf
├── green/                          # Green environment configuration
│   ├── backend.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars            # Green-specific variable values
│   └── variables.tf
├── modules/                        # Reusable Terraform modules
│   ├── function_app/               # Azure Function App module
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── trafficmanager/             # Azure Traffic Manager module
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
└── .gitignore                      # Ignore tfstate, backups, .terraform dir
```

---

## 🌱 Prerequisites

- Azure Subscription
- Terraform v1.3+
- Azure CLI configured (`az login`)
- Azure Storage Account and containers for remote backend state

---

## ⚙️ `terraform.tfvars` Explanation

| Location           | Purpose                                  | Required Values                         |
|--------------------|------------------------------------------|------------------------------------------|
| `terraform.tfvars` (root)        | Global values for Traffic Manager and Resource Group | `resource_group_name`, `traffic_manager_name`, `traffic_manager_dns_name`, `blue_app_url`, `green_app_url` |
| `blue/terraform.tfvars`          | Blue environment config        | `resource_group_name`, `location`, `storage_account_name`, `storage_account_access_key`, `function_app_name`, `app_service_plan_name`, `package_url` |
| `green/terraform.tfvars`         | Green environment config       | Same as blue, but with green-specific values |
| `modules/trafficmanager/variables.tf` | Handles Traffic Manager settings | Values are passed from the root module via `main.tf` |

✅ **Example for root `terraform.tfvars`:**
```hcl
resource_group_name      = "blue-green-rg"
traffic_manager_name     = "blue-green-traffic-manager"
traffic_manager_dns_name = "mybluegreentraffic"
blue_app_url             = "myapp-blue.azurewebsites.net"
green_app_url            = "myapp-green.azurewebsites.net"
```

---

## 🏗️ Step-by-Step Deployment Guide

### 1️⃣ Initialize Backend and Providers
```bash
terraform init -reconfigure
```

### 2️⃣ Plan the Deployment
```bash
terraform plan
```

### 3️⃣ Apply the Deployment
```bash
terraform apply -auto-approve
```

---

## 🎯 Deployment Flow

1. **Provision Blue Environment:**
   - Deploys the Azure Function App in Blue slot.
   - Uses `blue/terraform.tfvars`.

2. **Provision Green Environment:**
   - Deploys the Azure Function App in Green slot.
   - Uses `green/terraform.tfvars`.

3. **Traffic Manager:**
   - Sets up Priority-based routing.
   - Routes to Blue by default (priority 1), Green as backup (priority 2).
   - Health checks configured via `monitor_config`.

---

## ⚠️ Health Probe Notes

> The Function App’s default HTTP trigger requires the query parameter `?name=xyz`.  
> Traffic Manager probes **cannot** send this parameter, so the health probe fails unless the endpoint allows a blank query.  
> You may either:
> - Adjust your function code to allow blank requests.
> - Or enable **Always Serve** at Traffic Manager endpoint level to bypass health checks.

---

## 📤 Cleanup

```bash
terraform destroy -auto-approve
```
