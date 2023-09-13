{ pkgs, ... }: {
  users.users.yly = {
    isNormalUser = true;
    homeMode = "0750";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4r33a5j59o5HGg9W8tTKG6jltIG+ALW5TuBzYs+1yu6JTacI9axzS7e2+K8hNmENPhmQtYQZHuTr/DyhMUUs3cRkYrnBGFF6VkKKJL7HylY1DqQmvrWcK3ZQAWPEe6uEyDQo3vKu3Gd4V6Ce+c0IU5+3dmxo2HsHs40//pjh6slcl/jJK8ck8K3Td0vbE6+sbXphiO6I5rcQBUtLW+Kp+BJ6NvckKv585mV2A/TEujkTlvcQMLHvEUHHovev7RQQIVE68xDr9DN5Pu8HtitOqMAz8aVOCH9QrNNxo89HC+BEVW5W3JoxRwVDXrOvYMcYm/5eKO+Wz3ktk3QfMVD0f yly@aemaeth"
      ""
    ];
    # https://zhuanlan.zhihu.com/p/463397947
    hashedPassword = "$6$/erPxFv9PELJxjhl$6SPMV64BHG4C8zYrjLSrRxWXrGTc4/uBp58h275lBEiDaHgnbwWdITfZuHKZ5ZA727ZUYrXUESIgVEHNI5jnB1";

  };
  users.users.huyunfan = {
    isNormalUser = true;
    homeMode = "0750";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker" "audio" "sound" "video" "input" "tty" "camera" "ssh" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCy5K6rBw29P47QfmyQ5pnU2zR59tDr7HQz07L98uck2E1Q/rjmKfQM0kMuRu4luTcqLnV2iYOy8KQJQjge2Sny3qLF+te3a3BUgMcSsACXE3duLPRFwFZujcuusa0Uy05ywbJynRGFg7FnJqVR8aG7hE/qEw1j8O/sZG41ZDPdGi1MgcGnSVtV2Z1tL9qYCtFwIr8itRgJyMTTWZPZN8sK0FCYUX9BcUwgoMHAK6yKcMWc81vmmF4brzsV3B36/bmh2vSiSR6nzXHJ0zvvYLOhxQbdUEASikA55sS88znqFiA1UhYf9rK7rGi44qjW8b1Y4OcY91BGbuGlAwv4UXF2rAK7+56AmvuBd6A+0AL/aNz6Rkg0hwfLYQ3A9f6QYt9/SRe4y3fcmqbQeFHlOmtXrt++y01sRePYryxxr+T/ky54oIZ/doSCu6HuaL/DEymznx2VdPTv8CuSG9J5XlbGgzqNHixka+tJPz8g28JEhn2mqea3X6dyo1SZhAOJofU= huyunfan@Eileen"

    ];
    # https://zhuanlan.zhihu.com/p/463397947
    hashedPassword = "$y$j9T$yLII0VPRkpUG1CYRdMuSA.$eFShp3xscagM6xM1jBlTZwoC0nfj/pkoFAhmJuGCKv8";

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
