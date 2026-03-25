/**
 * MyLiveLibrary JS entry point.
 *
 * Exports all hooks so consumers can spread them into their LiveSocket:
 *
 *   import { MyLibraryHooks } from "my_live_library"
 *
 *   let liveSocket = new LiveSocket("/live", Socket, {
 *     hooks: { ...MyLibraryHooks },
 *   })
 */

import { MyWidgetHook } from "./hooks/my_widget_hook";

// Add new hooks here as you build them out.
export const MyLibraryHooks = {
  MyWidgetHook,
};
