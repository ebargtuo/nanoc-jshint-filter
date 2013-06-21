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

        # Raise an exception since a fatal error is probably a show stopper.
        raise RuntimeError, "jshint: fatal error" if report =~ /fatal error/
    end

    # A textual filter should return the content (in our case unchanged).
    content
  end
end