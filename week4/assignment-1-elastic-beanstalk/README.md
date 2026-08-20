# Assignment 1 — Elastic Beanstalk

This assignment implements automatic deployment of a small Flask application using AWS Elastic Beanstalk.

## Files

- `application.py` — Flask application
- `requirements.txt` — runtime dependency
- `Procfile` — Gunicorn startup command
- `Dockerrun.aws.json.example` — optional container reference

## Deploy with EB CLI

```bash
eb init -p python-3.12 week4-beanstalk-app --region ap-south-1
eb create week4-beanstalk-env
eb deploy
eb open
```

If the selected platform is unavailable in the account/region, choose the current supported Python platform shown by `eb init`.

## Verify

- `/` returns the application page.
- `/health` returns JSON with status `ok`.

## Cleanup

```bash
eb terminate week4-beanstalk-env
```

Do not commit AWS credentials or `.elasticbeanstalk` secrets.