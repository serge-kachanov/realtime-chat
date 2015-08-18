class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :user

  def user
    object.user.name
  end
end
