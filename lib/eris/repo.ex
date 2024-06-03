defmodule Eris.Repo do
  use Ecto.Repo,
    otp_app: :eris,
    adapter: Ecto.Adapters.MyXQL
end
