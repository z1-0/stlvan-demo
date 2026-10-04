{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      flake = false;
    };

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    git-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    workbuddy.url = "github:YeFaDa/workbuddy-nix";
    workbuddy.inputs.nixpkgs.follows = "nixpkgs";

    umbriel.url = "github:noctalia-dev/umbriel";
    umbriel.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    ah.url = "github:z1-0/ah.sh";
    skills.url = "github:z1-0/skills-nix";
    _.url = "github:z1-0/sylvan";
  };

  outputs = _: _._ _ ./.;
}
