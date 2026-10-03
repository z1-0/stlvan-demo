{ inputs, ... }:
let
  username = inputs.self.lib.rootTree.data.profile.content.name;
in
{
  hjem = {
    extraModules = [ inputs.noctalia.hjemModules.default ];

    users.${username} = {
      programs.noctalia = {
        enable = true;
        # settings = { };
      };
    };
  };
}
