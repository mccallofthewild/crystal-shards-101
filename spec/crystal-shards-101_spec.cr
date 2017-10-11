require "./spec_helper"

describe CrystalShards101 do
  # TODO: Write tests
  dir_name = "./spec/test-files"
  
  it "is literally just a README" do
    true.should eq(true)
  end

  describe CrystalShards101::DocumentBuilder do  
    
    it "#initialize" do
      builder = CrystalShards101::DocumentBuilder.new out_dir: "./gh-pages"
      true.should eq true
    end

    it "#build_html" do
      file_name = "README.md"

      builder = CrystalShards101::DocumentBuilder.new out_dir: dir_name

      Dir.mkdir dir_name
      file_location = "#{dir_name}/#{file_name}"
      File.write file_location, content: "# Example Heading :)"

      html_exists = builder.build_html(file_location).includes? "<h1>"

      FileUtils.rm_rf dir_name
      html_exists.should eq true
    end

    it "#clear_dir" do  
      builder = CrystalShards101::DocumentBuilder.new out_dir: dir_name
      builder.clear_dir dir_name
      exists = Dir.exists? dir_name
      exists.should eq false
    end

    it "#update's" do 
      file_name = "README.md"

      builder = CrystalShards101::DocumentBuilder.new md_file: "#{dir_name}/#{file_name}", out_dir: dir_name

      Dir.mkdir dir_name

      file_location = "#{dir_name}/#{file_name}"

      File.write file_location, content: "# Example Heading :)"

      builder.update

      first_html_content = File.read "#{dir_name}/index.html"

      File.write file_location, content: "# Different Example Heading :)"

      builder.update

      second_html_content = File.read "#{dir_name}/index.html"

      content_updated = first_html_content != second_html_content
      FileUtils.rm_rf dir_name
      
      content_updated.should eq true
    end

    FileUtils.rm_rf dir_name    

  end

end
