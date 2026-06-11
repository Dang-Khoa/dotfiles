{ ... }: {
  flake.modules.homeManager.desktop-vars = { lib, ... }: {
    options.vars = {
      terminal = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description= "Command to launch the terminal";
      };

      launcher = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "Command to toggle the application launcher";
      };

      screen-lock = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description= "Command to lock the screen";
      };

      settings = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description= "Command to toggle settings";
      };

      startups = lib.mkOption {
        type = lib.types.listOf (lib.types.listOf lib.types.str);
        default = [];
        description = "Commands to spawn at startup";
      };
    };
  };
}
