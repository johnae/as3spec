class ClassGenerator < SuiteGenerator  # :nodoc:

  def manifest
    record do |m|
      if (!user_requested_test)
        m.directory full_class_dir
        m.template 'Class.as', full_class_path
      end
 
      m.directory full_test_dir
      m.template '../../spec/templates/Spec.as', full_test_case_path
      m.template '../../suite/templates/SpecSuite.as', File.join(model.spec_dir, 'SpecSuite.as'), :collision => :force
      m.template '../../suite/templates/SpecSuiteXML.as', File.join(model.spec_dir, 'SpecSuiteXML.as'), :collision => :force
    end
  end

end