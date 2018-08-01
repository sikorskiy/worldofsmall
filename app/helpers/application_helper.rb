module ApplicationHelper
  def current_class?(test_path)
    request.path == test_path ? 'active' : ''
  end

  def full_title(page_title = '')
    base_title = "Внимательный подход к детским книгам"
    if page_title.empty?
      "WorldOfSmall | " + base_title
    else
      "WorldOfSmall | " + page_title + " | " + base_title
    end
  end

end
