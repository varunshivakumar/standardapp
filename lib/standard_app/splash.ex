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
      %{name: "system", icon: "hero-computer-desktop-micro", color: "bg-gray-500", type: "light"},
      %{name: "light", icon: "hero-sun-micro", color: "bg-yellow-400", type: "light"},
      %{name: "dark", icon: "hero-moon-micro", color: "bg-gray-700", type: "dark"},
      %{name: "corporate", icon: "hero-building-office-2", color: "bg-primary", type: "light"},
      %{name: "winter", icon: "hero-snowflake", color: "bg-blue-500", type: "light"},
      %{name: "business", icon: "hero-briefcase", color: "bg-gray-700", type: "dark"},
      %{name: "dracula", icon: "hero-vampire", color: "bg-purple-600", type: "dark"},
      %{name: "cupcake", icon: "hero-cake", color: "bg-pink-300", type: "light"},
      %{name: "cyberpunk", icon: "hero-cpu-chip", color: "bg-yellow-400", type: "light"},
      %{name: "synthwave", icon: "hero-musical-note", color: "bg-purple-500", type: "dark"},
      %{name: "retro", icon: "hero-clock", color: "bg-orange-400", type: "light"},
      %{name: "halloween", icon: "hero-ghost", color: "bg-orange-600", type: "dark"},
      %{name: "garden", icon: "hero-flower", color: "bg-green-500", type: "light"},
      %{name: "forest", icon: "hero-tree", color: "bg-green-700", type: "dark"},
      %{name: "aqua", icon: "hero-droplet", color: "bg-cyan-500", type: "dark"},
      %{name: "lofi", icon: "hero-music-note", color: "bg-gray-300", type: "light"},
      %{name: "pastel", icon: "hero-palette", color: "bg-pink-200", type: "light"},
      %{name: "fantasy", icon: "hero-sparkles", color: "bg-purple-300", type: "light"},
      %{name: "wireframe", icon: "hero-square-3-stack-3d", color: "bg-gray-500", type: "light"},
      %{name: "black", icon: "hero-moon", color: "bg-black", type: "dark"},
      %{name: "luxury", icon: "hero-crown", color: "bg-yellow-600", type: "dark"},
      %{name: "bumblebee", icon: "hero-bug-ant", color: "bg-yellow-300", type: "light"},
      %{name: "emerald", icon: "hero-gem", color: "bg-green-400", type: "light"},
      %{name: "valentine", icon: "hero-heart", color: "bg-pink-400", type: "light"},
      %{name: "acid", icon: "hero-beaker", color: "bg-green-400", type: "light"},
      %{name: "cmyk", icon: "hero-printer", color: "bg-blue-600", type: "light"},
      %{name: "autumn", icon: "hero-leaf", color: "bg-orange-500", type: "light"},
      %{name: "lemonade", icon: "hero-glass", color: "bg-yellow-300", type: "light"},
      %{name: "night", icon: "hero-moon-stars", color: "bg-blue-800", type: "dark"},
      %{name: "coffee", icon: "hero-mug-hot", color: "bg-amber-700", type: "dark"},
      %{name: "dim", icon: "hero-adjustments-horizontal", color: "bg-gray-600", type: "dark"},
      %{name: "nord", icon: "hero-mountain", color: "bg-blue-400", type: "light"},
      %{name: "sunset", icon: "hero-sun", color: "bg-red-500", type: "dark"},
      %{name: "caramellatte", icon: "hero-coffee", color: "bg-amber-400", type: "light"},
      %{name: "abyss", icon: "hero-eye", color: "bg-blue-900", type: "dark"},
      %{name: "silk", icon: "hero-sparkles", color: "bg-gray-200", type: "light"}
    ]
  end
end
