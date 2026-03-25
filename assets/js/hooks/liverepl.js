/**
 * LivereplHook
 *
 */
import { Terminal } from "@xterm/xterm"
export const LiveReplHook = {
  mounted() {
    console.log("[LiveReplHook] mounted", this.el);
    let term = new Terminal();
    term.open(this.el.querySelector(".xtermjs_container"));
    term.onKey(key => {
      this.pushEventTo(this.el, "key", key);
    });

    this.handleEvent("print_" + this.el.id, e => {
      term.write(e.data);
    });
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
