# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:alice)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'ユーザ'
  end

  test 'creating a User' do
    visit users_url
    click_on 'ログアウト'
    click_on 'アカウント登録'
    fill_in 'Eメール', with: 'bob@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_on 'アカウント登録'
    assert_text 'アカウント登録が完了しました。'
  end

  test 'updating a User' do
    visit users_url
    click_on 'アカウント編集'
    fill_in 'Eメール', with: 'new@example.com'
    fill_in '現在のパスワード', with: 'password'
    click_button '更新'
    assert_text 'アカウント情報を変更しました。'
    assert_text 'new@example.com'
  end

  test 'destroying a User' do
    visit users_url
    click_on 'アカウント編集'
    page.accept_confirm do
      click_button 'アカウント削除'
    end
    assert_text 'アカウントを削除しました。またのご利用をお待ちしております。'
  end
end
