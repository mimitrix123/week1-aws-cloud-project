"""AWS Lambda handler for the Week 3 serverless contact form."""

import base64
import json
import logging
from typing import Any

logger = logging.getLogger()
logger.setLevel(logging.INFO)

HEADERS = {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "content-type",
    "Access-Control-Allow-Methods": "OPTIONS,POST",
}


def response(status_code: int, body: dict[str, Any]) -> dict[str, Any]:
    return {
        "statusCode": status_code,
        "headers": HEADERS,
        "body": json.dumps(body),
    }


def parse_body(event: dict[str, Any]) -> dict[str, Any]:
    raw_body = event.get("body") or "{}"
    if event.get("isBase64Encoded"):
        raw_body = base64.b64decode(raw_body).decode("utf-8")

    payload = json.loads(raw_body)
    if not isinstance(payload, dict):
        raise ValueError("Request body must be a JSON object")
    return payload


def handler(event: dict[str, Any], context: Any) -> dict[str, Any]:
    """Validate and process a contact form request."""
    if event.get("requestContext", {}).get("http", {}).get("method") == "OPTIONS":
        return response(204, {})

    try:
        payload = parse_body(event)
    except (json.JSONDecodeError, UnicodeDecodeError, ValueError, TypeError) as exc:
        logger.warning("Invalid request body: %s", exc)
        return response(400, {"message": "Request body must be valid JSON."})

    name = str(payload.get("name", "")).strip()
    email = str(payload.get("email", "")).strip()
    message = str(payload.get("message", "")).strip()

    missing = [field for field, value in (("name", name), ("email", email), ("message", message)) if not value]
    if missing:
        return response(400, {"message": "Missing required fields.", "fields": missing})

    if "@" not in email or "." not in email.split("@")[-1]:
        return response(400, {"message": "Please provide a valid email address."})

    logger.info("Contact form received from name=%s email=%s message_length=%d", name, email, len(message))

    return response(
        200,
        {
            "message": "Contact form processed successfully.",
            "name": name,
        },
    )
