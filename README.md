# Liverepl

---

## Installation

### 1. `mix.exs`

```elixir
def deps do
  [
    {:my_live_library, "~> 0.1"}
    # or during local dev:
    # {:my_live_library, path: "../my_live_library"}
  ]
end
```

Run `mix deps.get`.

### 2. `assets/package.json`

```json
{
  "dependencies": {
    "my_live_library": "file:../deps/my_live_library"
  }
}
```

Run `npm install --prefix assets` (or `yarn --cwd assets`).

### 3. `assets/js/app.js`

```js
import { MyLibraryHooks } from "my_live_library"

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: { ...MyLibraryHooks },
})
```

### 4. `assets/css/app.css`

```css
@import "my_live_library/css";
```

### 5. Use a component

```elixir
# In any LiveView render/1:
~H"""
<.live_component
  module={MyLiveLibrary.Components.MyWidget}
  id="my-widget"
  title="Hello"
/>
"""
```

---

## Development

```bash
mix deps.get
mix test
```

To test against a local Phoenix app, use `path:` in that app's `mix.exs`:

```elixir
{:my_live_library, path: "../my_live_library"}
```

---

## License

MIT
