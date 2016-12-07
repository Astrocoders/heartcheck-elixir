defmodule TestRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/monitoring", to: HeartCheck.Plug, heartcheck: MyHeart, functional: MyFunctionalHeart

  forward "/non-functional", to: HeartCheck.Plug, heartcheck: MyHeart

  match _ do
    conn |> send_resp(404, "not found")
  end
end
