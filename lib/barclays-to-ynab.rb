require 'yaml'
require 'smarter_csv'
require 'csv'

module BarclaysToYnab
  class Converter
    def convert(path)
      new_path = path + '.ynab.csv'
      transactions = SmarterCSV.process(path)
      headers = %w(Date Payee Memo Inflow Outflow Category)

      File.open(new_path, 'w') do |f|
        f.puts headers.to_csv
        transactions.each do |transaction|

          transaction_hash = {
            'Date' => transaction[:date],
            'Payee' => transaction[:memo].split('  ').first
          }

          if transaction[:amount] > 0
            transaction_hash['Inflow'] = transaction[:amount].abs
          else
            transaction_hash['Outflow'] = transaction[:amount].abs
          end

          f.puts headers.map { |h| transaction_hash[h] }.to_csv
        end
      end

      new_path
    end
  end
end
