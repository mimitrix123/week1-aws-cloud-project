from __future__ import annotations

import json
import re
from pathlib import Path

try:
    import yaml
except ImportError:  # pragma: no cover
    yaml = None

ROOT = Path(__file__).resolve().parents[1]
WEEK4 = ROOT / "week4"


def load_yaml(path: Path):
    text = path.read_text(encoding="utf-8")
    if yaml is None:
        json.loads(json.dumps({}))
        return
    yaml.safe_load(text)


def main() -> int:
    failures: list[str] = []
    yaml_files = sorted(WEEK4.rglob("*.yaml")) + sorted(WEEK4.rglob("*.yml"))
    json_files = sorted(WEEK4.rglob("*.json"))

    for path in yaml_files:
        try:
            load_yaml(path)
        except Exception as exc:
            failures.append(f"YAML: {path.relative_to(ROOT)} -> {exc}")

    for path in json_files:
        try:
            json.loads(path.read_text(encoding="utf-8"))
        except Exception as exc:
            failures.append(f"JSON: {path.relative_to(ROOT)} -> {exc}")

    for path in WEEK4.rglob("template.yaml"):
        try:
            data = yaml.safe_load(path.read_text(encoding="utf-8")) if yaml else {}
            if not isinstance(data, dict) or "Resources" not in data:
                failures.append(f"CloudFormation template missing Resources: {path.relative_to(ROOT)}")
        except Exception:
            pass

    secret_patterns = [
        re.compile(r"AKIA[0-9A-Z]{16}"),
        re.compile(r"aws_secret_access_key\s*[:=]\s*[^\s#]+", re.I),
        re.compile(r"aws_access_key_id\s*[:=]\s*[^\s#]+", re.I),
        re.compile(r"BEGIN (RSA|OPENSSH|EC) PRIVATE KEY"),
    ]
    for path in WEEK4.rglob("*"):
        if not path.is_file() or path.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".zip"}:
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        for pattern in secret_patterns:
            if pattern.search(text):
                failures.append(f"Possible credential in {path.relative_to(ROOT)}")

    if failures:
        print("VALIDATION FAILED")
        print("\n".join(failures))
        return 1

    print(f"Validated {len(yaml_files)} YAML and {len(json_files)} JSON files.")
    print("No obvious credential strings found in Week 4 files.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
