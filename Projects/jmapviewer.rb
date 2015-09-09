class JMapViewer < Project
  
  svn 'http://svn.openstreetmap.org/applications/viewer/jmapviewer'
  ant
  
  def @scm_tool.resolve_url options; @url; end
  
end
