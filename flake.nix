{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    ah.url = "github:z1-0/ah.sh";
    skills.url = "github:z1-0/skills-nix";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      flake = false;
    };

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    _.url = "github:z1-0/sylvan";
  };

  outputs = _: _._ _ ./.;
}
