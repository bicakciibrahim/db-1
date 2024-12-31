-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: sqlworker
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basvurular`
--

DROP TABLE IF EXISTS `basvurular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basvurular` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `isim` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `birim_id` bigint(20) unsigned NOT NULL,
  `mesaj` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basvurular_birim_id_foreign` (`birim_id`),
  CONSTRAINT `basvurular_birim_id_foreign` FOREIGN KEY (`birim_id`) REFERENCES `birimler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basvurular`
--

LOCK TABLES `basvurular` WRITE;
/*!40000 ALTER TABLE `basvurular` DISABLE KEYS */;
/*!40000 ALTER TABLE `basvurular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birimler`
--

DROP TABLE IF EXISTS `birimler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birimler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `birim_adi` varchar(100) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birimler`
--

LOCK TABLES `birimler` WRITE;
/*!40000 ALTER TABLE `birimler` DISABLE KEYS */;
INSERT INTO `birimler` VALUES (1,'İnsan Kaynakları','Personel işe alımı ve yönetimi.',NULL,NULL),(2,'Muhasebe','Finansal işlemler ve raporlama.',NULL,NULL),(3,'Bilgi İşlem','BT altyapısı ve yazılım geliştirme.',NULL,NULL),(4,'Satış','Satış stratejilerinin geliştirilmesi ve müşteri yönetimi.',NULL,NULL),(5,'Lojistik','Tedarik zinciri ve nakliye yönetimi.',NULL,NULL),(6,'Pazarlama','Reklam ve marka yönetimi.',NULL,NULL),(7,'Ar-Ge','Yeni ürün geliştirme ve inovasyon.',NULL,NULL),(8,'Hukuk','Şirketin yasal işlemleri ve sözleşmeler.',NULL,NULL),(9,'Operasyon','Günlük iş süreçlerinin yürütülmesi.',NULL,NULL),(10,'Müşteri Hizmetleri','Müşteri sorunlarının çözümü ve destek.',NULL,NULL);
/*!40000 ALTER TABLE `birimler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calisan_egitimleri`
--

DROP TABLE IF EXISTS `calisan_egitimleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calisan_egitimleri` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `egitim_turu_id` bigint(20) unsigned NOT NULL,
  `egitim_tarihi` date NOT NULL,
  `egitim_durumu` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calisan_egitimleri_calisan_id_foreign` (`calisan_id`),
  KEY `calisan_egitimleri_egitim_turu_id_foreign` (`egitim_turu_id`),
  CONSTRAINT `calisan_egitimleri_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calisan_egitimleri_egitim_turu_id_foreign` FOREIGN KEY (`egitim_turu_id`) REFERENCES `egitim_turu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calisan_egitimleri`
--

LOCK TABLES `calisan_egitimleri` WRITE;
/*!40000 ALTER TABLE `calisan_egitimleri` DISABLE KEYS */;
INSERT INTO `calisan_egitimleri` VALUES (1,1,1,'2023-01-15','Başarılı',NULL,NULL),(2,2,2,'2023-02-20','Başarısız',NULL,NULL),(3,3,3,'2023-03-05','Devam Ediyor',NULL,NULL),(4,4,1,'2023-04-10','Başarılı',NULL,NULL),(5,5,4,'2023-05-12','Başarısız',NULL,NULL),(6,6,5,'2023-06-18','Devam Ediyor',NULL,NULL),(7,7,2,'2023-07-25','Başarılı',NULL,NULL),(8,8,3,'2023-08-30','Başarılı',NULL,NULL),(9,9,4,'2023-09-10','Başarısız',NULL,NULL),(10,10,5,'2023-10-01','Devam Ediyor',NULL,NULL);
/*!40000 ALTER TABLE `calisan_egitimleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calisan_turleri`
--

DROP TABLE IF EXISTS `calisan_turleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calisan_turleri` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tur_adi` varchar(100) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calisan_turleri_tur_adi_unique` (`tur_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calisan_turleri`
--

LOCK TABLES `calisan_turleri` WRITE;
/*!40000 ALTER TABLE `calisan_turleri` DISABLE KEYS */;
INSERT INTO `calisan_turleri` VALUES (1,'Tam Zamanlı','Haftada 40 saat çalışan tam zamanlı personel.',NULL,NULL),(2,'Yarı Zamanlı','Belirli saatlerde çalışan yarı zamanlı personel.',NULL,NULL),(3,'Stajyer','Kısa süreli iş deneyimi kazanan stajyerler.',NULL,NULL),(4,'Geçici Çalışan','Geçici projelerde çalışan personel.',NULL,NULL),(5,'Uzaktan Çalışan','Ofis dışında çalışan uzaktan personel.',NULL,NULL),(6,'Kıdemli Çalışan','Uzun yıllar deneyimi olan personel.',NULL,NULL),(7,'Sözleşmeli Çalışan','Belirli süreli sözleşmeyle çalışan personel.',NULL,NULL),(8,'Danışman','Belirli konularda danışmanlık yapan personel.',NULL,NULL),(9,'Freelancer','Proje bazlı çalışan bağımsız profesyonel.',NULL,NULL),(10,'Yönetici','Ekip veya şirket yöneten personel.',NULL,NULL);
/*!40000 ALTER TABLE `calisan_turleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calisanlar`
--

DROP TABLE IF EXISTS `calisanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calisanlar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `calisan_turu_id` bigint(20) unsigned NOT NULL,
  `birim_id` bigint(20) unsigned NOT NULL,
  `gorev_id` bigint(20) unsigned NOT NULL,
  `ise_baslangic_tarihi` date NOT NULL,
  `son_calisma_tarihi` date DEFAULT NULL,
  `maas` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calisanlar_email_unique` (`email`),
  KEY `calisanlar_calisan_turu_id_foreign` (`calisan_turu_id`),
  KEY `calisanlar_birim_id_foreign` (`birim_id`),
  KEY `calisanlar_gorev_id_foreign` (`gorev_id`),
  CONSTRAINT `calisanlar_birim_id_foreign` FOREIGN KEY (`birim_id`) REFERENCES `birimler` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calisanlar_calisan_turu_id_foreign` FOREIGN KEY (`calisan_turu_id`) REFERENCES `calisan_turleri` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calisanlar_gorev_id_foreign` FOREIGN KEY (`gorev_id`) REFERENCES `gorevler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calisanlar`
--

LOCK TABLES `calisanlar` WRITE;
/*!40000 ALTER TABLE `calisanlar` DISABLE KEYS */;
INSERT INTO `calisanlar` VALUES (1,'Ahmet','Yılmaz','ahmet.yilmaz@example.com','5551234567',1,1,1,'2022-01-01',NULL,8500.50,NULL,NULL),(2,'Mehmet','Kaya','mehmet.kaya@example.com','5559876543',2,2,2,'2021-05-15',NULL,9200.75,NULL,NULL),(3,'Ayşe','Demir','ayse.demir@example.com','5554567890',1,1,3,'2023-02-10',NULL,7800.00,NULL,NULL),(4,'Fatma','Çelik','fatma.celik@example.com','5551239876',2,3,4,'2020-10-20',NULL,8900.25,NULL,NULL),(5,'Ali','Şahin','ali.sahin@example.com','5555671234',7,2,2,'2021-11-30',NULL,9500.00,NULL,'2024-12-31 04:24:16'),(6,'Zeynep','Karaca','zeynep.karaca@example.com','5554321098',1,3,5,'2023-03-01',NULL,8200.75,NULL,NULL),(7,'Emre','Yıldız','emre.yildiz@example.com','5557896543',2,4,6,'2019-07-15',NULL,9800.50,NULL,NULL),(8,'Hüseyin','Aydın','huseyin.aydin@example.com','5558765432',3,2,3,'2022-08-01',NULL,9100.00,NULL,NULL),(9,'Selin','Özkan','selin.ozkan@example.com','5553456789',1,1,4,'2020-12-12',NULL,8700.25,NULL,NULL),(10,'Burak','Kılıç','burak.kilic@example.com','5556543210',2,5,5,'2018-06-20',NULL,9600.75,NULL,NULL);
/*!40000 ALTER TABLE `calisanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egitim_turu`
--

DROP TABLE IF EXISTS `egitim_turu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egitim_turu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `aciklama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egitim_turu`
--

LOCK TABLES `egitim_turu` WRITE;
/*!40000 ALTER TABLE `egitim_turu` DISABLE KEYS */;
INSERT INTO `egitim_turu` VALUES (1,'Yönetim Eğitimi','Yöneticilik becerilerini geliştirmeye yönelik eğitim.',NULL,NULL),(2,'Teknik Eğitim','Çalışanların teknik becerilerini artırmak için verilen eğitim.',NULL,NULL),(3,'Kişisel Gelişim Eğitimi','Kişisel beceriler ve yetkinlikler üzerine eğitim.',NULL,NULL),(4,'İletişim Eğitimi','Etkili iletişim kurma becerilerini geliştiren eğitim.',NULL,NULL),(5,'Satış Eğitimi','Satış tekniklerini geliştiren eğitim programı.',NULL,NULL),(6,'Liderlik Eğitimi','Liderlik becerilerini geliştirmeyi amaçlayan eğitim.',NULL,NULL),(7,'Zaman Yönetimi Eğitimi','Zamanı daha verimli kullanmaya yönelik eğitim.',NULL,NULL),(8,'İnsan Kaynakları Eğitimi','İK yönetimi ve süreçleri hakkında eğitim.',NULL,NULL),(9,'Problem Çözme Eğitimi','Çalışanların problem çözme becerilerini geliştirmeyi amaçlayan eğitim.',NULL,NULL),(10,'Müşteri Hizmetleri Eğitimi','Müşteri ilişkileri yönetimi üzerine eğitim.',NULL,NULL);
/*!40000 ALTER TABLE `egitim_turu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gorevler`
--

DROP TABLE IF EXISTS `gorevler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorevler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gorev_adi` varchar(255) NOT NULL,
  `baslangic_tarihi` date DEFAULT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `durum` enum('Beklemede','Devam Ediyor','Tamamlandı') NOT NULL DEFAULT 'Beklemede',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gorevler`
--

LOCK TABLES `gorevler` WRITE;
/*!40000 ALTER TABLE `gorevler` DISABLE KEYS */;
INSERT INTO `gorevler` VALUES (1,'Proje Planlama','2024-01-01','2024-01-10','Tamamlandı',NULL,NULL),(2,'Sunum Hazırlığı','2024-01-15','2024-01-25','Devam Ediyor',NULL,NULL),(3,'Rapor Yazma','2024-01-05','2024-01-12','Tamamlandı',NULL,NULL),(4,'Veri Analizi','2024-01-15','2024-01-22','Devam Ediyor',NULL,NULL),(5,'Müşteri Görüşmesi','2024-01-10','2024-01-12','Tamamlandı',NULL,NULL),(6,'Ekip Toplantısı','2024-01-20','2024-01-22','Devam Ediyor',NULL,NULL),(7,'Pazar Araştırması','2024-01-05','2024-01-10','Tamamlandı',NULL,NULL),(8,'Bütçe Hazırlığı','2024-01-15','2024-01-18','Devam Ediyor',NULL,NULL),(9,'İç Denetim','2024-01-07','2024-01-14','Beklemede',NULL,NULL),(10,'Finansal Raporlama','2024-01-16','2024-01-22','Beklemede',NULL,NULL),(11,'Ekip Yönetimi','2024-01-01','2024-01-07','Tamamlandı',NULL,NULL),(12,'Proje İzleme','2024-01-10','2024-01-20','Devam Ediyor',NULL,NULL),(13,'Kampanya Planlama','2024-01-10','2024-01-20','Beklemede',NULL,NULL),(14,'Pazar Analizi','2024-01-22','2024-01-28','Devam Ediyor',NULL,NULL),(15,'Sosyal Medya Yönetimi','2024-01-05','2024-01-10','Tamamlandı',NULL,NULL),(16,'Web Tasarımı','2024-01-15','2024-01-22','Devam Ediyor',NULL,NULL),(17,'Yazılım Geliştirme','2024-01-05','2024-01-12','Tamamlandı',NULL,NULL),(18,'Veritabanı Yönetimi','2024-01-15','2024-01-20','Devam Ediyor',NULL,NULL),(19,'Yönetim Toplantısı','2024-01-01','2024-01-05','Tamamlandı',NULL,NULL),(20,'Müşteri Desteği','2024-01-10','2024-01-15','Devam Ediyor',NULL,NULL),(21,'İç İletişim Yönetimi','2024-01-20','2024-01-30','Beklemede',NULL,NULL),(22,'Veri Toplama','2024-01-23','2024-01-29','Devam Ediyor',NULL,NULL);
/*!40000 ALTER TABLE `gorevler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izin_turleri`
--

DROP TABLE IF EXISTS `izin_turleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izin_turleri` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `izin_turu_adi` varchar(100) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `izin_turleri_izin_turu_adi_unique` (`izin_turu_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izin_turleri`
--

LOCK TABLES `izin_turleri` WRITE;
/*!40000 ALTER TABLE `izin_turleri` DISABLE KEYS */;
INSERT INTO `izin_turleri` VALUES (1,'Yıllık İzin','Çalışanların yıllık olarak kullanabileceği izin',NULL,NULL),(2,'Hastalık İzni','Çalışanın hastalanması durumunda verilen izin',NULL,NULL),(3,'Mazeret İzni','Çalışanın belirli bir mazereti nedeniyle verilen izin',NULL,NULL),(4,'Doğum İzni','Çalışanın doğum yapması durumunda verilen izin',NULL,NULL),(5,'Evlilik İzni','Çalışanın evlenmesi durumunda verilen izin',NULL,NULL),(6,'Baba İzni','Çalışanın eşinin doğum yapması durumunda verilen izin',NULL,NULL),(7,'Refakat İzni','Çalışanın hasta bir yakınına bakmak için verilen izin',NULL,NULL),(8,'Aylık İzin','Çalışanın belirli bir süreyle belirli aralıklarla aldığı izin',NULL,NULL),(9,'Ücretsiz İzin','Çalışanın maaş almadan aldığı izin',NULL,NULL),(10,'Yol İzni','Çalışanın iş gereği yaptığı seyahatler için verilen izin',NULL,NULL);
/*!40000 ALTER TABLE `izin_turleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izinler`
--

DROP TABLE IF EXISTS `izinler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izinler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `izin_turu_id` bigint(20) unsigned NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date NOT NULL,
  `aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `izinler_calisan_id_foreign` (`calisan_id`),
  KEY `izinler_izin_turu_id_foreign` (`izin_turu_id`),
  CONSTRAINT `izinler_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE,
  CONSTRAINT `izinler_izin_turu_id_foreign` FOREIGN KEY (`izin_turu_id`) REFERENCES `izin_turleri` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izinler`
--

LOCK TABLES `izinler` WRITE;
/*!40000 ALTER TABLE `izinler` DISABLE KEYS */;
INSERT INTO `izinler` VALUES (1,1,1,'2024-12-01','2024-12-10','Yıllık tatil için alınan izin',NULL,NULL),(2,2,2,'2024-12-05','2024-12-07','Grip nedeniyle alınan hastalık izni',NULL,NULL),(3,3,3,'2024-12-08','2024-12-10','Kişisel bir mazeret nedeniyle alınan izin',NULL,NULL),(4,4,4,'2024-12-15','2025-01-15','Doğum sonrası dinlenme için alınan izin',NULL,NULL),(5,5,5,'2024-11-20','2024-11-22','Evlilik hazırlıkları için alınan izin',NULL,NULL),(6,6,8,'2024-12-18','2024-12-20','Aylık düzenli dinlenme izni',NULL,NULL),(7,7,7,'2024-12-25','2024-12-31','Hastanede refakatçi olarak bulunmak için alınan izin',NULL,NULL),(8,8,8,'2024-12-10','2024-12-12','Aylık düzenli dinlenme izni',NULL,NULL),(9,9,9,'2024-12-01','2024-12-31','Ücretsiz bir şekilde uzun süreli alınan izin',NULL,NULL),(10,10,10,'2024-12-03','2024-12-05','İş seyahati için verilen yol izni',NULL,NULL),(11,3,2,'2025-01-10','2025-01-11','raporlu','2024-12-30 07:46:04','2024-12-30 07:46:04');
/*!40000 ALTER TABLE `izinler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maaslar`
--

DROP TABLE IF EXISTS `maaslar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maaslar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `tutar` decimal(10,2) NOT NULL,
  `odeme_tarihi` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maaslar_calisan_id_foreign` (`calisan_id`),
  CONSTRAINT `maaslar_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maaslar`
--

LOCK TABLES `maaslar` WRITE;
/*!40000 ALTER TABLE `maaslar` DISABLE KEYS */;
INSERT INTO `maaslar` VALUES (1,1,8500.50,'2024-01-01',NULL,NULL),(2,1,8600.75,'2024-02-01',NULL,NULL),(3,2,9200.75,'2024-01-01',NULL,NULL),(4,2,9300.00,'2024-02-01',NULL,NULL),(5,3,7800.00,'2024-01-01',NULL,NULL),(6,3,7900.50,'2024-02-01',NULL,NULL),(7,4,8900.25,'2024-01-01',NULL,NULL),(8,4,9000.75,'2024-02-01',NULL,NULL),(9,5,9500.00,'2024-01-01',NULL,NULL),(10,5,9600.00,'2024-02-01',NULL,NULL),(11,6,8200.75,'2024-01-01',NULL,NULL),(12,6,8300.00,'2024-02-01',NULL,NULL),(13,7,9800.50,'2024-01-01',NULL,NULL),(14,7,9900.00,'2024-02-01',NULL,NULL),(15,8,9100.00,'2024-01-01',NULL,NULL),(16,8,9200.50,'2024-02-01',NULL,NULL),(17,9,8700.25,'2024-01-01',NULL,NULL),(18,9,8800.75,'2024-02-01',NULL,NULL),(19,10,9600.75,'2024-01-01',NULL,NULL),(20,10,9700.50,'2024-02-01',NULL,NULL);
/*!40000 ALTER TABLE `maaslar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_12_18_183831_create_departments_table',1),(5,'2024_12_18_184246_create_employee_types_table',1),(6,'2024_12_18_184332_create_permisson_types_table',1),(7,'2024_12_18_184339_create_tasks_table',1),(8,'2024_12_18_184440_create_employees_table',1),(9,'2024_12_18_184441_create_permissions_table',1),(10,'2024_12_18_184510_create_type_of_education_table',1),(11,'2024_12_18_184616_create_employee_traiinings_table',1),(12,'2024_12_18_184707_create_roll_calls_table',1),(13,'2024_12_18_184737_create_performance_evaluations_table',1),(14,'2024_12_18_184804_create_projects_table',1),(15,'2024_12_18_185348_create_incentives_and_bonuses_table',1),(16,'2024_12_18_185433_create_salaries_table',1),(17,'2024_12_23_210658_create_complaints_table',1),(18,'2024_12_26_121603_create_suggestions_table',1),(19,'2024_12_26_122604_create_applications_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oneris`
--

DROP TABLE IF EXISTS `oneris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oneris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `isim` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `mesaj` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oneris`
--

LOCK TABLES `oneris` WRITE;
/*!40000 ALTER TABLE `oneris` DISABLE KEYS */;
/*!40000 ALTER TABLE `oneris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performans_degerlendirme`
--

DROP TABLE IF EXISTS `performans_degerlendirme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performans_degerlendirme` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `puan` int(11) NOT NULL,
  `yorum` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `performans_degerlendirme_calisan_id_foreign` (`calisan_id`),
  CONSTRAINT `performans_degerlendirme_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performans_degerlendirme`
--

LOCK TABLES `performans_degerlendirme` WRITE;
/*!40000 ALTER TABLE `performans_degerlendirme` DISABLE KEYS */;
INSERT INTO `performans_degerlendirme` VALUES (1,1,85,'Başarılı ve özverili çalışma.',NULL,NULL),(2,2,90,'Satış hedeflerini başarıyla gerçekleştirdi.',NULL,NULL),(3,3,75,'Performansında artış bekleniyor.',NULL,NULL),(4,4,80,'Genel olarak iyi, ancak bazı projelerde zorluklar yaşandı.',NULL,NULL),(5,5,92,'Ekip içi işbirliği mükemmel.',NULL,NULL),(6,6,88,'Yeni görevlerde hızlı uyum sağladı.',NULL,NULL),(7,7,78,'Bazen projelere geç başlamaktadır.',NULL,NULL),(8,8,95,'Çok iyi bir performans, yüksek motivasyon.',NULL,NULL),(9,9,80,'Projelerde iyi bir iş çıkarıyor ancak iletişimde eksiklikler var.',NULL,NULL),(10,10,85,'İyi sonuçlar elde etti ancak zaman yönetimi konusunda gelişim sağlanabilir.',NULL,NULL);
/*!40000 ALTER TABLE `performans_degerlendirme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeler`
--

DROP TABLE IF EXISTS `projeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `aciklama` text NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date NOT NULL,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projeler_calisan_id_foreign` (`calisan_id`),
  CONSTRAINT `projeler_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeler`
--

LOCK TABLES `projeler` WRITE;
/*!40000 ALTER TABLE `projeler` DISABLE KEYS */;
INSERT INTO `projeler` VALUES (1,'Yeni Web Sitesi','Kurumsal web sitesi tasarım ve geliştirme projesi.','2024-01-01','2024-06-30',3,NULL,'2024-12-31 04:18:13'),(2,'Mobil Uygulama','Firma için mobil uygulama geliştirme projesi.','2024-03-01','2024-09-30',6,NULL,'2024-12-30 06:04:31'),(3,'E-Ticaret Sistemi','Yeni e-ticaret platformunun geliştirilmesi.','2024-02-15','2024-07-15',4,NULL,'2024-12-30 06:04:44'),(4,'Müşteri İlişkileri Yönetim Sistemi','CRM yazılımının entegrasyonu ve geliştirilmesi.','2024-01-10','2024-05-10',4,NULL,NULL),(5,'Eğitim Portalı','Çalışanlar için online eğitim platformunun kurulması.','2024-02-01','2024-08-01',3,NULL,'2024-12-30 05:47:48'),(6,'İnsan Kaynakları Yazılımı','Yeni insan kaynakları yönetim yazılımı geliştirme projesi.','2024-04-01','2024-10-01',1,NULL,NULL),(7,'İç İletişim Uygulaması','Çalışanlar için iç iletişimi sağlayan uygulama geliştirme.','2024-05-15','2024-11-15',2,NULL,NULL),(8,'Veri Analitiği Projesi','Veri analizi ve raporlama sistemi geliştirilmesi.','2024-01-20','2024-06-20',3,NULL,NULL),(9,'Sosyal Medya Kampanyası','Yeni sosyal medya kampanyası için strateji geliştirilmesi.','2024-03-10','2024-05-20',4,NULL,NULL),(10,'Yazılım Güvenlik Güncellemesi','Yazılımın güvenlik açıklarını kapatmak için yapılan güncellemeler.','2024-06-01','2024-06-30',5,NULL,NULL);
/*!40000 ALTER TABLE `projeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('YleBC5JLTk5uc9w0dBaIxP6vtm1ZufjLWvAmZ4m0',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWlBaWHFqSEVCM0hLYUlTS0Fha1dRQ1BiaDJ6b3hXWGlGcUttd1N6ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nb3JldmxlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1735633325);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sikayets`
--

DROP TABLE IF EXISTS `sikayets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sikayets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `isim` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `mesaj` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sikayets`
--

LOCK TABLES `sikayets` WRITE;
/*!40000 ALTER TABLE `sikayets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sikayets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesvik_primler`
--

DROP TABLE IF EXISTS `tesvik_primler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tesvik_primler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `tutar` decimal(10,2) NOT NULL,
  `odeme_tarihi` date NOT NULL,
  `aciklama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tesvik_primler_calisan_id_foreign` (`calisan_id`),
  CONSTRAINT `tesvik_primler_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesvik_primler`
--

LOCK TABLES `tesvik_primler` WRITE;
/*!40000 ALTER TABLE `tesvik_primler` DISABLE KEYS */;
INSERT INTO `tesvik_primler` VALUES (1,1,1500.50,'2023-01-15','Proje başarı primi',NULL,NULL),(2,2,2000.00,'2023-02-10','Satış hedefi ödülü',NULL,NULL),(3,3,1750.75,'2023-03-05','Performans primi',NULL,NULL),(4,4,2200.25,'2023-04-20','Yıllık hedef primi',NULL,NULL),(5,5,1800.00,'2023-05-15','Müşteri memnuniyeti ödülü',NULL,NULL),(6,6,2500.00,'2023-06-30','Takım liderliği ödülü',NULL,NULL),(7,7,1300.00,'2023-07-25','Yenilikçi fikir teşviği',NULL,NULL),(8,8,1950.50,'2023-08-10','Ekip başarısı primi',NULL,NULL),(9,9,1600.75,'2023-09-15','Zamanında teslim ödülü',NULL,NULL),(10,10,2100.00,'2023-10-05','Maliyet azaltma teşviği',NULL,NULL);
/*!40000 ALTER TABLE `tesvik_primler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com','2024-12-28 10:36:56','$2y$12$xvfMPubOkQzj5FHHDQFLruHqqCdRmJYHCnEq9broVRIhK4jPC1tHu','ymgd8Ysizz','2024-12-28 10:36:56','2024-12-28 10:36:56'),(2,'ibrahim','admin@ib.com',NULL,'$2y$12$5.sCJ8IM3gl2EH5Tv5Xnxud3hLWUaLu5qp/qLf8vh7w1qjGUgYKp.',NULL,'2024-12-28 10:38:15','2024-12-28 10:38:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yoklama`
--

DROP TABLE IF EXISTS `yoklama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yoklama` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calisan_id` bigint(20) unsigned NOT NULL,
  `tarih` date NOT NULL,
  `giris_saati` time DEFAULT NULL,
  `cikis_saati` time DEFAULT NULL,
  `durum` enum('Geldi','Gelmedi','Geç Geldi','İzinli') NOT NULL DEFAULT 'Geldi',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yoklama_calisan_id_foreign` (`calisan_id`),
  CONSTRAINT `yoklama_calisan_id_foreign` FOREIGN KEY (`calisan_id`) REFERENCES `calisanlar` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yoklama`
--

LOCK TABLES `yoklama` WRITE;
/*!40000 ALTER TABLE `yoklama` DISABLE KEYS */;
INSERT INTO `yoklama` VALUES (1,1,'2024-01-01','09:00:00','17:00:00','Geldi',NULL,NULL),(2,2,'2024-01-01',NULL,NULL,'Gelmedi',NULL,NULL),(3,3,'2024-01-02','10:00:00','14:00:00','İzinli',NULL,NULL),(4,4,'2024-01-02','09:30:00','17:00:00','Geç Geldi',NULL,NULL),(5,5,'2024-01-03','09:00:00','17:00:00','Geldi',NULL,NULL),(6,6,'2024-01-03',NULL,NULL,'Gelmedi',NULL,NULL),(7,7,'2024-01-04','08:45:00','16:30:00','Geldi',NULL,NULL),(8,8,'2024-01-04','09:00:00','17:00:00','İzinli',NULL,NULL),(9,9,'2024-01-05','09:00:00','17:00:00','Geç Geldi',NULL,NULL),(10,10,'2024-01-05',NULL,NULL,'Gelmedi',NULL,NULL);
/*!40000 ALTER TABLE `yoklama` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-31 11:24:55
