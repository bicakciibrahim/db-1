"Çalışan Yönetim Sistemi" için önerilen veritabanı şeması, çeşitli tablo ve ilişkiler içerir. Bu şema, çalışanlar, projeler, izinler, performans değerlendirmeleri, eğitimler ve iletişim formlarını yönetmeye yönelik yapılandırılmıştır. Her tablonun amacı ve ilişkileri aşağıda açıklanmıştır:

### 1. **Çalışanlar Tablosu (`employees`):**
Bu tablo, çalışanların kişisel bilgilerini ve iş yerindeki pozisyonlarını saklar.

- **id (int, PK)**: Çalışanın benzersiz kimliği.
- **ad (string)**: Çalışanın adı.
- **soyad (string)**: Çalışanın soyadı.
- **email (string)**: Çalışanın e-posta adresi.
- **telefon (string)**: Çalışanın telefon numarası.
- **pozisyon (string)**: Çalışanın iş pozisyonu.
- **departman_id (int, FK)**: Çalışanın çalıştığı departmanı temsil eder. `departments` tablosuna yabancı anahtar.
- **employee_type_id (int, FK)**: Çalışan türünü temsil eder (tam zamanlı, yarı zamanlı vb.). `employee_types` tablosuna yabancı anahtar.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 2. **Departmanlar Tablosu (`departments`):**
Bu tablo, şirketin farklı departmanlarını saklar.

- **id (int, PK)**: Departmanın benzersiz kimliği.
- **birim_adi (string)**: Departmanın adı (İnsan Kaynakları, IT, Pazarlama vb.).
- **aciklama (text)**: Departmanın açıklaması (isteğe bağlı).
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 3. **Çalışan Türleri Tablosu (`employee_types`):**
Çalışan türlerini saklar (tam zamanlı, yarı zamanlı, sözleşmeli vb.).

- **id (int, PK)**: Çalışan türünün benzersiz kimliği.
- **tur_adi (string)**: Çalışan türünün adı (örneğin, Tam Zamanlı, Yarı Zamanlı vb.).
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 4. **Projeler Tablosu (`projects`):**
Bu tablo, şirketin yürüttüğü projeleri saklar.

- **id (int, PK)**: Projenin benzersiz kimliği.
- **ad (string)**: Projenin adı.
- **aciklama (text)**: Projenin açıklaması.
- **baslangic_tarihi (date)**: Projenin başlangıç tarihi.
- **bitis_tarihi (date)**: Projenin bitiş tarihi.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 5. **Görevler Tablosu (`tasks`):**
Bu tablo, projelere atanan görevleri içerir.

- **id (int, PK)**: Görevin benzersiz kimliği.
- **proje_id (int, FK)**: Görevin ait olduğu projeyi belirtir. `projects` tablosuna yabancı anahtar.
- **calisan_id (int, FK)**: Görevi üstlenen çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **ad (string)**: Görevin adı.
- **aciklama (text)**: Görevin açıklaması.
- **durum (enum)**: Görevin durumu (başladı, tamamlandı, beklemede vb.).
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 6. **Eğitimler Tablosu (`trainings`):**
Bu tablo, çalışanların katıldığı eğitimleri saklar.

- **id (int, PK)**: Eğitimin benzersiz kimliği.
- **calisan_id (int, FK)**: Eğitimi alan çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **ad (string)**: Eğitimin adı.
- **tarih (date)**: Eğitimin tarihi.
- **aciklama (text)**: Eğitimin açıklaması.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 7. **İzinler Tablosu (`vacations`):**
Bu tablo, çalışanların izinlerini kaydeder.

- **id (int, PK)**: İzin kaydının benzersiz kimliği.
- **calisan_id (int, FK)**: İzin alan çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **izin_turu (enum)**: İzin türü (yıllık, hastalık vb.).
- **baslangic_tarihi (date)**: İznin başlangıç tarihi.
- **bitis_tarihi (date)**: İznin bitiş tarihi.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 8. **Yoklama Tablosu (`attendance`):**
Bu tablo, çalışanların giriş-çıkış saatlerini takip eder.

- **id (int, PK)**: Yoklama kaydının benzersiz kimliği.
- **calisan_id (int, FK)**: Giriş yapan çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **giris_saati (timestamp)**: Çalışanın giriş saati.
- **cikis_saati (timestamp)**: Çalışanın çıkış saati.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 9. **Performans Değerlendirmeleri Tablosu (`performance_reviews`):**
Bu tablo, çalışanların performans değerlendirmelerini saklar.

- **id (int, PK)**: Değerlendirme kaydının benzersiz kimliği.
- **calisan_id (int, FK)**: Performansı değerlendirilen çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **degerlendirme (text)**: Performans değerlendirmesinin açıklaması.
- **puan (int)**: Performans puanı (örneğin 1-5 arasında).
- **tarih (date)**: Değerlendirme tarihi.
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### 10. **İletişim Formları Tablosu (`contact_forms`):**
Bu tablo, çalışanlardan gelen iletişim formlarını içerir.

- **id (int, PK)**: Formun benzersiz kimliği.
- **calisan_id (int, FK)**: Formu gönderen çalışanı belirtir. `employees` tablosuna yabancı anahtar.
- **form_turu (enum)**: Form türü (başvuru, şikayet, öneri vb.).
- **icerik (text)**: Formun içeriği.
- **durum (enum)**: Formun durumu (işlemde, tamamlandı, reddedildi vb.).
- **created_at (timestamp)**: Kaydın oluşturulma zamanı.
- **updated_at (timestamp)**: Kaydın son güncellenme zamanı.

### İlişkiler:
- **Çalışanlar** tablosu, **Departmanlar**, **Çalışan Türleri**, **Eğitimler**, **İzinler**, **Yoklama**, **Performans Değerlendirmeleri**, **Projeler** ve **Görevler** tablosuyla ilişkili.
- **Projeler** tablosu, **Görevler** tablosuyla ilişkilidir.
- **Eğitimler** ve **İzinler** tablosu, her bir çalışanın birden fazla eğitim ve izin kaydını saklar.
- **İletişim Formları** tablosu, her çalışandan gelen başvurular, şikayetler ve önerileri takip eder.

Bu veritabanı yapısı, sistemin temel işlevlerini en verimli şekilde sunmak için optimize edilmiştir. Gereksinimler arttıkça, daha fazla özellik eklenebilir ve bu şema genişletilebilir.
