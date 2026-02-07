#!/bin/bash
set -e

echo "🚀 Setting up Containerlab environment..."

# Update package lists
sudo apt-get update

# Install basic network tools
echo "📦 Installing network utilities..."
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
echo "🔧 Installing Containerlab..."
CLAB_VERSION="0.59.0"
curl -sL https://github.com/srl-labs/containerlab/releases/download/v${CLAB_VERSION}/containerlab_${CLAB_VERSION}_linux_amd64.deb -o /tmp/containerlab.deb
sudo dpkg -i /tmp/containerlab.deb
rm /tmp/containerlab.deb

# Verify installation
echo "✅ Verifying containerlab installation..."
echo "Containerlab version:"
sudo containerlab version

# Docker is available via mounted socket, verify access
echo ""
echo "Checking Docker access via mounted socket..."
if docker ps >/dev/null 2>&1; then
    echo "✅ Docker access confirmed"
    docker --version
else
    echo "⚠️  Docker socket access may require sudo"
fi

echo ""
echo "🎉 Setup complete! You can now use 'clab' commands."
echo ""
echo "Quick start:"
echo "  sudo clab deploy -t simple-topology.yml    # Deploy a topology"
echo "  sudo clab inspect                          # Inspect running labs"
echo "  sudo clab destroy -t simple-topology.yml   # Destroy a topology"
echo ""
