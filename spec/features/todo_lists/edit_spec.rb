require 'spec_helper'

describe 'Edit todo lists' do
  
  let!(:todo_list) { 
    TodoList.create(title: 'Do something cool', description: 'Be yourself and have fun') 
  }
  
  def update_todo_list(options={})
    options[:title] ||= 'Todolist title'
    options[:description] ||= 'Todolist desription'
    
    todo_list = options[:todo_list]
    
    visit '/todo_lists'
    
    within "#todo_list_#{todo_list.id}" do
      click_link 'Edit'
    end
    
    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Update Todo list'
    
  end
  
  it 'updates a todo list successfully with correct info' do
        
    update_todo_list title: 'New Todo', description: 'New description', todo_list: todo_list
    
    todo_list.reload
    
    expect(page).to have_content('Todo list was successfully updated')
    expect(todo_list.title).to eq 'New Todo'
    expect(todo_list.description).to eq 'New description'
    
  end
  
  it 'display an error with no title' do
    update_todo_list todo_list: todo_list, title: ''
    expect(page).to have_content('error')
  end
  
  it 'display an error with a title less than 3 chars' do
    update_todo_list todo_list: todo_list, title: 'Hi'
    expect(page).to have_content('error')
  end
  
  it 'display an error with no descrption' do
    update_todo_list todo_list: todo_list, description: ''
    expect(page).to have_content('error')
  end
  
  it 'display an error with a description less than 5 chars' do
    update_todo_list todo_list: todo_list, description: 'foo'
    expect(page).to have_content('error')
  end
  
  
end