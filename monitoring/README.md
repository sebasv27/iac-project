# 🚀 Cloud & DevSecOps Local Lab (Cost $0)

Este repositorio contiene un laboratorio práctico de ingeniería DevOps, Cloud e Infraestructura como Código (IaC), diseñado y ejecutado 100% de forma local en WSL2/Kali Linux a coste cero.

## 🛠 Tech Stack

* **Infraestructura como Código (IaC):** Terraform
* **Simulación Cloud (AWS):** LocalStack
* **CI/CD & DevSecOps:** GitHub Actions, Trivy Security Scanner
* **Orquestación de Contenedores:** Kubernetes (`kind`), `kubectl`
* **Observabilidad & Monitoreo:** Helm, Prometheus, Grafana
* **Entorno de Trabajo:** WSL2 (Kali Linux), Docker Desktop

---

## 📌 Proyectos Incluidos

### 1. Infraestructura como Código con Terraform & LocalStack
* Aprovisionamiento declarativo de red e infraestructura AWS simulada.
* Recuentos creados: VPC, Subred pública, Security Groups y una instancia EC2.
* Manejo de variables, proveedores locales y archivos de estado.

### 2. DevSecOps Pipeline con GitHub Actions
* Integración Continua (CI) automatizada en cada `push` o `pull request`.
* **Linting & Formato:** Validación de sintaxis con `terraform fmt` y `terraform validate`.
* **Seguridad (IaC Scanning):** Análisis estático de vulnerabilidades y configuraciones inseguras mediante **Trivy**.

### 3. Orquestación y Alta Disponibilidad en Kubernetes
* Despliegue de clúster local multiservicio usando **`kind`** (Kubernetes in Docker).
* Definición de objetos `Deployment` (3 réplicas de Nginx) y `Service` (NodePort).
* Estrategia de acceso y tunelización local mediante `port-forward`.

### 4. Monitoreo & Observabilidad con Prometheus y Grafana
* Instalación y gestión del stack mediante **Helm** (`kube-prometheus-stack`).
* Recolección de métricas en tiempo real a nivel de nodo y contenedor con Prometheus.
* Visualización gráfica de consumo de CPU, Memoria y tráfico de red en tableros de Grafana.

---

## ⚡ Guía de Ejecución Rápida

### Prerequisitos
* WSL2 con Kali Linux / Ubuntu
* Docker Desktop activo
* Terraform CLI, kubectl, kind, helm

### Despliegue Local

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/sebasv27/iac-project.git](https://github.com/sebasv27/iac-project.git)
   cd iac-project
