# IAM & S3 Hands-On Mini Project

The Week 1 mini project asks for an IAM user with specific permissions, an S3 bucket with static files, and a public-access test. fileciteturn0file0L24-L30

## Part 1 — IAM user

1. Open the AWS Management Console.
2. Open IAM.
3. Create a dedicated user for the exercise.
4. Grant only the permissions needed for the S3 exercise.
5. Enable MFA where appropriate.
6. Do not commit credentials to GitHub.

### Example least-privilege policy

The following policy is scoped to one bucket. Replace `YOUR_BUCKET_NAME` with the bucket name before use.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ListBucket",
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": "arn:aws:s3:::mimi-week1-aws-project-2026"
    },
    {
      "Sid": "ManageObjects",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::mimi-week1-aws-project-2026/*"
    }
  ]
}
```

## Part 2 — Create an S3 bucket

Choose a globally unique bucket name and create the bucket in the required AWS Region. Upload the static website files from `mini-project-portfolio/`.

Example AWS CLI commands:

```bash
aws s3 mb s3://YOUR_BUCKET_mimi-week1-aws-project-2026 --region YOUR_REGION
aws s3 sync ./mini-project-portfolio s3://mimi-week1-aws-project-2026
```

## Part 3 — Public-access test

The assignment specifically asks students to configure public access and test a bucket policy. fileciteturn0file0L24-L30

For the learning exercise only, use the S3 bucket policy in `s3-bucket-policy.json` after replacing the bucket name. Test access to the uploaded static files.

**Important:** public S3 access can expose files to the internet. After completing the test, remove the public policy and re-enable S3 Block Public Access unless public hosting is genuinely required.

## Part 4 — Verify

```bash
aws s3 ls s3://YOUR_BUCKET_NAME
aws s3 sync s3://YOUR_BUCKET_NAME ./downloaded-site
```

Confirm that the expected static files were uploaded and can be retrieved.

## Evidence to capture for your course submission

- IAM user and permission configuration screen.
- S3 bucket configuration screen.
- Uploaded static files.
- Bucket-policy configuration/test result.
- Final state showing public access disabled again, if the exercise is complete.
