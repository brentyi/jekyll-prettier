require 'open3'

def command?(command)
  system("which #{ command} > /dev/null 2>&1")
end

if !command?("prettier")
  puts "!!!"
  puts "`prettier` not found; jekyll-prettier will be disabled\e[0m"
  puts "!!!"
else
  # Handle docs
  Jekyll::Hooks.register :documents, :post_render do |doc|
    puts "Running prettier on doc: " + doc.url
    args = ["prettier", "--parser", "html"]
    Open3.popen2(*args) do |stdin, stdout, wait_thr|
      stdin.print doc.output
      stdin.close
      if wait_thr.value.success?
        doc.output = stdout.read
      else
        puts "Prettier encountered an error while formatting the document " + doc.url
      end
    end
  end

  # Handle pages
  Jekyll::Hooks.register :pages, :post_render do |page|
    puts "Running prettier on page: " + page.url
    if page.html?
      args = ["prettier", "--parser", "html"]
    else
      args = ["prettier", "--stdin-filepath", page.relative_path]
    end
    Open3.popen2(*args) do |stdin, stdout, wait_thr|
      stdin.print page.output
      stdin.close
      if wait_thr.value.success?
        page.output = stdout.read
      else
        puts "Prettier encountered an error while formatting the page " + doc.url
      end
    end
  end
end
