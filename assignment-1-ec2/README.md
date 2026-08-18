# Assignment 1 – Launch and Configure an EC2 Instance

## Goal

Launch an Ubuntu EC2 server, install Apache, and host a simple website.

## 1. Create the EC2 instance

In the AWS Console:

1. Open **EC2 → Instances → Launch instance**.
2. Choose an Ubuntu Server AMI.
3. Select a small instance type suitable for your course/lab.
4. Create or select a key pair and download the `.pem` file.
5. In the security group, allow:
   - SSH: TCP 22 from **your IP only**
   - HTTP: TCP 80 from `0.0.0.0/0`
6. Launch the instance.
7. Copy the instance public IPv4 address.

## 2. Connect using SSH

From a terminal in the directory containing your key:

### Linux/macOS/Git Bash

```bash
chmod 400 your-key.pem
ssh -i your-key.pem ubuntu@YOUR_EC2_PUBLIC_IP
```

For Ubuntu EC2 images, the default user is commonly `ubuntu`.

## 3. Install Apache

After connecting:

```bash
sudo apt update
sudo apt install -y apache2
sudo systemctl enable --now apache2
```

Check:

```bash
systemctl status apache2
```

Then open:

```text
http://YOUR_EC2_PUBLIC_IP
```

## 4. Deploy the supplied website

From your local machine, copy the website files:

```bash
scp -i your-key.pem website/index.html ubuntu@YOUR_EC2_PUBLIC_IP:/tmp/index.html
scp -i your-key.pem website/style.css ubuntu@YOUR_EC2_PUBLIC_IP:/tmp/style.css
```

SSH back into the server and run:

```bash
sudo cp /tmp/index.html /var/www/html/index.html
sudo cp /tmp/style.css /var/www/html/style.css
sudo chown -R www-data:www-data /var/www/html
```

Refresh the browser.

## Faster option

You can also upload the entire site and copy it into Apache's document root:

```bash
scp -i your-key.pem -r website ubuntu@YOUR_EC2_PUBLIC_IP:/tmp/
ssh -i your-key.pem ubuntu@YOUR_EC2_PUBLIC_IP
sudo cp -r /tmp/website/. /var/www/html/
```

## Assignment evidence checklist

- [ ] EC2 instance is running.
- [ ] Ubuntu server is selected.
- [ ] SSH connection works.
- [ ] Apache is installed and running.
- [ ] Port 80 is allowed in the security group.
- [ ] Website opens using the EC2 public IP.
- [ ] Screenshot of EC2 instance details.
- [ ] Screenshot of the website in a browser.

## Cleanup

When finished with the lab, stop or terminate the instance according to your course instructions to avoid unnecessary charges.
