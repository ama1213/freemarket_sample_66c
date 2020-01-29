crumb :root do
  link "Fmarket", root_path
end

crumb :show do
  link "マイページ", users_show_path
end

crumb :edit do
  link "プロフィール", users_edit_path
  parent :show
end

crumb :logout do
  link "ログアウト", users_logout_path
  parent :show
end

crumb :payment_method do
  link "支払い方法", users_payment_method_path
  parent :show
end

crumb :identity_information do
  link "本人情報の登録", users_identity_information_path
  parent :show
end
