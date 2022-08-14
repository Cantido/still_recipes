defmodule StillRecipes.Preprocessor do
  use Still.Preprocessor

  alias Still.SourceFile

  @impl true
  def render(%SourceFile{} = source_file) do
    {:ok, data} = YamlElixir.read_from_string(source_file.content)

    %{source_file |
      content: File.read!("priv/_recipe.slime"),
      metadata: Map.merge(source_file.metadata, %{recipe: data}),
      extension: ".html.eex"
    }
  end
end
