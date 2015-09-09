class IvyC < Project
  
  c
  svn 'https://svn.tls.cena.fr/svn/ivy/ivy-c', { :args => '--trust-server-cert' }
  redmine 'http://dcps.onera/redmine', 'ivyc'
  
  def @scm_tool.resolve_url options
    if options.has_key? :version then
      raise Error, 'Not implemented'
    else
      return Pathname.new(@url).join('trunk').join('src').to_s
    end
  end
  
end
