Project.delete_all
User.delete_all

User.create(email: 'onurkucukkece@ahtung.co', password: '12qw34ER', password_confirmation: '12qw34ER')
User.create(email: 'dunyakirkali@ahtung.co', password: '12qw34ER', password_confirmation: '12qw34ER')

FactoryGirl.create_list(:project, 10)
