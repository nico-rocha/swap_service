defmodule SwapServiceWeb.ErrorView do
  use SwapServiceWeb, :view
  import Ecto.Changeset, only: [traverse_errors: 2]

  def render("400.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translate_errors(result)}
  end

  def render("400.json", %{result: message}) do
    %{message: message}
  end

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
      IO.inspect(msg)
    end)
  end
end
