Key differences between this and Jenkins:

**No External Server needed**: GitHub hosts the entire execution environment on their own Ubuntu VM (the Action Runner).

**Simplified Authentication**: You don't need to manually run docker login via command line scripts; you just pass your GitHub "Secrets" (DOCKER_USERNAME, DOCKER_PASSWORD) to standard pre-built actions.

**No Webhooks to Manage**: Because the runner lives inside GitHub's ecosystem, the pipeline natively receives the event without needing to configure or troubleshoot an external webhook.
