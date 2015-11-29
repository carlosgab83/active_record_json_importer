# encoding: utf-8

RSpec.describe ActiveRecordJsonImporter::Importer do

		context "with valid ActiveRecord class" do

			before(:all) do
				@table_name 				 = "pools"
				@file_name  				 = "input.json"
				@invalid_file_name   = "invalid_input.json"

				create_test_table_and_activerecord(@table_name)

				@active_record_class = @table_name.singularize.camelize.constantize

				create_valid_json_file(@file_name)
				create_invalid_json_file(@invalid_file_name)
			end

			after(:all) do
				drop_test_table(@table_name)
				delete_json_file(@file_name)
				delete_json_file(@invalid_file_name)
			end

			context "with valid input" do
				it "imports the file" do
					importer = ActiveRecordJsonImporter::Importer.new(file: @file_name,
																														active_record_class: @active_record_class)
					expect(importer.import).to be_truthy
					expect(@active_record_class.count).to eq(2)
				end
			end

			context "with invalid input" do
				it "raises an Exception" do
					importer = ActiveRecordJsonImporter::Importer.new(file: @invalid_file_name,
																														active_record_class: @active_record_class)
					expect{importer.import}.to raise_exception(JSON::ParserError)
				end
			end

		end

		context "with invalid ActiveRecord class" do
			it "raises an Exception" do
					expect{importer = ActiveRecordJsonImporter::Importer.new(file: @invalid_file_name,
																																		active_record_class: "any object")}.to raise_exception(RuntimeError, "invalid active_record_class. any object")
				end
		end
end