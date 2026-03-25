defmodule Liverepl do
  @moduledoc """
  MyLiveLibrary - a Phoenix LiveView component library.

  ## Installation

  Add to your `mix.exs`:

      {:my_live_library, "~> 0.1"}

  Then in your `assets/package.json`:

      "my_live_library": "file:../deps/my_live_library"

  Run `mix deps.get` and `npm install --prefix assets`.

  ## JS Setup

  In `assets/js/app.js`:

      import { MyLibraryHooks } from "my_live_library"

      let liveSocket = new LiveSocket("/live", Socket, {
        hooks: { ...MyLibraryHooks },
      })

  ## CSS Setup

  In `assets/css/app.css`:

      @import "my_live_library/css";

  ## Usage

  In any LiveView:

      alias MyLiveLibrary.Components

      ~H\"""
      <.live_component module={Components.MyWidget} id="my-widget" title="Hello" />
      \"""
  """
end
