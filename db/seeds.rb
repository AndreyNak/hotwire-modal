# frozen_string_literal: true

password = '!Password123??'

User.create(
  [
    { email: 'first_user@gmail.com', password:, password_confirmation: password },
    { email: 'second_user@gmail.com', password:, password_confirmation: password }
  ]
)
