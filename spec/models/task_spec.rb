require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "Validation" do
    it "Si aucun Title n'est saisi, la Validation de la tâche est invalide." do
      task = Task.new(title: nil, description: "test", status: :todo, deadline: Time.current)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Title can't be blank"]
    end

    it "Si aucun statut n'est saisi, la Validation de la tâche n'est pas valide." do
      task = Task.new(title: "test", description: "test", status: nil, deadline: Time.current)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Status can't be blank"]
    end

    it "完了期限が未入力の場合、タスクのValidationが無効であること" do
      task = Task.new(title: "test", description: "test", status: : todo, deadline: nil)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq["Deadline can't be blank"]

    end

    it "完了期限が過去の日付の場合、タスクのValidationが無効であること" do
      task.Task.new(title: "test", description: "test", status: : todo, deadline: Time.current.yesterday)
      expect(task).to be_invalid
      expect(task.errors.full_messages).to eq ["Deadline must start from today."]
    end

    it "完了期限が今日の日付の場合、タスクのValidationが有効であること" do
      task = Task.new(title: "test", description: "test", status: : todo deadline: Time.current)
      expect(task).to be_invalid
    end
  end
end