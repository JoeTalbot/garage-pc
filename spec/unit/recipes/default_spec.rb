#
# Cookbook Name:: garage-pc
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'garage-pc::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'creates the temp directory' do
      expect { chef_run }.to create_directory('c:\temp')
    end
  end
end
