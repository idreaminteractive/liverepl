/**
 * LivereplHook
 *
 */
export const LiveReplHook = {
  mounted() {
    console.log("[LiveReplHook] mounted", this.el);

    // Example: listen for a custom server-sent event
    // this.handleEvent("my_widget:flash", ({ message }) => {
    //   console.log("[MyWidgetHook] server says:", message);
    // });

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
