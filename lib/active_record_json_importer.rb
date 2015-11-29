# encoding: utf-8

module ActiveRecordJsonImporter

	class Importer

		attr_reader   :active_record_class, :options, :bulk_input_file
		attr_accessor :records_at_once

		RECORDS_AT_ONCE = 5000

		def initialize(options = {})
			@options = options
			initialize_active_record_class
			initialize_bulk_input_file
			initialize_records_at_once
		end

		def import
			records = []
			bulk_input_file.each_with_index do |line, index|
				records << JSON.parse(line)
				if (index % records_at_once == 0)
					import_records records
					records = []
				end
			end
			bulk_input_file.close
			import_records records if records.any?
			return true
		end

		private

		def initialize_active_record_class
			obj = options[:active_record_class]
			msg = "invalid active_record_class."
			if obj.present? and obj.ancestors.include? ActiveRecord::Base
				@active_record_class = obj
			else
				fail RuntimeError, "#{msg} #{obj}"
			end
		rescue
			raise RuntimeError, "#{msg} #{obj}"
		end

		def initialize_records_at_once
			@records_at_once = options[:records_at_once] || RECORDS_AT_ONCE
		end

		def initialize_bulk_input_file
			@bulk_input_file = File.open(options[:file], "r")
		end

		def import_records records
			active_records = records.map{|record| active_record_class.new record}
			active_record_class.import(active_records, validate: false)
		end
	end
end