# ApplicationHelper
module ApplicationHelper
  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+#{sets_of_numbers.join('-')}"
    link_to "tel://#{number}", class: 'white-text' do
      content_tag :i, '', class: 'icon-phone'
    end
  end

  def facebook_link(page_path)
    link_to "https://www.facebook.com/#{page_path}", class: 'white-text', target: '_blank' do
      content_tag :i, '', class: 'icon-facebook'
    end
  end

  def twitter_link(page_path)
    link_to "https://twitter.com/#{page_path}", class: 'white-text', target: '_blank' do
      content_tag :i, '', class: 'icon-twitter'
    end
  end

  def github_link(page_path)
    link_to "https://github.com/#{page_path}", class: 'white-text', target: '_blank' do
      content_tag :i, '', class: 'icon-github-circled'
    end
  end

  def mail_link(user)
    mail_to user, class: 'white-text' do
      content_tag :i, '', class: 'icon-mail-alt'
    end
  end
end
