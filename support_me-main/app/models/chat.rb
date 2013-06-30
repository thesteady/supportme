class Chat
  attr_accessor :id,
                :customer_id,
                :status,
                :user_id,
                :created_at,
                :updated_at

  def initialize(params = {})
    @id          = params["id"]
    @customer_id = params["customer_id"]
    @status      = params["status"] || "waiting"
    @user_id     = params["user_id"]
    @created_at  = params["created_at"] ? DateTime.parse(params["created_at"]) : DateTime.now
    @updated_at  = params["update_at"] ? DateTime.parse(params["updated_at"]) : DateTime.now
  end
end