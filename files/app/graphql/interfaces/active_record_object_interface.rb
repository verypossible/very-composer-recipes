Interfaces::ActiveRecordObjectInterface = GraphQL::InterfaceType.define do
  name 'ActiveRecord'
  description 'Active Record Interface'

  field :id, types.Int
  field :updated_at do
    type types.Int

    resolve ->(obj, _args, _ctx) { obj.updated_at.to_i }
  end
  field :created_at do
    type types.Int

    resolve ->(obj, _args, _ctx) { obj.created_at.to_i }
  end
end
