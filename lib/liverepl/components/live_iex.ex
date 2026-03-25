defmodule Liverepl.Components.LiveIex do
  @moduledoc """

  ## Assigns

    * `:id` - required, unique identifier for this component instance
    * `:title` - the widget title (default: "My Widget")
    * `:class` - additional CSS classes (optional)

  ## Example

      <.live_component
        module={MyLiveLibrary.Components.MyWidget}
        id="my-widget"
        title="Hello world"
      />
  """
  use Phoenix.LiveComponent

  @impl true
  def update(%{id: id, data: data}, socket) do
    {:ok, push_event(socket, "print_#{id}", %{data: data})}
  end

  def update(%{id: id} = assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_tty(id)

    {:ok, socket}
  end

  @impl true
  def handle_event("key", %{"key" => key}, %{assigns: %{tty: tty}} = socket) do
    :ok = ExTTY.send_text(tty, key)
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id={@id}
      class={["my-live-library--widget"]}
      phx-hook="LiveReplHook"
    >
      <div class="xtermjs_container" phx-update="ignore" id={"xtermjs-container-#{@id}"}></div>
    </div>
    """
  end

  defp assign_tty(socket, id) do
    if connected?(socket) do
      {:ok, output_handler} = Liverepl.TTYOutputHandler.start(self(), id)

      {:ok, tty} = ExTTY.start_link(handler: output_handler)

      assign(socket, :tty, tty)
    else
      socket
    end
  end
end
