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
    link_to '', "https://www.facebook.com/#{page_path}", class: 'facebook_link', target: '_blank'
  end
end
