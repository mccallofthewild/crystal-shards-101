require "./crystal-shards-101/*"
require "markdown"
require "file_utils"

module CrystalShards101

  # A class to build static, materialize-themed website files from markdown
  class DocumentBuilder 

    # Basic initializer
    def initialize(
      @out_dir : String,
      @md_file : String = "README.md",
      @out_html_filename : String = "index.html",
      @clear_out_dir = true
    )
    end

    # Builds html from specified markdown `file_name`
    def build_html(file_name : String)
      contents = File.read file_name
      md_as_html = Markdown.to_html contents
      %(
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <base target="_blank">          
          <!-- Compiled and minified CSS -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">        
          <title>Crystal Shards 101</title>
          <style>
            html {
              background-image: url(https://source.unsplash.com/YMBpLXZrHmc/1600x900/);
              background-size: cover;
              background-position: center;
              background-repeat: no-repeat;
              background-attachment: fixed;
            }
            ul:not(.browser-default) {
              padding-left: inherit;
              list-style-type: inherit;
            }
            ul:not(.browser-default)>li {
              list-style-type: initial;
              list-style-image: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.2.7/assets/svg/1f48e.svg);
            }
            </style>
          </head>
          <body>
            <div class="container"> 
              <div class="card">
                <div class="card-content"> 
                  #{ md_as_html }
                  <p>Background Photo:</p>
                  <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px;" href="https://unsplash.com/@ghpvisuals?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Grant Porter"><span style="display:inline-block;padding:2px 3px;"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-1px;fill:white;" viewBox="0 0 32 32"><title></title><path d="M20.8 18.1c0 2.7-2.2 4.8-4.8 4.8s-4.8-2.1-4.8-4.8c0-2.7 2.2-4.8 4.8-4.8 2.7.1 4.8 2.2 4.8 4.8zm11.2-7.4v14.9c0 2.3-1.9 4.3-4.3 4.3h-23.4c-2.4 0-4.3-1.9-4.3-4.3v-15c0-2.3 1.9-4.3 4.3-4.3h3.7l.8-2.3c.4-1.1 1.7-2 2.9-2h8.6c1.2 0 2.5.9 2.9 2l.8 2.4h3.7c2.4 0 4.3 1.9 4.3 4.3zm-8.6 7.5c0-4.1-3.3-7.5-7.5-7.5-4.1 0-7.5 3.4-7.5 7.5s3.3 7.5 7.5 7.5c4.2-.1 7.5-3.4 7.5-7.5z"></path></svg></span><span style="display:inline-block;padding:2px 3px;">Grant Porter</span></a>
                </div>
              </div>
            </div>
          </body>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        </html>
      )
    end

    # Clears specified directory and its contents
    def clear_dir(dir_name : String)
      if Dir.exists? dir_name
        FileUtils.rm_rf dir_name
      end
    end
  
    # Writes markdown file contents as HTML to specified filename and directory.
    def update
        if File.exists? @md_file
          
          html = build_html @md_file
          
          if @clear_out_dir 
            clear_dir @out_dir
          end

          Dir.mkdir @out_dir

          File.write filename: "#{@out_dir}/#{@out_html_filename}", content: html
        else 
          raise MarkdownFileNotFoundException.new("Specified markdown file does not exist!")
        end
    end

  end
end


builder = CrystalShards101::DocumentBuilder.new out_dir: "./gh-pages"

builder.update