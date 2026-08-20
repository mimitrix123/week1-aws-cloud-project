# Mini Project — Serverless Contact Form using Lambda & API Gateway

This project directly implements the Week 3 mini-project brief: a Lambda function processes form data, API Gateway exposes the endpoint, and the API can be tested with a browser or Postman. The infrastructure is defined with Terraform.

## Architecture

```text
Browser / Postman
       |
       | POST /contact
       v
Amazon API Gateway (HTTP API)
       |
       v
AWS Lambda (Python 3.12)
       |
       +--> CloudWatch Logs
```

The Lambda function validates `name`, `email`, and `message`. It returns JSON with CORS headers and logs only a safe summary. The assignment does not require persistent storage, so no database is introduced into the mini project.

## Deploy

From this directory:

```bash
cd terraform
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Copy the `contact_endpoint` output into `frontend/index.html` in place of `REPLACE_WITH_TERRAFORM_CONTACT_ENDPOINT`.

## Test with curl/Postman

```bash
curl -X POST "$(terraform output -raw contact_endpoint)" \
  -H "Content-Type: application/json" \
  -d '{"name":"Mimi","email":"mimi@example.com","message":"Hello from Week 3"}'
```

Expected response is HTTP `200` with a message confirming that the contact form was processed.

Also test validation with missing fields:

```bash
curl -X POST "$(terraform output -raw contact_endpoint)" \
  -H "Content-Type: application/json" \
  -d '{"name":"Mimi"}'
```

This should return HTTP `400`.

## Browser test

Open `frontend/index.html` locally after inserting the Terraform endpoint. Submit the form and confirm the success message appears.

## Unit tests

From the `lambda` directory:

```bash
python -m pytest
```

The tests cover valid submissions, missing fields, invalid email, invalid JSON, and CORS preflight handling.

## Monitoring

The Lambda writes logs to `/aws/lambda/week3-contact-form` with a seven-day retention period. Use CloudWatch Logs to inspect invocation output and errors.

## Cleanup

```bash
cd terraform
terraform destroy
```
