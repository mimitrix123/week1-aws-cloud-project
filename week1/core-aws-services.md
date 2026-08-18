# Core AWS Services — Summary Report

## 1. Amazon EC2

Amazon EC2 provides virtual servers that can be used to run applications and other workloads. Users can select compute resources and configure the environment needed by an application.

**Typical use:** hosting web applications, APIs, development environments, and other server-based workloads.

## 2. Amazon S3

Amazon S3 is an object storage service. It stores files as objects in buckets and is commonly used for static files, backups, media, and website assets.

**Typical use:** storing documents, images, static website files, and backups.

## 3. Amazon RDS

Amazon RDS is a managed relational database service. It simplifies common database administration tasks so developers can focus on applications and data.

**Typical use:** applications that require a relational database such as PostgreSQL, MySQL, or other supported engines.

## 4. AWS Lambda

AWS Lambda is a serverless compute service that runs code in response to events. The service manages the underlying compute infrastructure for the function.

**Typical use:** event-driven processing, APIs, automation, scheduled jobs, and lightweight backend functions.

## Quick comparison

| Service | Main purpose | Server management |
|---|---|---|
| EC2 | Virtual compute | Customer manages the guest OS and workload |
| S3 | Object storage | AWS manages storage infrastructure |
| RDS | Relational databases | AWS manages much of the database infrastructure |
| Lambda | Event-driven serverless compute | AWS manages the execution infrastructure |
