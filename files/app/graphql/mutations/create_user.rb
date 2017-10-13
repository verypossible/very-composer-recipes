class Mutations::CreateUser < GraphQL::Function
  argument :email, !types.String
  argument :name, !types.String
  argument :password, !types.String

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(args.to_h)
  end
end
