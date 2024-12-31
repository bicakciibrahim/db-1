### **Çalışan Yönetim Sistemi Veritabanı Şeması**

Bu veritabanı şeması, "Çalışan Yönetim Sistemi" için temel veri yapılarını ve ilişkilerini tanımlar. Aşağıda, her bir tablonun amacı ve içeriği açıklanmıştır:

---

#### **1. Birimler**
Birimler tablosu, şirketin çeşitli departmanlarını saklar.

- **id**: Birimin benzersiz kimliği.
- **birim_adi**: Birimin adı (Örneğin, İnsan Kaynakları, Pazarlama).
- **aciklama**: Birimin açıklaması (isteğe bağlı).
- **created_at** ve **updated_at**: Kayıt oluşturulma ve güncellenme zamanları.

---

#### **2. Başvurular**
Çalışanların başvurularını saklar. Başvuru formu verilerini içerir.

- **id**: Başvurunun benzersiz kimliği.
- **isim**, **email**, **telefon**: Başvuruyu yapan kişinin bilgileri.
- **birim_id**: Başvurulan birim.
- **mesaj**: Başvuru mesajı.
- **created_at** ve **updated_at**: Kayıt oluşturulma ve güncellenme zamanları.

---

#### **3. Cache**
Uygulamanın hızlı veri erişimi için kullanılan cache (önbellek) verilerini saklar.

- **key**: Cache anahtarı.
- **value**: Cache değeri.
- **expiration**: Cache'in geçerlilik süresi.

---

#### **4. Cache Locks**
Cache üzerinde kilit işlemleri için verileri saklar.

- **key**: Kilit anahtarı.
- **owner**: Kilidi alan kullanıcı.
- **expiration**: Kilidin geçerlilik süresi.

---

#### **5. Çalışan Türleri**
Çalışan türlerini (tam zamanlı, yarı zamanlı, sözleşmeli) saklar.

- **id**: Çalışan türünün benzersiz kimliği.
- **tur_adi**: Çalışan türünün adı.
- **aciklama**: Çalışan türü açıklaması.

---

#### **6. Eğitim Türü**
Çalışan eğitim türlerini tanımlar (örneğin, teknik eğitim, yönetim eğitimi).

- **id**: Eğitim türünün benzersiz kimliği.
- **ad**: Eğitim türünün adı.
- **aciklama**: Eğitim türünün açıklaması.

---

#### **7. Failed Jobs**
Başarısız işler ve hata geçmişini saklar.

- **id**: İşin benzersiz kimliği.
- **uuid**: Hata kimliği.
- **connection**, **queue**, **payload**: Hata detayları.
- **failed_at**: İşin başarısızlık tarihi.

---

#### **8. Görevler**
Projelerle ilişkili görevleri saklar.

- **id**: Görevin benzersiz kimliği.
- **gorev_adi**: Görev adı.
- **baslangic_tarihi** ve **bitis_tarihi**: Görev zamanları.
- **durum**: Görev durumu (Beklemede, Devam Ediyor, Tamamlandı).

---

#### **9. Çalışanlar**
Çalışanların kişisel bilgilerini ve pozisyonlarını saklar.

- **id**: Çalışanın benzersiz kimliği.
- **ad**, **soyad**: Çalışanın adı ve soyadı.
- **email**: Çalışanın e-posta adresi.
- **calisan_turu_id**: Çalışan türü.
- **birim_id**: Çalışanın çalıştığı birim.
- **gorev_id**: Çalışanın görev bilgisi.

---

#### **10. Çalışan Eğitimleri**
Çalışanların aldıkları eğitimleri saklar.

- **id**: Eğitim kaydının benzersiz kimliği.
- **calisan_id**: Eğitimi alan çalışan.
- **egitim_turu_id**: Eğitim türü.
- **egitim_tarihi**: Eğitimin tarihi.
- **egitim_durumu**: Eğitimin durumu (tamamlandı, devam ediyor vb.).

---

#### **11. İzin Türleri**
Çalışan izin türlerini tanımlar (yıllık izin, hastalık izni vb.).

- **id**: İzin türünün benzersiz kimliği.
- **izin_turu_adi**: İzin türü adı.

---

#### **12. İzinler**
Çalışanların izin kayıtlarını saklar.

- **id**: İzin kaydının benzersiz kimliği.
- **calisan_id**: İzinli olan çalışan.
- **izin_turu_id**: İzin türü.
- **baslangic_tarihi** ve **bitis_tarihi**: İzin tarihler.

---

#### **13. İşlem Kuyrukları (Jobs)**
Arka planda çalışan görevler ve iş kuyruklarını saklar.

- **id**: İşin benzersiz kimliği.
- **queue**: Kuyruk adı.
- **payload**: Görevin yükü.
- **attempts**: İşlem deneme sayısı.

---

#### **14. Maaşlar**
Çalışan maaş bilgilerini içerir.

- **id**: Maaş kaydının benzersiz kimliği.
- **calisan_id**: Maaşı ödenen çalışan.
- **tutar**: Maaş miktarı.
- **odeme_tarihi**: Maaş ödeme tarihi.

---

#### **15. Migrations**
Veritabanı şeması değişikliklerini takip eder.

- **id**: Migration kaydının benzersiz kimliği.
- **migration**: Yapılan değişiklik.
- **batch**: Değişiklik grubu.

---

#### **16. Öneriler**
Çalışanlardan gelen öneri mesajlarını saklar.

- **id**: Öneri kaydının benzersiz kimliği.
- **isim**, **email**, **telefon**: Gönderen kişi bilgileri.
- **mesaj**: Öneri mesajı.

---

#### **17. Şifre Sıfırlama Tokenları**
Kullanıcı şifre sıfırlama işlemleri için tokenları saklar.

- **email**: Şifre sıfırlama işlemi için e-posta adresi.
- **token**: Sıfırlama tokenı.

---

#### **18. Performans Değerlendirmeleri**
Çalışanların performans değerlendirmelerini saklar.

- **id**: Değerlendirme kaydının benzersiz kimliği.
- **calisan_id**: Performansı değerlendirilen çalışan.
- **puan**: Performans puanı.
- **yorum**: Performans yorumu.

---

#### **19. Projeler**
Yürütülen projeleri saklar.

- **id**: Projenin benzersiz kimliği.
- **ad**: Projenin adı.
- **aciklama**: Proje açıklaması.
- **baslangic_tarihi** ve **bitis_tarihi**: Proje tarihleri.

---

#### **20. Oturumlar (Sessions)**
Kullanıcı oturumlarını saklar.

- **id**: Oturum kimliği.
- **user_id**: Oturumu açan kullanıcı.
- **ip_address**: Kullanıcının IP adresi.
- **last_activity**: Son etkinlik zamanı.

---

#### **21. Şikayetler**
Çalışanlardan gelen şikayetleri saklar.

- **id**: Şikayet kaydının benzersiz kimliği.
- **isim**, **email**, **telefon**: Şikayetçi kişi bilgileri.
- **mesaj**: Şikayet mesajı.

---

#### **22. Teşvik Primleri**
Çalışanlara verilen primleri saklar.

- **id**: Prim kaydının benzersiz kimliği.
- **calisan_id**: Prim verilen çalışan.
- **tutar**: Prim tutarı.
- **odeme_tarihi**: Prim ödeme tarihi.

---

#### **23. Kullanıcılar (Users)**
Sistemdeki kullanıcı hesaplarını saklar.

- **id**: Kullanıcının benzersiz kimliği.
- **name**, **email**: Kullanıcı adı ve e-posta adresi.
- **password**: Kullanıcı şifresi.

---

#### **24. Yoklama**
Çalışanların yoklama kayıtlarını içerir.

- **id**: Yoklama kaydının benzersiz kimliği.
- **calisan_id**: Yoklama kaydını oluşturan çalışan.
- **tarih**: Yoklama tarihi.
- **durum**: Çalışanın yoklama durumu (Geldi, Gelmedi vb.).

---


  
