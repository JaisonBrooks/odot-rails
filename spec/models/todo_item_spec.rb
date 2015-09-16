require 'spec_helper'

describe TodoItem, type: :model do
  it { should belong_to(:todo_list) }
end
