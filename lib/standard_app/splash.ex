defmodule StandardApp.Splash do
  @moduledoc """
  The Splash module is responsible for rendering the splash page.
  """

  def get_images do
    [
      %{
        src: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 1"
      },
      %{
        src: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 2"
      },
      %{
        src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 3"
      },
      %{
        src: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 4"
      },
      %{
        src: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 5"
      },
      %{
        src: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 6"
      },
      %{
        src: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 7"
      },
      %{
        src: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 8"
      },
      %{
        src: "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=135&h=200&fit=crop&crop=face",
        alt: "Portrait 9"
      }
    ]
  end

  def get_themes do
    [
      %{name: "system",        icon: "hero-computer-desktop-micro",    color: "bg-gray-500",    type: "light"},
      %{name: "light",         icon: "hero-sun-micro",                 color: "bg-yellow-400",  type: "light"},
      %{name: "dark",          icon: "hero-moon-micro",                color: "bg-gray-700",    type: "dark"},
      %{name: "corporate",     icon: "hero-building-office-2",         color: "bg-primary",     type: "light"},
      %{name: "winter",        icon: "hero-cloud-micro",              color: "bg-blue-500",    type: "light"},
      %{name: "business",      icon: "hero-briefcase",                 color: "bg-gray-700",    type: "dark"},
      %{name: "dracula",       icon: "hero-moon-micro",                color: "bg-purple-600",  type: "dark"},
      %{name: "cupcake",       icon: "hero-cake",                      color: "bg-pink-300",    type: "light"},
      %{name: "cyberpunk",     icon: "hero-cpu-chip",                  color: "bg-yellow-400",  type: "light"},
      %{name: "synthwave",     icon: "hero-musical-note",              color: "bg-purple-500",  type: "dark"},
      %{name: "retro",         icon: "hero-clock",                     color: "bg-orange-400",  type: "light"},
      %{name: "halloween",     icon: "hero-moon-micro",                color: "bg-orange-600",  type: "dark"},
      %{name: "garden",        icon: "hero-home-micro",                color: "bg-green-500",   type: "light"},
      %{name: "forest",        icon: "hero-home-micro",                color: "bg-green-700",   type: "dark"},
      %{name: "aqua",          icon: "hero-cloud-micro",              color: "bg-cyan-500",    type: "dark"},
      %{name: "lofi",          icon: "hero-musical-note-micro",        color: "bg-gray-300",    type: "light"},
      %{name: "pastel",        icon: "hero-paint-brush-micro",         color: "bg-pink-200",    type: "light"},
      %{name: "fantasy",       icon: "hero-sparkles",                  color: "bg-purple-300",  type: "light"},
      %{name: "wireframe",     icon: "hero-square-3-stack-3d",         color: "bg-gray-500",    type: "light"},
      %{name: "black",         icon: "hero-moon",                      color: "bg-black",       type: "dark"},
      %{name: "luxury",        icon: "hero-star-micro",                color: "bg-yellow-600",  type: "dark"},
      %{name: "bumblebee",     icon: "hero-bug-ant",                   color: "bg-yellow-300",  type: "light"},
      %{name: "emerald",       icon: "hero-sparkles-micro",             color: "bg-green-400",   type: "light"},
      %{name: "valentine",     icon: "hero-heart",                     color: "bg-pink-400",    type: "light"},
      %{name: "acid",          icon: "hero-beaker",                    color: "bg-green-400",   type: "light"},
      %{name: "cmyk",          icon: "hero-printer",                   color: "bg-blue-600",    type: "light"},
      %{name: "autumn",        icon: "hero-fire-micro",                color: "bg-orange-500",  type: "light"},
      %{name: "lemonade",      icon: "hero-beaker-micro",              color: "bg-yellow-300",  type: "light"},
      %{name: "night",         icon: "hero-moon-micro",                color: "bg-blue-800",    type: "dark"},
      %{name: "coffee",        icon: "hero-cake-micro",                color: "bg-amber-700",   type: "dark"},
      %{name: "dim",           icon: "hero-adjustments-horizontal",    color: "bg-gray-600",    type: "dark"},
      %{name: "nord",          icon: "hero-home-micro",                color: "bg-blue-400",    type: "light"},
      %{name: "sunset",        icon: "hero-sun",                       color: "bg-red-500",     type: "dark"},
      %{name: "caramellatte",  icon: "hero-cake-micro",                color: "bg-amber-400",   type: "light"},
      %{name: "abyss",         icon: "hero-eye",                       color: "bg-blue-900",    type: "dark"},
      %{name: "silk",          icon: "hero-sparkles",                  color: "bg-gray-200",    type: "light"}
    ]
  end

  def get_theme_sections do
    default_themes = get_themes() |> Enum.filter(fn theme -> theme.name in ["system", "light", "dark"] end)
    other_themes = get_themes() |> Enum.filter(fn theme -> theme.name not in ["system", "light", "dark"] end)
    %{
      default: default_themes,
      light: other_themes |> Enum.filter(fn theme -> theme.type == "light" end),
      dark: other_themes |> Enum.filter(fn theme -> theme.type == "dark" end),
    }
  end
end
