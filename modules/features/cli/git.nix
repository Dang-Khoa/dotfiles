{ ... }:
{
    flake.modules.homeManager.cli-git = { lib, ... }: {
        programs.git = {
            enable = true;

            settings = {
                user  = {
                    name = lib.mkDefault "Dang Khoa";
                    email = lib.mkDefault "kn020699@gmail.com";
                };

                init.defaultBranch = "main";
                pull.rebase = true;
                push.autoSetupRemote = true;
            };
        };
    };

    flake.modules.nixos.cli-git = { pkgs, ... }: {
        environment.systemPackages = [ pkgs.git ];
    };
}
