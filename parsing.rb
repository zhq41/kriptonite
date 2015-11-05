require 'rubygems'
require 'nokogiri'
require 'open-uri'


File.open("data.csv","w+") do |f|
	f << ["no", "Telepon/Email", "Jenis", "Melalui", "Lokasi", "Lampiran", "Laporan"]
	f << "\n"
	pol = 3453
	(2183..pol).each do |a|
		buka	= "http://laporgub.jatengprov.go.id/main/detail/"
		kp		= a.to_s
		tutup	= ".html#.VipABY9zbQo"

		page = Nokogiri::HTML(open(buka+kp+tutup))   
		konten_panjang = page.text.length

		#print "\njudul : ", page.css("title")[0].text, "\n"

		hasil = kp+" : "

		if(konten_panjang < 20000)
			konten = page.css("div#isi td")
			panjang = konten.length 
			
			if konten[17]
			f << [kp, 
				konten[2].text, 
				konten[5].text, 
				konten[8].text, 
				konten[11].text, 
				konten[14].text,
				konten[17].text]
			else
			f << [kp, 
				konten[2].text, 
				konten[5].text, 
				konten[8].text, 
				konten[11].text, 
				konten[14].text]				
			end
			f << "\n"		
			puts "id ke "+kp+" konten ditemukan"
		else
			puts "id ke "+kp+" konten tidak ditemukan"
		end
	end
end