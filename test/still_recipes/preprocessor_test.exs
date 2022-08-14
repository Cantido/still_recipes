defmodule StillRecipes.PreprocessorTest do
  use ExUnit.Case, async: true
  doctest StillRecipes.Preprocessor

  test "Slime can process the output content of apple.yml" do
    recipe = File.read!("priv/site/recipes/apple.yml")

    result_file =
      %Still.SourceFile{
        content: recipe,
        input_file: "recipes/apple.yml"
      }
      |> StillRecipes.Preprocessor.render()
      |> Still.Preprocessor.Slime.render()

    assert result_file.content =~ "Giving an Apple to a Friend"
  end

  test "Slime can process output from multi-yield files" do
    recipe = File.read!("priv/site/recipes/basic-fruit-salad.yml")

    result_file =
      %Still.SourceFile{
        content: recipe,
        input_file: "recipes/basic-fruit-salad.yml"
      }
      |> StillRecipes.Preprocessor.render()
      |> Still.Preprocessor.Slime.render()

    assert result_file.content =~ "Basic Fruit Salad"
    assert result_file.content =~ "6 servings"
    assert result_file.content =~ "18 servings"
  end

  test "Slime can process output of banana-bread.yml" do
    recipe = File.read!("priv/site/recipes/banana-bread.yml")

    result_file =
      %Still.SourceFile{
        content: recipe,
        input_file: "recipes/banana-bread.yml"
      }
      |> StillRecipes.Preprocessor.render()
      |> Still.Preprocessor.Slime.render()

    assert result_file.content =~ "Banana Bread"
  end
end
