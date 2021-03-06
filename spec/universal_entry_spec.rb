require 'spec_helper'

describe 'UniversalEntry' do
  before do
    @fs = '/'.to_entry_on(Vfs::Storages::HashFs.new)
    @path = @fs['/a/b/c']
  end
  
  describe 'existence' do
    it "should check both files and dirs" do
      @path.should_not exist
      @path.dir.create
      @path.should be_dir      
      @path.should exist
      
      @path.file.create!
      @path.should be_file
      @path.should exist
    end
  end
  
  describe 'destroying' do
    it "should destroy both files and dirs" do
      @path.dir.create
      @path.should be_dir
      @path.destroy
      @path.should_not exist      
      
      @path.file.create
      @path.should be_file
      @path.destroy
      @path.should_not exist
    end
    
    it "shouldn't raise if file not exist" do
      @path.destroy
    end
  end
  
  describe 'copy_to'
  describe 'move_to'
end