{ ... }:

{
  programs.lazygit = {
    enable = true;

    settings = {
      customCommands = [
        {
          key = "x";
          context = "files";
          command = ''
            {{if .SelectedFile.HasUnstagedChanges}}
                git annex add {{.SelectedFile.Name | quote}}
              {{else}}
                git annex unannex {{.SelectedFile.Name | quote}}; git reset {{.SelectedFile.Name | quote}}
            {{end}}
          '';
          description = "Toggle file staged (annex)";
        }
      ];
    };
  };
}
