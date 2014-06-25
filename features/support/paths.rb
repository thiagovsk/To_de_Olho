module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^root page$/
      '/'
    when /^home page$/
      '/home'

    when /^sign-up page$/
      '/usuarios/sign_up'

    when /^convenios page$/
      '/convenios'

    when /^covenant_id page$/
      '/convenios/1'

    when /^sign-in page$/
      '/usuarios/sign_in'

    when /^usuarios page$/
      '/usuarios'
    when /^edit page$/
      '/usuarios/edit'

    when /^show_5 page$/
      '/home/show'

    when /^reclamacoes page$/
      '/reclamacao'

    when /^reclamacoes_id page$/
      '/reclamacao/1'

    when /^convenio_reclamacao_id page$/
      '/convenios/1?reclamacao_id=1'

    when /^reclamacao_facebook_share page$/
      'https://www.facebook.com/sharer/sharer.php?u=reclamacao_url(@reclamacoes)'

    when /^import_covenant page$/
      '/convenios/new'
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
