require "spec_helper"
require "chef/chef_fs/file_system/repository/chef_repository_file_system_root_dir"

describe Chef::ChefFS::FileSystem::Repository::ChefRepositoryFileSystemRootDir do
  let(:tmp_path) { Dir.mktmpdir }
  let(:nodes_path) { File.join(tmp_path, "nodes") }
  let(:child_paths) { { "nodes" => [nodes_path] } }
  let(:root_dir) { described_class.new(child_paths) }

  describe "#create_child" do
    it "sets permissions correctly" do
      expect(Dir).to receive(:mkdir).with(nodes_path, 0700)
      root_dir.create_child("nodes")
    end
  end
end
