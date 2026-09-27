{
  programs.umbriel.enable = true;

  # QEMU's default VGA device (bochs-drm) exposes no DRM render node, so Mesa falls
  # back to llvmpipe and wlroots refuses the resulting EGL context unless software
  # rendering is explicitly allowed. Umbriel has no pixman fallback (SceneFX needs
  # GL), so it exits 1 and `start-umbriel` fails, which makes greetd show the
  # greeter again right after a login. Real GPUs do expose a render node, so this
  # opt-in is scoped to the VM variant and leaves the host configuration untouched.
  virtualisation.vmVariant.systemd.user.services.umbriel.environment.WLR_RENDERER_ALLOW_SOFTWARE =
    "1";
}
