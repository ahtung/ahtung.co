# ApplicationHelper
module ApplicationHelper
  def favicons
    capture do
      [57, 60, 72, 76].each do |size|
        concat favicon_link_tag "apple-touch-icon-#{size}x#{size}.png", rel: 'apple-touch-icon', type: 'image/png', sizes: "#{size}x#{size}"
        concat favicon_link_tag "apple-touch-icon-#{size}x#{size}@2x.png", rel: 'apple-touch-icon', type: 'image/png', sizes: "#{size * 2}x#{size * 2}"
      end
      [16, 32].each do |size|
        concat favicon_link_tag "favicon-#{size}x#{size}.png", rel: 'icon', type: 'image/png', sizes: "#{size}x#{size}"
      end
    end
  end

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
