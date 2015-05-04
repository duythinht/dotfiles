useradd -m duythinht
adduser duythinht sudo
chsh -s /bin/bash duythinht
echo "duythinht ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/duythinht
mkdir /home/duythinht/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI6/nojqHC9A6o0HhYa6A4X1uYtntl+p6YSlLUdGm94e8O7SwJ0M5dwYXg++qkFfFvOqTNMdwk35EWUzsVsgjKLe79jVDjYel8UqjwmUGF0muSDch0XMwA/eXmLn/Ak7Qd/Qqj0z7oARWCuDwQt4KMSmoZVdVl7idH7uuBOyJAkXsciig4PjyOUP2g3PiTVABF7UfM7RWs+tEZAM9oenQVzNhmYFIVyxhHFe/qAJDzR8LgT7Hr6gzIIKuUKiqCwaDOZIAwwaEF9AdAuEWUi1PYM9PY+oCTRG6VXD+GOCktNpizqLfFf/0gHxEccmmdXj0okjsAgTOcfwam2/9oeler duythinht@false-love" >> /home/duythinht/.ssh/.ssh/authorized_keys
chown -R /home/duythinht/.ssh/ duythinht
chmod 700 /home/duythinht/.ssh/
chmod 600 /home/duythinht/.ssh/authorized_keys


