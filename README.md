# qemu-guest-agent
A QEMU Guest Agent Container for Fedora CoreOS, based in Alpine Linux.

Inspired by previous projects, including:
 * https://github.com/linuxkit/linuxkit/tree/master/pkg/qemu-ga
 * https://github.com/projectatomic/atomic-system-containers/tree/master/qemu-guest-agent
 * https://github.com/dskad/qemu-ga-container
 * https://github.com/ecky-l/qemu-guest-agent

# How to build

docker build -t nkcx/qemu-guest-agent:latest .

# How to use

This container is designed for a [Fedora CoreOS](https://getfedora.org/coreos) VM running inside 
[QEMU](https://www.qemu.org/).  It provides the [QEMU Guest Agent](https://wiki.libvirt.org/page/Qemu_guest_agent) 
daemon, configured appropriately to communicate with the host hypervisor system.  The guest agent enables shutdown/
standby controls, and provides information about the host system to the hypervisor, such as IP Address(es). 

This container requires `--privileged` access, along with direct access to a special QEMU socket file which is used
to communicate with the hypervisor.

Run it like this:
```
docker run \
        -d \
        --privileged \
        -v /dev/virtio-ports/org.qemu.guest_agent.0:/dev/virtio-ports/org.qemu.guest_agent.0 \
        nkcx/qemu-guest-agent
```

# Updates and Versions

This repository is configured to automatically provide new versions whenever Alpine Linux or qemu-guest-agent get
updates.  Every day, a Github action checks for new versions of either software.  When a new version is detected,
the action updates the specific version numbers in the docker file, and pushes the update to the repo.

On repo updates, Docker is configured to auto-build an updated container, which then becomes available immediately.
If you have Watchtower, it will then automatically update your qemu-guest-agent container.

Version numbers are:  `<alpine version>-<qemu version>`.  For example, `3.0.2-5.1` is Alpine 3.0.2 with qemu-guest-agent
5.1.

# Notes

This container is specifically designed to work well with Fedora CoreOS and Proxmox Hypervisor (which is based on
QEMU).  In theory, this container will work with any similar container OS (CoreOS, Flatcar, RancherOS) on any
QEMU-based hypervisor.  However, those configurations have not been tested.

# License

Apache 2.0 license.

See the file LICENSE for full legal details
