{
  plugins.gitlinker = {
    enable = true;
    settings = {
      callbacks = {
        "github.com" = { __raw = "require('gitlinker.hosts').get_github_type_url"; };
        "gitlab.dnm.radiofrance.fr" = { __raw = "require('gitlinker.hosts').get_github_type_url"; };
      };
    };
  };
}
