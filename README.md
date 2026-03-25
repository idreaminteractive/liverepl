# Liverepl

---

## Installation

### 1. `mix.exs`

```elixir
def deps do
  [
    {:liverepl, "~> 0.1"}
    # or during local dev:
    # {:liverepl, path: "../liverepl"}
  ]
end
```

Run `mix deps.get`.

### 2. `assets/package.json`

```json
{
  "dependencies": {
    "liverepl": "file:../deps/liverepl"
  }
}
```

Run `npm install --prefix assets` (or `yarn --cwd assets`).

### 3. `assets/js/app.js`

```js
import { LiveReplHooks } from "liverepl"

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: { LiveReplHooks: LiveReplHooks.LiveReplHook },
})
```

### 4

Install @xterm - just do it.

### 5. Use a component

```elixir
# In any LiveView render/1:
~H"""
<.live_component
  module={Liverepl.Components.LiveIex}
  id="my-widget"
/>
"""
```

Never make this public. Always route it behind basic auth and /dev/ routes

Credit: Updated and used from <https://github.com/frerich/underthehood>
I simply updated it to work with current Phoenix and setup for me.
