require "fileutils"
require "shellwords"

# Copied from: https://github.com/mattbrictson/rails-template
# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "git@github.com:absaldanha/rails-template.git",
      tempdir
    ].map(&:shellescape).join(" ")

    source_paths.unshift(File.dirname(tempdir))
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

add_template_repository_to_source_path
copy_file "lib/constrained_form/form_builer.rb"
