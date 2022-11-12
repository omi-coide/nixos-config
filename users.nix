{ pkgs, ... }:{
  users.users.yly = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4r33a5j59o5HGg9W8tTKG6jltIG+ALW5TuBzYs+1yu6JTacI9axzS7e2+K8hNmENPhmQtYQZHuTr/DyhMUUs3cRkYrnBGFF6VkKKJL7HylY1DqQmvrWcK3ZQAWPEe6uEyDQo3vKu3Gd4V6Ce+c0IU5+3dmxo2HsHs40//pjh6slcl/jJK8ck8K3Td0vbE6+sbXphiO6I5rcQBUtLW+Kp+BJ6NvckKv585mV2A/TEujkTlvcQMLHvEUHHovev7RQQIVE68xDr9DN5Pu8HtitOqMAz8aVOCH9QrNNxo89HC+BEVW5W3JoxRwVDXrOvYMcYm/5eKO+Wz3ktk3QfMVD0f yly@aemaeth"
    ];
    # https://zhuanlan.zhihu.com/p/463397947
    hashedPassword = "$6$/erPxFv9PELJxjhl$6SPMV64BHG4C8zYrjLSrRxWXrGTc4/uBp58h275lBEiDaHgnbwWdITfZuHKZ5ZA727ZUYrXUESIgVEHNI5jnB1";

  };
  users.users.leylee = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4r33a5j59o5HGg9W8tTKG6jltIG+ALW5TuBzYs+1yu6JTacI9axzS7e2+K8hNmENPhmQtYQZHuTr/DyhMUUs3cRkYrnBGFF6VkKKJL7HylY1DqQmvrWcK3ZQAWPEe6uEyDQo3vKu3Gd4V6Ce+c0IU5+3dmxo2HsHs40//pjh6slcl/jJK8ck8K3Td0vbE6+sbXphiO6I5rcQBUtLW+Kp+BJ6NvckKv585mV2A/TEujkTlvcQMLHvEUHHovev7RQQIVE68xDr9DN5Pu8HtitOqMAz8aVOCH9QrNNxo89HC+BEVW5W3JoxRwVDXrOvYMcYm/5eKO+Wz3ktk3QfMVD0f yly@aemaeth"
    ];
    # https://zhuanlan.zhihu.com/p/463397947
    hashedPassword = "$6$jtf/PJV4TtC0LggZ$Bt8Z/.eg6i4EJUvKj2zk8CDb.QLy9rJDdKNiYX1siS/R/IZ7rRKKGCPnuyRQ53PJSg6Zkg.QSJQVA5Jm7qE/q/";

  };
  users.users.billchenchina= {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4r33a5j59o5HGg9W8tTKG6jltIG+ALW5TuBzYs+1yu6JTacI9axzS7e2+K8hNmENPhmQtYQZHuTr/DyhMUUs3cRkYrnBGFF6VkKKJL7HylY1DqQmvrWcK3ZQAWPEe6uEyDQo3vKu3Gd4V6Ce+c0IU5+3dmxo2HsHs40//pjh6slcl/jJK8ck8K3Td0vbE6+sbXphiO6I5rcQBUtLW+Kp+BJ6NvckKv585mV2A/TEujkTlvcQMLHvEUHHovev7RQQIVE68xDr9DN5Pu8HtitOqMAz8aVOCH9QrNNxo89HC+BEVW5W3JoxRwVDXrOvYMcYm/5eKO+Wz3ktk3QfMVD0f yly@aemaeth"
    ];
    # https://zhuanlan.zhihu.com/p/463397947
    hashedPassword = "$6$jtf/PJV4TtC0LggZ$Bt8Z/.eg6i4EJUvKj2zk8CDb.QLy9rJDdKNiYX1siS/R/IZ7rRKKGCPnuyRQ53PJSg6Zkg.QSJQVA5Jm7qE/q/";

  };
  users.defaultUserShell = pkgs.zsh;

  security.sudo.wheelNeedsPassword = false;

  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
      });
    '';
  };

}
