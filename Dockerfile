FROM ubuntu:22.04 as builder

RUN apt-get update && apt-get install -y build-essential gcc g++ make && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN echo '#include <stdio.h>\nint main() { printf("Hello World!\\n"); return 0; }' > hello.c \
 && gcc hello.c -o hello


FROM debian:buster-slim

COPY --from=builder /app/hello /usr/local/bin/hello

CMD ["hello"]
