{ pkgs, ... }:

{
  zramSwap.enable = true;

  # Enable power management for hibernation
  powerManagement.enable = true;
  powerManagement.powertop.enable = true; # enable powertop auto tuning on startup.

  services.system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles - thanks System76!!!
  services.thermald.enable = true; # Enable thermald, the temperature management daemon. (only necessary if on Intel CPUs)
  services.power-profiles-daemon.enable = false; # Disable GNOMEs power management
  services.tlp = {
    # Enable TLP (better than gnomes internal power manager)
    enable = true;
    settings = {
      # sudo tlp-stat or tlp-stat -s or sudo tlp-stat -p
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_SCALING_MIN_FREQ_ON_AC = 400000; # 400 MHz
      CPU_SCALING_MAX_FREQ_ON_AC = 4200000; # 4,2 GHz
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 81;
    };
  };
}
