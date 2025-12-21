{ ... }:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    _JAVA_AWT_WM_NONEREPARENTING = 1;
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    DISABLE_QT5_COMPAT = 0;
    GDK_BACKEND = "wayland";
    GDK_SCALE = 1;
    ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    # QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORM = "wayland;xcb";
    # QT_QPA_PLATFORMTHEME = "qt6ct"; # stylix
    # QT_STYLE_OVERRIDE = "kvantum"; # stylix
    MOZ_ENABLE_WAYLAND = 1;
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Colloid-Green-Dark-Gruvbox";
    GRIMBLAST_HIDE_CURSOR = 0;
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };
}

/*
  From old hyprland.conf

  # electron >28 apps (may help)
  env = ELECTRON_OZONE_PLATFORM_HINT,auto

  # NVIDIA
  # This is from Hyprland Wiki. Below will be activated nvidia gpu detected
  # See hyprland wiki https://wiki.hyprland.org/Nvidia/#environment-variables

  # to use nvidia as primary renderer (need hyprland >0.45)
  #env = AQ_DRM_DEVICES,/dev/dri/card1 (nvidia)
  #env = AQ_DRM_DEVICES,/dev/dri/card0

  # additional ENV's for nvidia. Caution, activate with care
  #env = GBM_BACKEND,nvidia-drm

  #env = __NV_PRIME_RENDER_OFFLOAD,1
  #env = __VK_LAYER_NV_optimus,NVIDIA_only
  #env = WLR_DRM_NO_ATOMIC,1

  # FOR VM and POSSIBLY NVIDIA
  # LIBGL_ALWAYS_SOFTWARE software mesa rendering
  #env = LIBGL_ALWAYS_SOFTWARE,1
  #env = WLR_RENDERER_ALLOW_SOFTWARE,1

  # nvidia firefox (for hardware acceleration on FF)?
  # check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
  #env = MOZ_DISABLE_RDD_SANDBOX,1
  #env = EGL_PLATFORM,wayland
*/
