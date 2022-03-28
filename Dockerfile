FROM alpine:3.15.2
LABEL version="3.15.2-6.2.0-r5"
LABEL maintainer="qemu-guest-agent@nkcx.net"
LABEL tags="6.2, 6.2.0, 6.2.0-r5"

RUN apk add --update --no-cache qemu-guest-agent
RUN ln -sf /bin/systemctl /sbin/halt; \
    ln -sf /bin/systemctl /sbin/poweroff; \
    ln -sf /bin/systemctl /sbin/reboot; \
    ln -sf /bin/systemctl /sbin/runlevel; \
    ln -sf /bin/systemctl /sbin/shutdown; \
    ln -sf /bin/systemctl /sbin/telinit


ENTRYPOINT [ "/usr/bin/qemu-ga" ]
CMD ["-m", "virtio-serial", "-p", "/dev/virtio-ports/org.qemu.guest_agent.0"]
