defmodule Crystal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Crystal.Worker.start_link(arg)
      # {Crystal.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crystal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def stop(reason) do
    "#{__MODULE__} application is stopped, trying to shutdown erlang node ..."
    |> Logger.error([reason: reason])
    :init.stop()
  end

end
