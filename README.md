# StillRecipes

A [Still](stillstatic.io) preprocessor for [Open Recipe Format][orf] files.

## Installation

Add `still_recipes` as a dependency in `mix.exs`:

```
def deps do
  [
    {:still_recipes, "~> 0.7.0"}
  ]
end
```

## Usage

Add the following to your Still configuration, this will render `.yml` files into structured `.html` files and show them on your website:

```elixir
config :still,
  preprocessors: %{
    ".yml" => [
      Still.Preprocessor.AddContent,
      StillRecipes.Preprocessor,
      Still.Preprocessor.Slime,
      Still.Preprocessor.OutputPath,
      Still.Preprocessor.URLFingerprinting,
      Still.Preprocessor.AddLayout,
      Still.Preprocessor.Save
    ]
  }
```

## License

MIT License

Copyright 2022 Rosa Richter

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
