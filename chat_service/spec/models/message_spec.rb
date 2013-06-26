require 'spec_helper'

describe Message do
  context "when receiving correct params" do
    it "creates a message" do
      result = Message.create(
        author_id: 1,
        author_type: "Customer",
        content: "I love goats",
        chat_id: 1
        )
      expect(result).to be_valid
      expect(result.class).to be Message
    end
  end

  context "when receiving incorrect params" do
    it "doesn't create a message when author_id is not present" do
      result = Message.create(
        author_type: "Customer",
        content: "I love goats",
        chat_id: 1
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a message when author_type is not present" do
      result = Message.create(
        author_id: 1,
        content: "I love goats",
        chat_id: 1
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a message when content is not present" do
      result = Message.create(
        author_id: 1,
        author_type: "Customer",
        chat_id: 1
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a message when chat_id is not presend" do
      result = Message.create(
        author_id: 1,
        author_type: "Customer",
        content: "I love goats"
        )
      expect(result).not_to be_valid
    end
  end
end
