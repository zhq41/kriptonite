require 'rubygems'
require 'nokogiri'
require 'open-uri'


File.open("new.csv","w+") do |f|
	f << [	".", "ID", "Telepon/Email", "Jenis", "Melalui", "Lokasi", "Lampiran", "Laporan",
			"|", "pengirim", "tanggal kirim", "sektor",
			"|", "penerima", "tanggal", "isi",
			"|", "penerima", "tanggal", "isi",
			"|", "penerima", "tanggal", "isi"]
	f << "\n"
	mulai 	= 1
	pol 	= 1000
	(mulai..pol).each do |a|
		buka	= "http://laporgub.jatengprov.go.id/main/detail/"
		kp		= a.to_s
		tutup	= ".html#.VipABY9zbQo"

		page = Nokogiri::HTML(open(buka+kp+tutup))   
		konten_panjang = page.text.length

		hasil = kp+" : "

		if(konten_panjang < 20000)
			konten = page.css("div#isi td")
			konten1 = page.css("div#isi span")
			konten2 = page.css("div#komentar ul").css("li")
			panjang = konten.length 
			panjang1 = konten1.length
			panjang2 = konten2.length

			if konten[17]
				f << ["", kp, konten[2].text, konten[5].text, konten[8].text, konten[11].text, konten[14].text, konten[17].text]
			else
				f << ["", kp, konten[2].text, konten[5].text, konten[8].text, konten[11].text, konten[14].text, "-"]
			end

			f<< [""," | ",konten1[0].text, konten1[1].text, konten1[2].text]
			
			 (0..panjang2-2).each do |a|
			 	if(konten2[a].css("h4")[0])
			 		isi = konten2[a].css("h4")[0].text
					f << isi
			 	end
			 	#isi2 = konten2[a].css("div")[1].text
			 	#isi3 = isi2[1..20]
			 	#isi4 = konten2[a].css("div")[0].text
			 	#f << ["","|", isi, isi3, isi4[0..(isi4.length)]]
			 end
			
			f << "\n"
			puts "id ke "+kp+" konten ditemukan"
		else
			puts "id ke "+kp+" konten tidak ditemukan"
		end
	end
end