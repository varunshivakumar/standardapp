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
    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
        <.icon name="hero-swatch" class="size-5" />
      </div>
      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52 max-h-96 overflow-y-auto">
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="system"
            class="flex items-center gap-2"
          >
            <.icon name="hero-computer-desktop-micro" class="size-4" />
            System
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="light"
            class="flex items-center gap-2"
          >
            <.icon name="hero-sun-micro" class="size-4" />
            Light
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="dark"
            class="flex items-center gap-2"
          >
            <.icon name="hero-moon-micro" class="size-4" />
            Dark
          </button>
        </li>
        <li><div class="divider my-1"></div></li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="corporate"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-primary"></div>
            Corporate
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="winter"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-blue-500"></div>
            Winter
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="business"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-gray-700"></div>
            Business
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="dracula"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-purple-600"></div>
            Dracula
          </button>
        </li>
        <li><div class="divider my-1"></div></li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="cupcake"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-pink-300"></div>
            Cupcake
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="cyberpunk"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-yellow-400"></div>
            Cyberpunk
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="synthwave"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-purple-500"></div>
            Synthwave
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="retro"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-orange-400"></div>
            Retro
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="halloween"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-orange-600"></div>
            Halloween
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="garden"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-green-500"></div>
            Garden
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="forest"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-green-700"></div>
            Forest
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="aqua"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-cyan-500"></div>
            Aqua
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="lofi"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-gray-300"></div>
            Lo-Fi
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="pastel"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-pink-200"></div>
            Pastel
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="fantasy"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-purple-300"></div>
            Fantasy
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="wireframe"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-gray-500"></div>
            Wireframe
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="black"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-black"></div>
            Black
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="luxury"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-yellow-600"></div>
            Luxury
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="cmyk"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-blue-600"></div>
            CMYK
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="autumn"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-orange-500"></div>
            Autumn
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="acid"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-green-400"></div>
            Acid
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="lemonade"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-yellow-300"></div>
            Lemonade
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="night"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-blue-800"></div>
            Night
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="coffee"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-brown-600"></div>
            Coffee
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="dim"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-gray-600"></div>
            Dim
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="nord"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-blue-400"></div>
            Nord
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="sunset"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-red-500"></div>
            Sunset
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="caramellatte"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-amber-400"></div>
            Caramel Latte
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="abyss"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-blue-900"></div>
            Abyss
          </button>
        </li>
        <li>
          <button
            phx-click={JS.dispatch("phx:set-theme")}
            data-phx-theme="silk"
            class="flex items-center gap-2"
          >
            <div class="w-4 h-4 rounded bg-gray-200"></div>
            Silk
          </button>
        </li>
      </ul>
    </div>
    """
  end
end
