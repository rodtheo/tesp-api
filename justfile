tesp_run:
    docker compose --profile pulsar up --build

tesp_stop:
    docker compose --profile pulsar down

tesp_example_readme_02:
    #!/usr/bin/bash
    curl http://localhost:8080/v1/tasks \
    -X POST -H "Content-Type: application/json" \
    -d '{
        "inputs": [
            {
            "url": "http://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.5.tar.xz",
            "path": "/data/kernel.tar.gz",
            "type": "FILE"
            }
        ],
        "outputs": [
            {
            "url": "http://service-http:5000/upload",
            "path": "/tmp/stdout.log",
            "type": "FILE"
            },
            {
            "url": "http://service-http:5000/upload",
            "path": "/tmp/stderr.log",
            "type": "FILE"
            }
        ],
        "executors": [
            {
            "image": "ubuntu:20.04",
            "command": [
                "/bin/sha1sum",
                "./kernel.tar.gz"
            ],
            "workdir": "/data/",
            "stdout": "/tmp/stdout.log",
            "stderr": "/tmp/stderr.log"
            }
        ],
        "volumes": [
            "/data"
        ]
    }'

tesp_example_basic_auth:
    #!/usr/bin/bash
    curl -v -u admin:adminadmin http://localhost:8080/v1/tasks \
    -X POST -H "Content-Type: application/json" \
    -d '{
        "inputs": [
            {
            "url": "http://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.5.tar.xz",
            "path": "/data/kernel.tar.gz",
            "type": "FILE"
            }
        ],
        "outputs": [
            {
            "url": "http://service-http:5000/upload",
            "path": "/tmp/stdout.log",
            "type": "FILE"
            },
            {
            "url": "http://service-http:5000/upload",
            "path": "/tmp/stderr.log",
            "type": "FILE"
            }
        ],
        "executors": [
            {
            "image": "ubuntu:20.04",
            "command": [
                "/bin/sha1sum",
                "./kernel.tar.gz"
            ],
            "workdir": "/data/",
            "stdout": "/tmp/stdout.log",
            "stderr": "/tmp/stderr.log"
            }
        ],
        "volumes": [
            "/data"
        ]
    }'

tesp_example_readme:
    #!/usr/bin/bash
    curl http://localhost:8080/v1/tasks \
    -X POST -H "Content-Type: application/json" \
    -d '{
        "inputs": [
            {
            "url": "http://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.5.tar.xz",
            "path": "/data/kernel.tar.gz",
            "type": "FILE"
            }
        ],
        "executors": [
            {
            "image": "ubuntu:20.04",
            "command": [
                "/bin/sha1sum",
                "./kernel.tar.gz"
            ],
            "workdir": "/data/",
            "stdout": "/data/stdout.log",
            "stderr": "/data/stderr.log"
            }
        ],
        "volumes": [
            "/data"
        ]
    }'

tesp_example_webdav:
    #!/usr/bin/bash
    curl -v -u admin:adminadmin http://localhost:8080/v1/tasks \
    -X POST -H "Content-Type: application/json" \
    -d '{
        "inputs": [
            {
            "url": "http://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.5.tar.xz",
            "path": "/data/kernel.tar.gz",
            "type": "FILE"
            }
        ],
        "outputs": [
            {
            "url": "http://s3-rustfs:8090/data/stdout.log",
            "path": "/tmp/stdout.log",
            "type": "FILE"
            },
            {
            "url": "http://s3-rustfs:8090/data/stderr.log",
            "path": "/tmp/stderr.log",
            "type": "FILE"
            }
        ],
        "executors": [
            {
            "image": "ubuntu:20.04",
            "command": [
                "/bin/sha1sum",
                "./kernel.tar.gz"
            ],
            "workdir": "/data/",
            "stdout": "/tmp/stdout.log",
            "stderr": "/tmp/stderr.log"
            }
        ],
        "volumes": [
            "/data"
        ]
    }'

tesp_example_webdav_input:
    #!/usr/bin/bash
    curl -v -u admin:adminadmin http://localhost:8080/v1/tasks \
    -X POST -H "Content-Type: application/json" \
    -d '{
        "inputs": [
            {
            "url": "http://s3-rustfs:8090/data/input.txt",
            "path": "/data/input.txt",
            "type": "FILE"
            }
        ],
        "outputs": [
            {
            "url": "http://s3-rustfs:8090/data/stdout.log",
            "path": "/tmp/stdout.log",
            "type": "FILE"
            },
            {
            "url": "http://s3-rustfs:8090/data/stderr.log",
            "path": "/tmp/stderr.log",
            "type": "FILE"
            }
        ],
        "executors": [
            {
            "image": "ubuntu:20.04",
            "command": [
                "/bin/sha1sum",
                "./input.txt"
            ],
            "workdir": "/data/",
            "stdout": "/tmp/stdout.log",
            "stderr": "/tmp/stderr.log"
            }
        ],
        "volumes": [
            "/data"
        ]
    }'

status TASK_ID:
    curl "http://localhost:8080/v1/tasks/{{TASK_ID}}?view=FULL"

status_basic_auth TASK_ID:
    curl -u admin:adminadmin "http://localhost:8080/v1/tasks/{{TASK_ID}}?view=FULL"
