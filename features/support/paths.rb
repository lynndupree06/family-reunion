module NavigationHelpers
  def path_to(page_name)
    case page_name

      when /Registration/
        '/register'

    end
  end
end

World(NavigationHelpers)
