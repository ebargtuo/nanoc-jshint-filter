# encoding: utf-8

class JSHintFilter < Nanoc::Filter
  requires 'jshintrb'

  identifier :jshint
  type :text

  def run(content, params={})
    report = Jshintrb.report(content)

    if report != ""
        puts "jshint: #{@item.identifier.chop}.#{@item[:extension]}"
        puts report
    end
    
    # A textual filter should return the content (in our case unchanged).
    content
  end
end