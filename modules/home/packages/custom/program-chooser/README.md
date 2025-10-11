You can get a list of all commands using this:

```bash
for dir in $(echo $PATH | tr ':' ' '); do ls -1 $dir; done | sort -u | fzf
```

Use your own script in the terminal. Let's assume you have a reasonably short list of default programs you might want to choose from.

```bash
#!/bin/bash
read filename
myvar=$(zenity --list --text="Chose a non-default program" --column="Programs" firefox gedit)
$myvar filename &
```
[Source](https://askubuntu.com/a/244857)
