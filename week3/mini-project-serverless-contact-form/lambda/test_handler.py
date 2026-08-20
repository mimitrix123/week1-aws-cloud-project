import json

from handler import handler


def test_valid_contact_form():
    event = {
        "requestContext": {"http": {"method": "POST"}},
        "body": json.dumps(
            {
                "name": "Mimi",
                "email": "mimi@example.com",
                "message": "Hello from the Week 3 project",
            }
        ),
    }

    result = handler(event, None)

    assert result["statusCode"] == 200
    body = json.loads(result["body"])
    assert body["message"] == "Contact form processed successfully."


def test_missing_fields():
    event = {"body": json.dumps({"name": "Mimi"})}

    result = handler(event, None)

    assert result["statusCode"] == 400
    assert "email" in json.loads(result["body"])["fields"]


def test_invalid_email():
    event = {
        "body": json.dumps(
            {"name": "Mimi", "email": "not-an-email", "message": "Hello"}
        )
    }

    result = handler(event, None)

    assert result["statusCode"] == 400


def test_invalid_json():
    result = handler({"body": "not-json"}, None)

    assert result["statusCode"] == 400


def test_options():
    result = handler({"requestContext": {"http": {"method": "OPTIONS"}}}, None)

    assert result["statusCode"] == 204
    assert result["headers"]["Access-Control-Allow-Origin"] == "*"
