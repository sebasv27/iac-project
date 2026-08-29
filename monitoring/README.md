# Proyecto 4: Monitoreo y Observabilidad con Prometheus y Grafana

## Componentes
- **Prometheus**: Recolección de métricas de nodos y pods en el clúster local de Kubernetes (kind creates and manages local Kubernetes clusters using Docker container 'nodes'

Usage:
  kind [command]

Available Commands:
  build       Build one of [node-image]
  completion  Output shell completion code for the specified shell (bash, zsh or fish)
  create      Creates one of [cluster]
  delete      Deletes one of [cluster]
  export      Exports one of [kubeconfig, logs]
  get         Gets one of [clusters, nodes, kubeconfig]
  help        Help about any command
  load        Loads images into nodes
  version     Prints the kind CLI version

Flags:
  -h, --help              help for kind
  -q, --quiet             silence all stderr output
  -v, --verbosity int32   info log verbosity, higher value produces more output
      --version           version for kind

Use "kind [command] --help" for more information about a command.).
- **Grafana**: Dashboards visuales para consumo de CPU, Memoria y red.
- **Helm**: Gestión del despliegue mediante `kube-prometheus-stack`.

## Comandos de despliegue
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring
```

## Acceso a Grafana
```bash
kubectl port-forward -n monitoring svc/prometheus-stack-grafana 3000:80
```
