require 'dotenv/load'
require_relative 'src/proof_of_work'

TARGETS = ARGV[0..-2]
OUTPUT_FILE = ARGV.last

File.write(OUTPUT_FILE, "Target, String, Hash\n")

TARGETS.each do |target|
    string, hash = ProofOfWork.new().perform(target)
    File.write(OUTPUT_FILE, "#{target}, #{string}, #{hash}\n", mode: 'a')
end
