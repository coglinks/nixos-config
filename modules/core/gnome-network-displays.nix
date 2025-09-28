# Failed config
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    glib-networking
    gnome-network-displays
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
  ];

  networking.firewall.trustedInterfaces = [ "p2p-wl+" ];
  networking.firewall.allowedTCPPorts = [
    7236
    7250
  ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 32768;
      to = 60999;
    }
  ];
}

/*
  # Errors while interacting with gnome-network-displays
  > gnome-network-displays

  (gnome-network-displays:31600): Gdk-CRITICAL **: 14:54:09.779: gdk_wayland_toplevel_real_unexport_handle: assertion 'handle != NULL' failed

  (gnome-network-displays:31600): Gnd-WARNING **: 14:54:13.381: codec list not initialized

  # When i try to pair with a display, gnome-network-displays shows that it's connecting for a long while before throwing an error.
*/
