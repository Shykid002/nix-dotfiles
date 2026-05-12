{ pkgs, config, self, inputs, ... }:

{

# User
 users.users.optimist23 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "00233";
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
     # Optional: Add custom interactive behavior
    interactiveShellInit = ''
      set -g fish_greeting "" # Disable welcome message
      set -gx EDITOR nvim   # setnvim as default editor
      set -U fish_user_paths /home/optimist23/go/bin
      alias c 'clear'
      alias zathura-theme '/home/optimist23/.config/zathura/zathura-theme.py'
    '';  

  # Note: Aliases and zoxide init are now handled automatically by the modules below
  };

}
