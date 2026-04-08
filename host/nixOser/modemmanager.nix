{ pkgs, ... }: {

  # 1. Enable the ModemManager service
  networking.modemmanager.enable = true;
}

