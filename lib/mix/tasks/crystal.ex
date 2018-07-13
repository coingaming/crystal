defmodule Mix.Tasks.Crystal do
  use Mix.Task
  require Uelli

  @moduledoc """
  Task runs Gradualizer for current mix project
  """

  def run([]) do
    :ok = Mix.Task.run("app.start")
    Mix.Project.get!.project[:app]
    |> case do
      nil ->
        raise("OTP application name was not provided by mix.exs")
      otp_app when is_atom(otp_app) ->
        otp_app
        |> :application.get_key(:modules)
        |> case do
          {:ok, modules = [_ | _]} ->
            check_modules(modules)
          :undefined ->
            raise(":application.get_key(#{inspect otp_app}, :modules) FAILED")
        end
    end
  end

  def run([module_name]) do
    :ok = Mix.Task.run("app.start")
    module_name
    |> String.to_atom
    |> Crystal.type_check_module
    |> case do
      :ok -> :ok
      :nok -> raise("Gradualizer founded errors in modules: #{module_name}")
    end
  end

  #
  # priv
  #

  defp check_modules(modules = [_ | _]) do

    gradualizer_results =
      modules
      |> Enum.map(fn(module_name) ->
        module_name
        |> Crystal.type_check_module
        |> Uelli.try_catch
        |> case do
          res = :ok -> {module_name, res}
          res = :nok -> {module_name, res}
          {:error, _} -> {module_name, :error}
        end
      end)
      |> Enum.group_by(fn({_, status}) -> status end)

    gradualizer_results
    |> Map.keys
    |> case do
      [:ok] ->
        :ok
      [_ | _] ->
        error_message =
          gradualizer_results
          |> Stream.map(fn({status, lst = [_ | _]}) ->
            prefix =
              status
              |> case do
                :ok -> "Gradualizer succeeded in modules "
                :nok -> "Gradualizer founded errors in modules "
                :error -> "Gradualizer failed with exception in modules "
              end
            "#{prefix}(#{length lst}): #{lst |> Stream.map(fn({module_name, _}) -> module_name end) |> Enum.join(", ")}"
          end)
          |> Enum.join("\n\n")

        raise("\n\n#{error_message}\n\nTo investigate issues run \"mix crystal <ModuleName>\"\n\n")
    end
  end

end
