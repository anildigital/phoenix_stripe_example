defmodule StripeTool do
  def create_customer(stripe_email, stripe_token) do
    Stripe.Customer.create(%{
      email: stripe_email,
      source: stripe_token
    })
  end

  def create_charge(customer_id, charge, description) do
    Stripe.Charge.create(
      customer: customer_id,
      amount: charge,
      currency: "usd",
      description: description
    )
  end

  def create_membership(email, stripe_token, plan) do
    Stripe.Customer.create(%{
      email: email,
      source: stripe_token,
      plan: plan
    })
  end
end
