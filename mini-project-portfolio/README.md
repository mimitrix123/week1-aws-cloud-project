# Mini Project – Deploy a Static Portfolio Website on AWS

## Project requirements covered

- Simple portfolio using HTML/CSS.
- Host the portfolio on an S3 bucket.
- CloudFront is optional.

## Customize before deployment

Open `index.html` and replace:

- `YOUR NAME`
- `your-email@example.com`
- `YOUR-USERNAME`
- LinkedIn placeholder

## Local test in VS Code

Open the folder in VS Code and use Live Server, or run:

```bash
python -m http.server 5500
```

Then visit:

```text
http://localhost:5500
```

## Deploy to S3 with AWS CLI

Create a unique bucket first, then:

```bash
aws s3 sync . s3://YOUR_BUCKET_NAME --exclude "README.md"
```

If you are deploying from this folder, the command uploads the portfolio files.

## Optional CloudFront

For a production-style deployment, put CloudFront in front of the S3-hosted content. CloudFront can provide CDN delivery and HTTPS. Follow the current AWS CloudFront/S3 guidance in the AWS console and documentation.

## Final submission evidence

Include:

1. GitHub repository URL.
2. Screenshot of the portfolio in VS Code.
3. Screenshot of the S3 bucket objects.
4. Screenshot of the live S3 website.
5. If using CloudFront, screenshot of the CloudFront distribution and live site.
