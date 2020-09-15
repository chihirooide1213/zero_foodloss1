# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genres = Genre.create!([
	{
		name: '肉'
},
{
	name: '米・穀物類'
},
{
	name: '魚介類'
},
{
	name: '野菜'
},
{
	name: '果物'
},
{
	name: '卵・乳製品'
},
{
	name: '加工品'
},
{
	name: 'その他'
}
])

Client.create!(
	email: 'test@test.com',
	shop_name: 'test',
    shop_name_kana: 'テスト',
    first_name: '太郎',
    last_name: 'テスト',
    first_name_kana: 'テスト',
    last_name_kana: 'テスト',
    postal_code: '123456',
    address: '東京都',
    telephone_number: '09090909090',
    encrypted_password: '123456'
    )