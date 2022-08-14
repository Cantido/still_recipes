defmodule StillRecipes.Preprocessor do
  use Still.Preprocessor

  alias Still.SourceFile

  require Logger

  @impl true
  def render(%SourceFile{} = source_file) do
    {:ok, data} = YamlElixir.read_from_string(source_file.content)

    image_path_base =
      image_path(source_file.input_file)

    possible_image_paths =
      [".png", ".jpg", ".jpeg", ".gif"]
      |> Enum.map(&(image_path_base <> &1))

    possible_image_path =
      possible_image_paths
      |> Enum.find(fn path ->
        File.exists?(Still.Utils.get_input_path(path))
      end)

    if possible_image_path do
      Logger.debug("Found image file (#{possible_image_path}) for recipe file (#{source_file.input_file})")
    else
      Logger.debug("No image files found for recipe (#{source_file.input_file}). Looked at #{Enum.join(possible_image_paths, ", ")}")
    end

    image_data = %{recipe_image_path: possible_image_path}

    metadata =
      source_file.metadata
      |> Map.merge(%{
        layout: "_recipe.slime",
        recipe: data
      })
      |> Map.merge(image_data)

    %{source_file |
      content: File.read!("priv/_recipe.slime"),
      metadata: metadata,
      extension: ".html.eex"
    }
  end

  defp image_path(input_path) do
    dir = Path.dirname(input_path)
    input_file =
      Path.basename(input_path)
      |> Path.rootname(".yml")

    Path.join(dir, input_file)
  end
end
