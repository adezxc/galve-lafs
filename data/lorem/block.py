import sys

if len(sys.argv) != 2:
    print("Usage: python script.py <input_file_path>")
    sys.exit(1)

input_file_path = sys.argv[1]
output_file_path = input_file_path + "_block"

start_byte = 48 # 0-based index, so 37th byte is at index 36
end_byte = 12514  # 0-based index, so 12467th byte is at index 12466

with open(input_file_path, 'rb') as input_file:
    input_file.seek(start_byte)
    fragment_data = input_file.read(end_byte - start_byte + 1)

with open(output_file_path, 'wb') as output_file:
    output_file.write(fragment_data)

print(f"Fragment extracted from {input_file_path} and saved to {output_file_path}")

