#!/bin/bash
set -e

echo "Setting up Containerlab environment..."

# Update package lists
sudo apt-get update

# Install basic network tools
echo "Installing network utilities..."
sudo apt-get install -y \
    iputils-ping \
    traceroute \
    curl \
    wget \
    vim \
    jq \
    net-tools \
    tcpdump \
    iproute2

# Install containerlab
echo "Installing Containerlab..."
CLAB_VERSION="0.59.0"
curl -sL https://github.com/srl-labs/containerlab/releases/download/v${CLAB_VERSION}/containerlab_${CLAB_VERSION}_linux_amd64.deb -o /tmp/containerlab.deb
sudo dpkg -i /tmp/containerlab.deb
rm /tmp/containerlab.deb

# Verify installation
echo "Verifying installations..."
echo "Containerlab version:"
sudo containerlab version

echo "Docker version:"
docker --version

echo ""
echo "Setup complete! You can now use 'clab' commands."
echo ""
echo "Quick start:"
echo "  clab deploy -t topology.yml    # Deploy a topology"
echo "  clab inspect                   # Inspect running labs"
echo "  clab destroy -t topology.yml   # Destroy a topology"
echo ""
EOF

chmod +x .devcontainer/setup-containerlab.sh
