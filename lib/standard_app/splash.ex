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
end
