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
])