{inputs, self, ...}:
{
  flake.nixosConfigurations.cooper = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostCooper
    ];
  };

  flake.nixosModules.hostCooper = { pkgs, ... }: {
    imports = [
      self.nixosModules.clamav
      self.nixosModules.discord
      self.nixosModules.dropbox
      self.nixosModules.gimp
      self.nixosModules.git
      self.nixosModules.homeManager
      self.nixosModules.keepass
      self.nixosModules.mail
      self.nixosModules.nixEnhancement
      self.nixosModules.office
      self.nixosModules.pcFunctionality
      self.nixosModules.planify
      self.nixosModules.steam
      self.nixosModules.telegram
      self.nixosModules.vivaldi
      self.nixosModules.vlc
      self.nixosModules.zip
      self.nixosModules.vscode
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Define hostname.
    networking.hostName = "cooper";

    # Nix settings
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

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

    services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.cooper = {
      isNormalUser = true;
      description = "Cooper";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    users.users.clamav = {
      isNormalUser = true;
      description = "Clamav";
      extraGroups = [ "clamav" ];
    };

    users.groups.clamav = { };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    services.xserver = {
      videoDrivers = [ "amdgpu" ];
      enable = true;
    }; 

    hardware = {
      # OpenGL
      graphics.enable = true;
      graphics.enable32Bit = true;

      # Load amdgpu in the initial ramdisk
      amdgpu.initrd.enable = true;
    };

    services.blueman.enable = true;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };

    # Limit generations to 10
   boot.loader.systemd-boot.configurationLimit = 10;

    # Optimize storage
    nix.settings.auto-optimise-store = true;

    system.stateVersion = "26.05";

    # Fonts
    fonts.packages = with pkgs; [
      nerd-fonts._0xproto
      miracode
    ];
  };
}
