# Assignment 2 – S3 Static Website Hosting

## Goal

Create an S3 bucket, upload an HTML/CSS website, and configure public access for static website hosting.

## 1. Create a globally unique bucket

Choose a unique bucket name, for example:

```text
yourname-week2-portfolio-2026
```

Bucket names are globally unique.

## 2. Configure the bucket

In S3:

1. Create the bucket in your chosen AWS Region.
2. Upload `website/index.html` and `website/style.css`.
3. Enable static website hosting and set:
   - Index document: `index.html`
4. Configure the bucket's public-access settings as required by your course/lab.
5. Apply the supplied `bucket-policy.json` after replacing `YOUR_BUCKET_NAME`.

> Public S3 website hosting exposes the website files to the internet. Do not upload private information.

## 3. Bucket policy

Open `bucket-policy.json` and replace:

```text
YOUR_BUCKET_NAME
```

with your actual bucket name.

Then apply it using the AWS Console, or with the AWS CLI:

```bash
aws s3api put-bucket-policy   --bucket YOUR_BUCKET_NAME   --policy file://bucket-policy.json
```

## 4. AWS CLI upload

From this folder:

```bash
aws s3 sync website/ s3://YOUR_BUCKET_NAME/ --delete
```

Verify:

```bash
aws s3 ls s3://YOUR_BUCKET_NAME/
```

## 5. Static website URL

The exact endpoint depends on your AWS Region and S3 website-hosting configuration. Use the **Properties → Static website hosting** section of the S3 bucket to copy the endpoint shown by AWS.

## Troubleshooting

### Access denied

Check:

- The bucket policy has the correct bucket name.
- The policy resource ends with `/*`.
- Public-access blocking settings match the assignment requirements.
- The website objects were uploaded successfully.

### 404 / NoSuchKey

Check that the uploaded object is exactly:

```text
index.html
```

and that it is set as the index document.

## Assignment evidence checklist

- [ ] S3 bucket created.
- [ ] `index.html` uploaded.
- [ ] `style.css` uploaded.
- [ ] Static website hosting enabled.
- [ ] Required public permissions configured.
- [ ] Website opens using the S3 website endpoint.
- [ ] Screenshot of bucket settings.
- [ ] Screenshot of the live website.
