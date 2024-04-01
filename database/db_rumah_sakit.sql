/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_rumah_sakit

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 01/04/2024 11:49:25
*/
CREATE DATABASE IF NOT EXISTS db_rumah_sakit;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departmen
-- ----------------------------
DROP TABLE IF NOT EXISTS `departmen`;
CREATE TABLE `departmen`  (
  `id_departmen` int NOT NULL AUTO_INCREMENT,
  `nama_departmen` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `spesialisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lokasi` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_departmen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departmen
-- ----------------------------
INSERT INTO `departmen` VALUES (1, 'Radiology', 'Radiologist', 'Hospital Building, 2nd Floor');
INSERT INTO `departmen` VALUES (2, 'Emergency', 'ER Specialist', 'Emergency Ward');
INSERT INTO `departmen` VALUES (3, 'Surgery', 'Surgeon', 'Operating Room 1');
INSERT INTO `departmen` VALUES (4, 'Cardiology', 'Cardiologist', 'Heart Wing');
INSERT INTO `departmen` VALUES (5, 'Pediatrics', 'Pediatric Surgeon', 'Children Ward');
INSERT INTO `departmen` VALUES (6, 'Neurology', 'Neurologist', 'Neurological Center');
INSERT INTO `departmen` VALUES (7, 'Orthopedics', 'Orthopedic Surgeon', 'Orthopedic Wing');
INSERT INTO `departmen` VALUES (9, 'ENT', 'ENT Specialist', 'ENT building');

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `id_dokter` int NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin_dokter` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_dokter` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefon_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_departmen` int NOT NULL,
  PRIMARY KEY (`id_dokter`) USING BTREE,
  INDEX `id_departmen`(`id_departmen` ASC) USING BTREE,
  CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_departmen`) REFERENCES `departmen` (`id_departmen`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES (2, 'Ayay Polynomial', 'P', 'Akihabara, Japan', '081384758358', 'doctors-1.jpg', 6);
INSERT INTO `dokter` VALUES (3, 'Iduy Flutter', 'L', 'Britannia, Holy Britannian Empire', '082917483746', 'doctors-2.jpg', 2);
INSERT INTO `dokter` VALUES (4, 'Alal Hadoop', 'L', 'Mars, Tijuana, Earth', '082389298348', 'doctors-3.jpg', 7);
INSERT INTO `dokter` VALUES (11, 'Dimas Anjaymabar', 'L', 'Depok, Indonesia', '081283234345', 'doctors-4.jpg', 1);
INSERT INTO `dokter` VALUES (16, 'sep asep', 'L', 'Bandung, Indonesia', '081282220576', 'doctors-5.jpg', 9);

-- ----------------------------
-- Table structure for jadwal_praktek
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_praktek`;
CREATE TABLE `jadwal_praktek`  (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `hari_praktek` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `id_dokter` int NOT NULL,
  `id_poliklinik` int NOT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE,
  INDEX `id_dokter`(`id_dokter` ASC) USING BTREE,
  INDEX `id_poliklinik`(`id_poliklinik` ASC) USING BTREE,
  CONSTRAINT `jadwal_praktek_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jadwal_praktek_ibfk_2` FOREIGN KEY (`id_poliklinik`) REFERENCES `poliklinik` (`id_poliklinik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_praktek
-- ----------------------------
INSERT INTO `jadwal_praktek` VALUES (1, 'Senin', '08:00:00', '15:00:00', 1, 1);
INSERT INTO `jadwal_praktek` VALUES (2, 'Jumat', '09:00:00', '17:00:00', 2, 2);
INSERT INTO `jadwal_praktek` VALUES (3, 'Sabtu', '08:00:00', '14:00:00', 3, 3);

-- ----------------------------
-- Table structure for kamar
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar`  (
  `id_kamar` int NOT NULL AUTO_INCREMENT,
  `nomor_kamar` int NOT NULL,
  `tipe_kamar` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_kamar` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kamar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kamar
-- ----------------------------
INSERT INTO `kamar` VALUES (1, 203, 'premium', 'ada');
INSERT INTO `kamar` VALUES (2, 303, 'limited', 'kosong');
INSERT INTO `kamar` VALUES (3, 204, 'premium', 'kosong');
INSERT INTO `kamar` VALUES (4, 205, 'premium', 'ada');
INSERT INTO `kamar` VALUES (5, 304, 'limited', 'ada');
INSERT INTO `kamar` VALUES (6, 305, 'limited', 'ada');

-- ----------------------------
-- Table structure for obat
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat`  (
  `id_obat` int NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` decimal(10, 2) NULL DEFAULT NULL,
  `stok` int NOT NULL,
  PRIMARY KEY (`id_obat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES (1, 'Parasetamol', 'Untuk mengatasi demam dan sakit', 20000.00, 30);
INSERT INTO `obat` VALUES (2, 'Ibuprofen', 'Untuk mengatasi rasa sakit, peradangan, dan demam', 40000.00, 20);
INSERT INTO `obat` VALUES (3, 'Omeprazol', 'Untuk meredakan sakit maag dan asam lambung', 99000.00, 45);
INSERT INTO `obat` VALUES (4, 'Amoksisilin', 'Antibiotik untuk infeksi bakteri', 119900.00, 24);
INSERT INTO `obat` VALUES (5, 'Loratadin', 'Untuk alergi dan demam hay', 599900.00, 12);
INSERT INTO `obat` VALUES (6, 'Aspirin', 'Untuk meredakan rasa sakit dan melancarkan peredaran darah', 499000.00, 24);
INSERT INTO `obat` VALUES (7, 'Simvastatin', 'Untuk menurunkan kadar kolesterol', 299900.00, 29);

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id_pasien` int NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_pasien` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lahir_pasien` date NOT NULL,
  `jenis_kelamin_pasien` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kontak_pasien` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pasien`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES (1, 'stepen', 'rumah stepen', '2024-06-27', 'L', '085634566690');
INSERT INTO `pasien` VALUES (2, 'vikir van B', 'rumah vikir', '2020-07-20', 'L', '081233221168');
INSERT INTO `pasien` VALUES (3, 'su jin wo', 'rumah sujinwo', '2009-12-25', 'L', '086574839265');
INSERT INTO `pasien` VALUES (4, 'emilia', 'rumah emilia', '2022-11-20', 'P', '086263849263');
INSERT INTO `pasien` VALUES (5, 'erika', 'rumah erika', '2019-07-30', 'P', '084352718395');
INSERT INTO `pasien` VALUES (6, 'elsa', 'rumah elsa', '2018-06-26', 'P', '085465738264');

-- ----------------------------
-- Table structure for poliklinik
-- ----------------------------
DROP TABLE IF EXISTS `poliklinik`;
CREATE TABLE `poliklinik`  (
  `id_poliklinik` int NOT NULL AUTO_INCREMENT,
  `nama_poliklinik` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_poliklinik`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poliklinik
-- ----------------------------
INSERT INTO `poliklinik` VALUES (1, 'Poliklinik Penyakit Dalam', 'nyembuhin penyakit dalam');
INSERT INTO `poliklinik` VALUES (2, 'Poliklinik Bedah Umum', 'bedah bedah tubuh manusia');
INSERT INTO `poliklinik` VALUES (3, 'Poliklinik Anak', 'ngerawat anak biar sembuh');
INSERT INTO `poliklinik` VALUES (4, 'Poliklinik THT', 'sakit telinga hidung tenggorokan disini tempatnya');
INSERT INTO `poliklinik` VALUES (5, 'Poliklinik Kandungan dan Kebidanan', 'buat bumil dan bayi disini');

-- ----------------------------
-- Table structure for rawat_inap
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap`;
CREATE TABLE `rawat_inap`  (
  `id_rawat_inap` int NOT NULL AUTO_INCREMENT,
  `tanggal_masuk` datetime NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `id_pasien` int NOT NULL,
  `id_kamar` int NOT NULL,
  PRIMARY KEY (`id_rawat_inap`) USING BTREE,
  INDEX `id_pasien`(`id_pasien` ASC) USING BTREE,
  INDEX `id_kamar`(`id_kamar` ASC) USING BTREE,
  CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rawat_inap
-- ----------------------------
INSERT INTO `rawat_inap` VALUES (1, '2023-03-11 08:30:00', '2023-03-14 14:01:00', 2, 2);
INSERT INTO `rawat_inap` VALUES (2, '2023-03-11 08:30:00', '2023-03-14 13:25:00', 1, 2);
INSERT INTO `rawat_inap` VALUES (3, '2023-03-16 09:30:00', '2023-03-17 10:25:00', 3, 1);

-- ----------------------------
-- Table structure for rekam_medis
-- ----------------------------
DROP TABLE IF EXISTS `rekam_medis`;
CREATE TABLE `rekam_medis`  (
  `id_rekam_medis` int NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `diagnosa` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_dokter` int NOT NULL,
  `id_pasien` int NOT NULL,
  PRIMARY KEY (`id_rekam_medis`) USING BTREE,
  INDEX `id_dokter`(`id_dokter` ASC) USING BTREE,
  INDEX `id_pasien`(`id_pasien` ASC) USING BTREE,
  CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rekam_medis
-- ----------------------------
INSERT INTO `rekam_medis` VALUES (1, '2023-03-11 08:00:00', 'Osteoartritis', 'Rutin untuk terapi dan jangan lupa untuk meminum obat yang di berikan', 16, 1);
INSERT INTO `rekam_medis` VALUES (2, '2023-03-11 08:20:00', 'Rinitis Akut', 'Istirahat yang cukup dan banyak minum air putih', 16, 2);
INSERT INTO `rekam_medis` VALUES (3, '2023-03-16 09:12:00', 'Hipersensitivitas Dentin', 'Jangan mengkonsumsi makanan atau minuman yang terlalu panas dan dingin atau rasa yang kuat', 2, 3);
INSERT INTO `rekam_medis` VALUES (4, '2024-03-04 00:00:00', 'Keseleo', 'Hati-hati ketika berjalan', 4, 4);

-- ----------------------------
-- Table structure for resep_obat
-- ----------------------------
DROP TABLE IF EXISTS `resep_obat`;
CREATE TABLE `resep_obat`  (
  `id_resep_obat` int NOT NULL AUTO_INCREMENT,
  `jumlah` int NOT NULL,
  `instruksi` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_rekam_medis` int NOT NULL,
  `id_obat` int NOT NULL,
  PRIMARY KEY (`id_resep_obat`) USING BTREE,
  INDEX `id_rekam_medis`(`id_rekam_medis` ASC) USING BTREE,
  INDEX `id_obat`(`id_obat` ASC) USING BTREE,
  CONSTRAINT `resep_obat_ibfk_1` FOREIGN KEY (`id_rekam_medis`) REFERENCES `rekam_medis` (`id_rekam_medis`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `resep_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resep_obat
-- ----------------------------
INSERT INTO `resep_obat` VALUES (1, 12, '3x sehari', 1, 4);
INSERT INTO `resep_obat` VALUES (2, 6, '2x sehari', 2, 1);
INSERT INTO `resep_obat` VALUES (3, 15, '3x sehari', 3, 2);
INSERT INTO `resep_obat` VALUES (4, 5, '3x sehari', 1, 7);

SET FOREIGN_KEY_CHECKS = 1;
