import Config

config :still,
  dev_layout: false,
  input: Path.join(Path.dirname(__DIR__), "priv/site"),
  output: Path.join(Path.dirname(__DIR__), "_site"),
  preprocessors: %{
    ".yml" => [Still.Preprocessor.AddContent, StillRecipes.Preprocessor, Still.Preprocessor.Slime, Still.Preprocessor.OutputPath, Still.Preprocessor.Save]
  }

import_config("#{Mix.env()}.exs")
