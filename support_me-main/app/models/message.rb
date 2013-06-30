class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :id,
                :objectId,
                :author_id,
                :author_type,
                :chat_id,
                :content,
                :created_at,
                :updated_at

  def initialize(params = {})
    @id          = params["id"]
    @objectId    = @id
    @author_id   = params["author_id"]
    @author_type = params["author_type"]
    @chat_id     = params["chat_id"]
    @content     = params["content"]
    @created_at  = params["created_at"] ? DateTime.parse(params["created_at"]) : DateTime.now
    @updated_at  = params["updated_at"] ? DateTime.parse(params["updated_at"]) : DateTime.now
  end

  def id
    return self.objectId
  end

  def persisted?
    !(self.id.nil?)
  end
end
