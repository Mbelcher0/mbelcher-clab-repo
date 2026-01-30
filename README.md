# Containerlab Topologies

A collection of network lab topologies using [Containerlab](https://containerlab.dev).

## 🚀 Quick Start with DevPod

This repository is configured with a devcontainer for easy development with DevPod.

### Prerequisites
- DevPod installed
- SSH provider configured (pointing to a host with Docker)
- Docker running on the host

### Getting Started

1. **Open in DevPod**:
   - Enter workspace source: `https://github.com/Mbelcher0/mbelcher-clab-repo`
   - Select SSH provider
   - Choose VSCode as IDE

2. **Wait for setup**: The devcontainer will automatically install containerlab and tools (2-3 minutes)

3. **Deploy a topology**:
```bash
   sudo clab deploy -t simple-topology.yml
```

4. **Inspect running labs**:
```bash
   sudo clab inspect
```

5. **Connect to a node**:
```bash
   docker exec -it clab-simple-lab-node1 sh
```

6. **Test connectivity**:
```bash
   docker exec -it clab-simple-lab-node1 ping 10.0.0.2
```

7. **Destroy the topology**:
```bash
   sudo clab destroy -t simple-topology.yml
```

## 📁 Repository Structure
```
.
├── .devcontainer/
│   ├── devcontainer.json        # DevPod/VSCode devcontainer config
│   └── setup-containerlab.sh    # Automated setup script
├── simple-topology.yml          # Sample 2-node topology
├── .gitignore                   # Ignore generated files
└── README.md                    # This file
```

## 🧪 Available Topologies

### Simple Lab (simple-topology.yml)
- 2 Alpine Linux nodes
- Direct connection
- Perfect for testing connectivity

## 🛠️ Common Commands
```bash
# Deploy a topology
sudo clab deploy -t <topology-file.yml>

# List running labs
sudo clab inspect

# Destroy a topology
sudo clab destroy -t <topology-file.yml>

# Destroy all topologies
sudo clab destroy --all

# Save running configs
sudo clab save -t <topology-file.yml>

# Generate graph
sudo clab graph -t <topology-file.yml>
```

## 📚 Adding Network Vendor Images

To use vendor network operating systems (e.g., Cisco, Arista, Juniper):

1. Import container images to your Docker host
2. Reference them in topology files

Example for Arista cEOS:
```yaml
nodes:
  router1:
    kind: ceos
    image: ceos:latest
```

See [Containerlab documentation](https://containerlab.dev/manual/kinds/) for supported kinds.

## 🔒 Security Note

This is a public repository. **Never commit**:
- Real network credentials
- Production IP addresses or hostnames
- Vendor license files
- Sensitive configuration details

Use generic examples and RFC1918 addressing.

## 📖 Resources

- [Containerlab Documentation](https://containerlab.dev)
- [Containerlab GitHub](https://github.com/srl-labs/containerlab)
- [Network Device Container Images](https://containerlab.dev/manual/vrnetlab/)

## 🤝 Contributing

Feel free to submit topology examples via pull requests!

## 📝 License

MIT License - feel free to use and modify for your own labs.
