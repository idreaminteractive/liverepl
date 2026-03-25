defmodule Liverepl.Components.Liveiex do
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
  def mount(socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:title, fn -> "My Widget" end)
     |> assign_new(:class, fn -> "" end)}
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  @impl true
  def handle_event("decrement", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count - 1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id={@id}
      class={["my-live-library--widget", @class]}
      phx-hook="LivereplHook"
      phx-target={@myself}
    >
      <div class="my-live-library--widget__header">
        <h2><%= @title %></h2>
      </div>

      <div class="my-live-library--widget__body">
        <p>Count: <strong><%= @count %></strong></p>

        <div class="my-live-library--widget__controls">
          <button phx-click="decrement" phx-target={@myself}>-</button>
          <button phx-click="increment" phx-target={@myself}>+</button>
        </div>
      </div>
    </div>
    """
  end
end
