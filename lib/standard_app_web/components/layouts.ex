defmodule StandardAppWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use StandardAppWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <.app_layout flash={@flash}>
      {render_slot(@inner_block)}
    </.app_layout>
    """
  end

  def app_static(assigns) do
    ~H"""
    <.app_layout flash={@flash}>
      {@inner_content}
    </.app_layout>
    """
  end

  @doc """
  Shared application layout component used by both app and app_static layouts.

  This component provides the common header, navigation, and main content area
  that both LiveView and controller layouts share.
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  slot :inner_block, required: true, doc: "the content to render in the main area"

  def app_layout(assigns) do
    ~H"""
    <header class="navbar px-4 sm:px-6 lg:px-8">
      <div class="flex-1">
        <a href="/" class="flex-1 flex w-fit items-center gap-2">
          <img src={~p"/images/logo.svg"} width="36" />
          <span class="text-sm font-semibold">v{Application.spec(:phoenix, :vsn)}</span>
        </a>
      </div>
      <div class="flex-none">
        <ul class="flex flex-column px-1 space-x-4 items-center">
          <li>
            <a href="https://phoenixframework.org/" class="btn btn-ghost">Website</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix" class="btn btn-ghost">GitHub</a>
          </li>
          <li>
            <.theme_toggle />
          </li>
          <li>
            <a href="https://hexdocs.pm/phoenix/overview.html" class="btn btn-primary">
              Get Started<span aria-hidden="true">&rarr;</span>
            </a>
          </li>
        </ul>
      </div>
    </header>

    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    assigns = assign(assigns, :themes, StandardApp.Splash.get_theme_sections())

    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
        <.icon name="hero-swatch" class="size-5" />
      </div>
      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-156 max-h-96 overflow-y-auto">
        <li><div class="divider my-1">SYSTEM</div></li>
        <%= for theme <- @themes.default do %>
          <.theme_toggle_list_item theme={theme} />
        <% end %>
        <li><div class="divider my-1">LIGHT</div></li>
        <%= for theme <- @themes.light do %>
          <.theme_toggle_list_item theme={theme} />
        <% end %>
        <li><div class="divider my-1">DARK</div></li>
        <%= for theme <- @themes.dark do %>
          <.theme_toggle_list_item theme={theme} />
        <% end %>
      </ul>
    </div>
    """
  end

  attr :theme, :map, required: true

  def theme_toggle_list_item(assigns) do
    ~H"""
    <li>
      <button
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme={@theme.name}
        class="flex items-center gap-2"
      >
        <.icon name={@theme.icon} class={"size-4 #{@theme.color}"} />
        <%= String.capitalize(@theme.name) %>
      </button>
    </li>
    """
  end
end
