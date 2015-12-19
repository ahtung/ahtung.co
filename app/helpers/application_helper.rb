# ApplicationHelper
module ApplicationHelper
  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+#{sets_of_numbers.join('-')}"
    link_to "tel://#{number}", class: 'waves-effect btn amber lighten-1' do
      '<i class="material-icons">phone</i>'.html_safe
    end
  end

  def facebook_link(page_path)
    link_to 'f', "https://www.facebook.com/#{page_path}", class: 'white-text', target: '_blank'
  end

  def twitter_link(page_path)
    link_to 't', "https://twitter.com/#{page_path}", class: 'white-text', target: '_blank'
  end
end
