require 'spec_helper'

describe TodoList, type: :model do
  it { should have_many :todo_items }
end
