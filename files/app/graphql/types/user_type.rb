Types::UserType = GraphQL::ObjectType.define do
  interfaces [Interfaces::ActiveRecordObjectInterface]
  name 'User'
  description 'A user'

  field :email, types.String
  field :name, types.String
end
