class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :time

  def user
    object.user.name
  end

  def time
    object.created_at.strftime('%H:%M:%S')
  end

end
