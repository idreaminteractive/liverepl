/**
 * MyWidgetHook
 *
 * Paired with MyLiveLibrary.Components.MyWidget via phx-hook="MyWidgetHook".
 *
 * Lifecycle callbacks:
 *   mounted()     - el is in the DOM, LiveView is connected
 *   updated()     - el was patched by LiveView
 *   destroyed()   - el was removed from DOM
 *   disconnected() - LiveSocket lost connection
 *   reconnected()  - LiveSocket reconnected
 *
 * Useful helpers available on `this`:
 *   this.el         - the DOM element
 *   this.pushEvent(event, payload, callback)
 *   this.pushEventTo(selector, event, payload, callback)
 *   this.handleEvent(event, callback)
 */
export const MyWidgetHook = {
  mounted() {
    console.log("[MyWidgetHook] mounted", this.el);

    // Example: listen for a custom server-sent event
    this.handleEvent("my_widget:flash", ({ message }) => {
      console.log("[MyWidgetHook] server says:", message);
    });

    // Example: push an event to the server on some DOM interaction
    // this.el.addEventListener("click", () => {
    //   this.pushEvent("client_clicked", { id: this.el.id });
    // });
  },

  updated() {
    // Called each time the component is re-rendered
  },

  destroyed() {
    // Clean up any listeners or timers here
  },
};
