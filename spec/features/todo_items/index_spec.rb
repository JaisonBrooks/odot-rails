require 'spec_helper'

describe 'Viewing TODO ITEMS' do
  
  let!(:todo_list) { TodoList.create(title: 'Test title', description: 'Test descrption')}
  
  it 'displays no items when a todo list is empty' do
    visit '/todo_lists'
    
    within "#todo_list_#{todo_list.id}" do
      click_link 'List Items'
    end
    
    expect(page).to have_content('TodoItems')
    
  end
end