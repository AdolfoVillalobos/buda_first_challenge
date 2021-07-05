TARGET=b00da b000da
MAIN=main.rb
OUTPUT=output/proof_of_work.txt

all:
	@ruby $(MAIN) $(TARGET) $(OUTPUT)
