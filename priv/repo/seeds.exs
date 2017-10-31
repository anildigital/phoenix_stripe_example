# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixStripeExample.Repo.insert!(%PhoenixStripeExample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
PhoenixStripeExample.Repo.delete_all(PhoenixStripeExample.Coherence.User)

PhoenixStripeExample.Coherence.User.changeset(%PhoenixStripeExample.Coherence.User{}, %{
  name: "Test User",
  email: "testuser@example.com",
  password: "secret",
  password_confirmation: "secret"
})
|> PhoenixStripeExample.Repo.insert!()
