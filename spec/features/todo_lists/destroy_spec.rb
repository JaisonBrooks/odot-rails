require 'spec_helper'

describe 'Deleteing todo lists' do
  
  let!(:todo_list) { 
    TodoList.create(title: 'Do something cool', description: 'Be yourself and have fun') 
  }
  
  it 'is successfully when clicking the destroy link' do
    visit '/todo_lists'
    
    within "#todo_list_#{todo_list.id}" do
      click_link 'Destroy'
    end
    expect(page).to_not have_content(todo_list.title)
    expect(TodoList.count).to eq(0)
    
  end

  
end