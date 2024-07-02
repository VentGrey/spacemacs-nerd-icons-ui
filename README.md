# spacemacs-nerd-icons-ui
Simple layer for Spacemacs to use nerd-icons instead of all-the-icons.

Spacemacs has a rather confusing way of being configured. I did not found many "Spacemacs + nerd icons" resources online.
Everything default still points to `all-the-icons` except for the doom modeline.

This layer brings `nerd-icons` to some components of Spacemacs

## How to install

> [!IMPORTANT]
> Do not enable the `tabs` configuration layer when using this package. It's easier to install this configuration than patching centaur tabs.
>
> This also may or may not break your Spacemacs dashboard. I wouldn't miss it much though...

1. Download this repository as zip or clone it.
2. Copy `packages.el` to `~/.emacs.d/private/nerd-icons-ui/packages.el`
3. Add `nerd-icons-ui` to your `dotspacemacs-configuration-layers`.
4. Restart emacs (do the same if you have a daemon running).

## FAQ
- Is `neotree` supported?
  - No, alv
- Is `ivy-rich` supported?
  - Tampoco alv
- Is `corfu` supported?
  - Ese menos alv
- Is `dirvish` supported?
  - Ño, alv
- Is `doom-modeline` supported?
  - Simón.
 
