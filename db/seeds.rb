# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
   {email: "admin@admin.com", password: "adminpass", password_confirmation: "adminpass", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
   {email: "testuser@mvmanor.co.uk", password: "testuseraccount", password_confirmation: "testuseraccount", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
   {email: "testcustomer@customer.co.uk", password: "testcustomeruser", password_confirmation: "testcustomeruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])

Website.create!([
    {url: "http://maelmayon.fr/", user_id: 1}
])

Stat.create!([
    {website_id: 1, scorePerf: 87, scoreSpider: 98, scoreW3C: 85, date: "2018-07-18 05:14:19.279"},
    {website_id: 1, scorePerf: 81, scoreSpider: 84, scoreW3C: 98, date: "2018-07-17 05:14:19.279"},
    {website_id: 1, scorePerf: 79, scoreSpider: 72, scoreW3C: 96, date: "2018-07-16 05:14:19.279"},
    {website_id: 1, scorePerf: 74, scoreSpider: 87, scoreW3C: 80, date: "2018-07-15 05:14:19.279"},
    {website_id: 1, scorePerf: 82, scoreSpider: 92, scoreW3C: 78, date: "2018-07-14 05:14:19.279"},
    {website_id: 1, scorePerf: 89, scoreSpider: 96, scoreW3C: 74, date: "2018-07-13 05:14:19.279"},
    {website_id: 1, scorePerf: 93, scoreSpider: 85, scoreW3C: 78, date: "2018-07-12 05:14:19.279"},
    {website_id: 1, scorePerf: 84, scoreSpider: 77, scoreW3C: 80, date: "2018-07-11 05:14:19.279"},
    {website_id: 1, scorePerf: 74, scoreSpider: 82, scoreW3C: 76, date: "2018-07-10 05:14:19.279"}
])
