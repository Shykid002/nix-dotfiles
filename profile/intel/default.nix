{ ... }:

{
  imports = [
    # CHANGED: Import your new Intel graphics module instead of the AMD one
    ./intel-graphics.nix
  ];

  # Enable GPU Drivers
  # CHANGED: Toggle the new Intel configuration flag we created
  drivers.intel-gpu.enable = true;
}
