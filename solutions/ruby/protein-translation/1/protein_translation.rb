=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end

class InvalidCodonError < StandardError; end
class Translation

    MAP = <<-COD
        AUG                   | Methionine
        UUU, UUC              | Phenylalanine
        UUA, UUG              | Leucine
        UCU, UCC, UCA, UCG    | Serine
        UAU, UAC              | Tyrosine
        UGU, UGC              | Cysteine
        UGG                   | Tryptophan
        UAA, UAG, UGA         | STOP
    COD

    def self.of_codon(input)
        codons[input]
    end

    def self.of_rna(input)
        return [] if input.size < 3 || of_codon(input[0..2]) == 'STOP'
        raise InvalidCodonError unless codons.keys.include?(input[0..2])


        [of_codon(input[0..2])] + of_rna(input[3..-1])
    end

    def self.codons
        result = {}

        MAP.split("\n").map do |line|
            keys, value = line.split("|")
            
            keys.scan(/\w\w\w/).each do |key|
                result[key] = value.strip
            end
        end

        result 
    end
end