#!/bin/zsh:
echo "パスワードマネージャーへようこそ！"

read "service?サービス名を入力してください："
read "username?ユーザー名を入力してください："
read "password?パスワードを入力してください："
echo ${service}:${username}:${password} >> ./account.txt

echo "Thank you!"
