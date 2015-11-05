ary = ["Ali", 10, 3.14, 10]

puts "> menghitung isi dalam array"
puts ary.count

puts "> mencetak nilai dalam array"
ary.each do |i|
	puts i
end

puts "> cek panjang sebuah string"
ary[0].length

puts "> penjumlahan cuman buat tipe angka ya"
puts ary[1]+ary[2]+ary[3]+(ary[0].length)

puts "> perulangan dalam ruby, dari 0 hingga 100"
(0..100).each do |kadal|
	print kadal, ' '
end

puts "> jadi bedakan antara print dan puts ya"

puts "> dan sekarang coba buat boolean type ya"
a = true
b = false

if a!=b
	puts "kadal"
else
	puts "kasung"
end

puts "> sekarang belajar Class di Ruby"

class A
	public
	def public_method
		puts "hasil"		
	end

	protected
	def protected_method
		puts "hasil1"
	end
end

puts "> Contoh instance objek baru dan panggil method"
a = A.new
puts "> method yang dibuka dengan public bisa diakses secara langsung oleh objek"
a.public_method

puts "> method yang dibuka dengan protected tidak bisa diakses secara langsung oleh objek, namun bisa dipanggil dalam class atau dalam class inheritance"
class B < A
	public 
	def public_method
		myA = A.new
		myA.protected_method
	end
end
a = B.new.public_method

puts "> kan sudah tahu puts, sekarang belajar perintah gets, untuk input value yang dimasukkan dalam sebuah variabel"
print "input = "
val = gets
print "hasil = ", val



puts "> sekarang belajar IO file ya"
puts "> belajar Read File dulu"
aFile= File.open("wordlist.txt","r")
if aFile
	puts "ada"
	c = 1
	aFile.each do |i|
		print 'baris ke ', c, ' = ', i
		c = c +1
	end
else
	puts "kosong"
end

puts "\n> lalu belajar Write File yang sama"

aFile = File.open("wordlist.txt","w")
aFile.syswrite("kadal")

puts "> kalau tadi sudah tahu mengenai penggunaan each do, sekarang kita belajar menggunakan foreach, berbeda dengan each, tapi sama penggunaannya namun hasil akhirnya bukan sebuah array"

IO.foreach("wordlist.txt"){|i|
	puts i
}

puts "jadi terlihat lebih simpel kan ya, :) "

puts "> membuat comment yang panjang dengan =begin dan diakhir dengan =end"
=begin
	ya pokoknya begitu, 
	bisa buat banyak hal
	dan bisa untuk berbagai kemungkinan
=end
x, y, z = 100, 200, 100

print x, ' ', y, ' ', z, '\n'

puts "sekarang mencoba memanipulasi sebuah string"

kalimat = "asasa asas saasas asajshsa ajksdakssdjd askjdhkajsd asdjaksd ajhdskaj asas asasas"

puts kalimat.length
puts kalimat[10..30]

puts "pecah kalimat menjadi per byte"
kalimat.each_byte do |c|
	print c.chr, "/"
end

puts "\nkalau print c langsung, \nmenghasilkan angka ASCII, \nkalau print c.chr menghasilkan karakter"

puts "> Belajar Array dan Hash"

pacific = {
			"WA" 	=> "Washington",
			"OR"	=> "Orlando",
			"CA"	=> "California"
		  }

puts pacific