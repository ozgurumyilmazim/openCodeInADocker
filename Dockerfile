FROM ghcr.io/anomalyco/opencode:2.0.0

ARG USER_ID=1001
ARG GROUP_ID=1001

# Create group and user with the specified IDs
RUN addgroup -g ${GROUP_ID} user && \
    adduser -u ${USER_ID} -G user -D -h /home/user -s /bin/sh user && \
    mkdir -p /home/user && chown -R ${USER_ID}:${GROUP_ID} /home/user

# Set the home directory for the user
ENV HOME=/home/user

# Switch to the non‑root user for the container runtime
USER ${USER_ID}:${GROUP_ID}


