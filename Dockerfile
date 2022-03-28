FROM alpine:3.15.2
LABEL version="3.15.2-6.2.0-r5"
LABEL maintainer="qemu-guest-agent@nkcx.net"
LABEL tags="6.2, 6.2.0, 6.2.0-r5"

RUN apk add --update --no-cache qemu-guest-agent
RUN ln -s /bin/systemctl /sbin/halt
RUN ls -s /bin/systemctl /sbin/poweroff
RUN ls -s /bin/systemctl /sbin/reboot
RUN ls -s /bin/systemctl /sbin/runlevel
RUN ls -s /bin/systemctl /sbin/telinit


ENTRYPOINT [ "/usr/bin/qemu-ga" ]
CMD ["-m", "virtio-serial", "-p", "/dev/virtio-ports/org.qemu.guest_agent.0"]
