{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Define hostname.
  networking.hostName = "cooper";

  # Nix settings
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = 
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cooper = 
  {
    isNormalUser = true;
    description = "Cooper";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Environment packages
  environment.systemPackages = with pkgs; 
  [
   discord
   keepass
   vscode
  ];

  imports =
  [ 
   ./hardware-configuration.nix
   ../../nixosModules/gaming
  ];
  
  # Nvidia drivers
  services.xserver =
  {
    videoDrivers = ["nvidia"];
  };

  hardware =
  {
    # OpenGL
    graphics.enable = true;
    
    # Nvidia settings
    nvidia =
    {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      nvidiaSettings = true;
      powerManagement.finegrained = false;
      powerManagement.enable = false;
    };
  };
 
  system.stateVersion = "24.11";
}
