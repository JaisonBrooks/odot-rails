require 'spec_helper'

describe 'Creating TODO LISTS' do
  
  it 'redirects to the todo list index page on success' do
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')
    
    fill_in 'Title', with: 'My todo list'
    fill_in 'Description', with: 'This is what im doing today'
    
    click_button 'Create Todo list'
    
    expect(page).to have_content 'My todo list'
    
  end
  
  it 'displays an error when the todo list has no title' do
    
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')
    
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'This is what im doing today'
    
    click_button 'Create Todo list'
    
    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    expect(page).to_not have_content('This is what im doing today')
    
  end
  
  it 'displays an error when the todo list has no title less than 3 chars' do
    
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')
    
    fill_in 'Title', with: 'Hi'
    fill_in 'Description', with: 'This is what im doing today'
    
    click_button 'Create Todo list'
    
    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    expect(page).to_not have_content('This is what im doing today')
    
  end
  
  it 'displays an error when the todo list has no description' do
    
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')
    
    fill_in 'Title', with: 'Some Title'
    fill_in 'Description', with: ''
    
    click_button 'Create Todo list'
    
    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    expect(page).to_not have_content('Some Title')
    
  end
  
  it 'displays an error when the todo list has no description less than 5 chars' do
    
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')
    
    fill_in 'Title', with: 'A todo title'
    fill_in 'Description', with: '1234'
    
    click_button 'Create Todo list'
    
    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)
    
    visit '/todo_lists'
    expect(page).to_not have_content('A todo title')
    
  end
  
end