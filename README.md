# Terraform Blue-Green Deployment with Azure Traffic Manager

## 📌 Project Overview
This project demonstrates a Blue-Green Deployment strategy using Terraform for Azure Function Apps, orchestrated by Azure Traffic Manager. It enables zero-downtime deployments and high availability by switching traffic between two environments (Blue and Green) based on priority routing and health probe status.

---

## 🚀 What is Blue-Green Deployment?
Blue-Green Deployment is a release management strategy that maintains two identical production environments:
- **Blue**: The currently live environment serving traffic.
- **Green**: The idle environment where new changes are deployed.

🚀 How Blue-Green Deployment Works in This Project

This project provisions two Azure Function Apps:

Blue Function App: myapp-blue.azurewebsites.net

Green Function App: myapp-green.azurewebsites.net

A Traffic Manager profile sits in front of them:

Traffic Manager DNS: mybluegreentraffic.trafficmanager.net

Uses Priority Routing:

Priority 1 → Blue

Priority 2 → Green

🟢 If Blue is healthy → all traffic goes to Blue.
🔵 If Blue fails health checks → Traffic Manager redirects to Green.

### Workflow:
1. **Access Blue Directly:** Visiting the Blue URL directly sends requests to the Blue Function App.
2. **Access Green Directly:** Visiting the Green URL directly sends requests to the Green Function App.
3. **Traffic Manager Role:** Traffic Manager monitors both Blue and Green using health probes:
   - Uses **Priority Routing** (Blue = Priority 1, Green = Priority 2).
   - If Blue is healthy, all traffic goes to Blue.
   - If Blue is unhealthy (probe failure), traffic automatically shifts to Green.

> ✅ You can turn off one environment (disable or scale down) — Traffic Manager will automatically route requests to the other.

---

## 🗂️ Project Structure
```
terraform-blue-green-deployments/
├── backend.tf
├── blue/
│   ├── backend.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars          # BLUE environment-specific variables
│   └── variables.tf
├── green/
│   ├── backend.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars          # GREEN environment-specific variables
│   └── variables.tf
├── modules/
│   ├── function_app/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── trafficmanager/
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── main.tf                      # Calls the modules and handles root-level resources
├── output.tf
├── provider.tf
├── terraform.tfvars             # Root-level variables (shared configuration)
├── variables.tf
└── .gitignore
```

---

## 📝 Required `terraform.tfvars` Files Example

### Root `terraform.tfvars`:
```hcl
resource_group_name      = "blue-green-rg"
traffic_manager_name     = "blue-green-traffic-manager"
traffic_manager_dns_name = "mybluegreentraffic"
blue_app_url             = "myapp-blue.azurewebsites.net"
green_app_url            = "myapp-green.azurewebsites.net"
```

### Blue Environment `blue/terraform.tfvars`:
```hcl
function_app_name       = "myapp-blue"
storage_account_name    = "blueappstorage"
storage_account_access_key = "<YOUR_ACCESS_KEY>"
app_service_plan_name   = "blue-app-service-plan"
package_url             = "<YOUR_FUNCTION_APP_ZIP_URL>"
```

### Green Environment `green/terraform.tfvars`:
```hcl
function_app_name       = "myapp-green"
storage_account_name    = "greenappstorage"
storage_account_access_key = "<YOUR_ACCESS_KEY>"
app_service_plan_name   = "green-app-service-plan"
package_url             = "<YOUR_FUNCTION_APP_ZIP_URL>"
```

### Traffic Manager Module Variables:
Handled via root-level `terraform.tfvars`.

---

## 🛠️ How to Use

### 1️⃣ Initialize Terraform Backend:
```bash
terraform init -reconfigure
```

### 2️⃣ Plan the Deployment:
```bash
terraform plan
```

### 3️⃣ Apply the Configuration:
```bash
terraform apply -auto-approve
```

---

## 📡 How Traffic Manager Health Probes Work:
- Monitors the `/api/HttpTrigger` endpoint (or any specified path).
- Uses **HTTP or HTTPS** with configurable port and probing interval.
- If the primary endpoint (Blue) fails the health probe:
  - Traffic switches to the secondary endpoint (Green).

---

## ⚡ Considerations:
- Ensure health probes target the correct working endpoint (add query string if necessary).
- Do **NOT** commit sensitive data (e.g., storage keys) into version control.
- Use `.gitignore` for `.tfstate`, `.terraform/`, and sensitive backups.

---

## 📎 License
MIT License.

