This repo is a fork of [Frost-Phoenix's Flakes](https://github.com/Frost-Phoenix/nixos-config)

## File structure

- `./modules`: contains all modules
- `./modules/<core OR home>/default.<host>.nix`: imports specific modules for specific hosts
- `./modules/<core OR home>/default.nix`: imports common modules used by all hosts

## Common setups and fixes

### Luks and tpm2

- Cmd to set partition to unlock at boot:

```bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+7 /dev/nvme0n1px
```

- When above setup breaks:
  - The corresponding luks keyslot and token become useless and have to be deleted
  - The above cmd has to be executed again

Here's how to cleanup the broken parts:

Extract info on the device to check which token and which key it uses:

```bash
sudo cryptsetup luksDump /dev/nvme0n1px
```

For the keyslot:

```bash
sudo cryptsetup luksKillSlot /dev/nvme0n1px <keyslotNo>
```

For the token:

```bash
sudo cryptsetup token remove --token-id <tokenNo> /dev/nvme0n1px
```
