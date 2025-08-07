# Automated Multi-Node Linux Configuration with Ansible

## 📘 Project Description

This project demonstrates how to automate multi-node configuration using **Ansible** on **DigitalOcean droplets**. A control node is configured to manage three managed nodes (Ubuntu servers), performing tasks like service checks, group/user management, file backups, and remote script execution across the fleet — all from a single playbook or ad-hoc Ansible commands.

## 🧰 Tools & Technologies

- **Ansible 2.18**
- **Ubuntu 22.04 LTS** (control + 3 managed nodes)
- **DigitalOcean** (infrastructure)
- **Bash Scripts** (e.g., `/etc` backup)
- **Python 3.13**
- **Systemd Services (NGINX, SSH)**

## 🛠️ Project Setup

### Step 1: Infrastructure

Provisioned 4 Ubuntu droplets on DigitalOcean:
- `control-node`: 165.22.190.1
- `node1`: 137.184.29.1
- `node2`: 68.183.99.33
- `node3`: <your node3 IP>

<img width="1728" height="487" alt="Screenshot 2025-08-07 at 5 29 01 AM" src="https://github.com/user-attachments/assets/18b90aac-1f68-4081-bde7-c1b9f06b55de" />


### Step 2: SSH Access

- Configured SSH keys for passwordless access.
- Verified Ansible connectivity with:
  ```bash
  ansible -i inventory.ini all -m ping
  ```

## 📂 Inventory File

```ini
[servers]
node1 ansible_host=137.184.29.1
node2 ansible_host=68.183.99.33
node3 ansible_host=<your node3 IP>
```

## ⚙️ Ansible Commands Used

### 🔐 Create user `toor` and add to `sudo` + custom `managers` group
```bash
ansible -i inventory.ini servers -m user -a "name=toor groups=sudo,managers append=yes" -b
```

### 👥 Validate Group & User Membership
```bash
ansible -i inventory.ini servers -m shell -a "getent group managers" -b
ansible -i inventory.ini servers -m shell -a "id toor" -b
```

### 📦 Check and Manage Services (SSH, NGINX)
```bash
ansible -i inventory.ini servers -m shell -a "systemctl status ssh | head -n 5" -b
ansible -i inventory.ini servers -m service -a "name=nginx enabled=yes" -b
```

### 💾 Run Remote Backup Script
```bash
ansible -i inventory.ini servers -m script -a "scripts/backup_etc.sh" -b
```

## 📋 Lessons Learned

- Handling Python interpreter discovery warnings in Ansible.
- Troubleshooting locked APT processes across nodes.
- Running shell scripts remotely on all nodes.
- Managing users and groups efficiently at scale.
- Reliable service management through Ansible modules.

## 🧠 Next Steps

- Implement full playbook automation instead of ad-hoc commands.
- Add monitoring (e.g., Prometheus, Grafana).
- Apply hardening roles (e.g., UFW, fail2ban).
- Auto-backup to remote S3 bucket.

## 👤 Author

**Gabriel Eweka**  
Cloud | DevOps | Security  
[LinkedIn Profile](https://www.linkedin.com/in/gabriel-eweka)
