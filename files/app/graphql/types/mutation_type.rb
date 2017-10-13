Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The mutation root of this schema'
  field :createUser, function: Mutations::CreateUser.new
end
