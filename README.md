# Crystal

Static type system for BEAM. Crystal is Elixir wrapper around [Gradualizer](https://github.com/josefs/Gradualizer).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `crystal` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:crystal, "~> X.X.X"}
  ]
end
```

## Usage

Command will check all modules in current mix project

```
mix crystal
```

Command will check only given module

```
mix crystal <ModuleName>
```
