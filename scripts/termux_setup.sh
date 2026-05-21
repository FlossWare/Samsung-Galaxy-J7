#!/data/data/com.termux/files/usr/bin/bash
# Termux Complete Setup Script
# Run this inside Termux on your phone

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   TERMUX MINI COMPUTER SETUP                             ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Update package lists
echo "📦 Step 1/6: Updating package lists..."
pkg update -y
pkg upgrade -y

echo ""
echo "✅ Packages updated!"
echo ""

# Step 2: Install essential tools
echo "🔧 Step 2/6: Installing essential tools..."
pkg install -y \
  git \
  vim \
  nano \
  curl \
  wget \
  openssh \
  htop \
  ncdu \
  tree \
  zip \
  unzip \
  rsync

echo ""
echo "✅ Essential tools installed!"
echo ""

# Step 3: Install programming languages
echo "💻 Step 3/6: Installing programming languages..."
pkg install -y \
  python \
  nodejs \
  ruby \
  php \
  golang

echo ""
echo "✅ Programming languages installed!"
echo ""

# Step 4: Install development tools
echo "🛠️  Step 4/6: Installing development tools..."
pkg install -y \
  sqlite \
  make \
  clang \
  binutils \
  man \
  nmap \
  netcat-openbsd \
  termux-api

echo ""
echo "✅ Development tools installed!"
echo ""

# Step 5: Setup storage access
echo "💾 Step 5/6: Setting up storage access..."
termux-setup-storage

# Step 6: Create directory structure
echo "📁 Step 6/6: Creating directories..."
mkdir -p ~/bin
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/downloads
mkdir -p ~/backup

echo ""
echo "✅ Directories created!"
echo ""

# Configure bash
echo "⚙️  Configuring bash..."
cat > ~/.bashrc << 'BASHRC_EOF'
# Termux Mini Computer Configuration

# Welcome message
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   Welcome to Termux Mini Computer! 🚀                    ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Get IP address
IP=$(ifconfig wlan0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d: -f2)
if [ ! -z "$IP" ]; then
    echo "📡 IP Address: $IP"
fi

# Show storage
echo "💾 Storage:"
df -h ~ | tail -1 | awk '{print "   Home: " $3 " used, " $4 " free (" $5 " used)"}'
echo ""

# Useful aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias ..='cd ..'
alias ...='cd ../..'
alias projects='cd ~/projects'
alias scripts='cd ~/scripts'
alias backup='cd ~/backup'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Quick servers
alias pyserver='python -m http.server 8000'
alias nodeserver='npx http-server'

# System info
alias sysinfo='echo "CPU:"; cat /proc/cpuinfo | grep "model name" | head -1; echo ""; echo "Memory:"; free -h; echo ""; echo "Disk:"; df -h ~'

# Functions
startserver() {
    echo "Starting HTTP server on port ${1:-8000}..."
    python -m http.server ${1:-8000}
}

startssh() {
    echo "Starting SSH server on port 8022..."
    sshd
    IP=$(ifconfig wlan0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d: -f2)
    echo "SSH server running at: ssh -p 8022 $(whoami)@$IP"
}

# Set prompt
PS1='\[\033[01;32m\]\u@termux\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

BASHRC_EOF

source ~/.bashrc

echo ""
echo "✅ Bash configured!"
echo ""

# Create useful scripts
echo "📝 Creating utility scripts..."

# System info script
cat > ~/bin/sysinfo << 'SYSINFO_EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   System Information                                     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "📱 Device Info:"
echo "   Model: $(getprop ro.product.model)"
echo "   Android: $(getprop ro.build.version.release)"
echo ""
echo "💻 CPU:"
cat /proc/cpuinfo | grep "model name" | head -1
echo ""
echo "💾 Memory:"
free -h
echo ""
echo "💿 Storage:"
df -h ~
echo ""
echo "📡 Network:"
IP=$(ifconfig wlan0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d: -f2)
echo "   IP: $IP"
echo ""
echo "📦 Packages Installed:"
pkg list-installed | wc -l | awk '{print "   " $1 " packages"}'
SYSINFO_EOF

chmod +x ~/bin/sysinfo

# Backup script
cat > ~/bin/backup-termux << 'BACKUP_EOF'
#!/data/data/com.termux/files/usr/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=~/backup
mkdir -p $BACKUP_DIR

echo "📦 Backing up Termux configuration..."
tar -czf $BACKUP_DIR/termux_backup_$DATE.tar.gz \
    ~/.bashrc \
    ~/.bash_history \
    ~/bin \
    ~/scripts \
    ~/projects

echo "✅ Backup saved to: $BACKUP_DIR/termux_backup_$DATE.tar.gz"
ls -lh $BACKUP_DIR/termux_backup_$DATE.tar.gz
BACKUP_EOF

chmod +x ~/bin/backup-termux

# Update PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

echo ""
echo "✅ Utility scripts created!"
echo ""

# Install optional packages
echo "🎨 Installing optional packages (neofetch, figlet)..."
pkg install -y neofetch figlet toilet lolcat 2>/dev/null

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   SETUP COMPLETE! 🎉                                     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "📊 Installed Packages:"
pkg list-installed | wc -l | awk '{print "   " $1 " packages installed"}'
echo ""
echo "✅ Installed:"
echo "   • Python $(python --version 2>&1 | cut -d' ' -f2)"
echo "   • Node.js $(node --version)"
echo "   • Git $(git --version | cut -d' ' -f3)"
echo "   • SSH server (sshd)"
echo ""
echo "🚀 Quick Start Commands:"
echo "   sysinfo       - Show system information"
echo "   startserver   - Start HTTP server"
echo "   startssh      - Start SSH server"
echo "   projects      - Go to projects directory"
echo "   update        - Update all packages"
echo ""
echo "📁 Directories created:"
echo "   ~/projects    - Your coding projects"
echo "   ~/scripts     - Utility scripts"
echo "   ~/bin         - Custom executables"
echo "   ~/backup      - Backups"
echo ""
echo "🔧 Next steps:"
echo "   1. Run: source ~/.bashrc"
echo "   2. Try: python --version"
echo "   3. Try: sysinfo"
echo "   4. Create a project: cd ~/projects && mkdir hello-world"
echo ""
echo "🎯 You're ready to code! Happy hacking! 🚀"
