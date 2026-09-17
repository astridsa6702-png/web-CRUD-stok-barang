<?php
require 'function.php';
require 'cek.php';

// Ambil data yang dikirim dari form
$kodebarang = $_POST['kodebarang'];
$namabarang = $_POST['namabarang'];
$qty = $_POST['qty']; 



$index = 0; // Set index array awal dengan 0
foreach($kodebarang as $datakode){ // Kita buat perulangan berdasarkan nis sampai data terakhir
	$query .= "('".$datakode."','".$namabarang[$index]."','".$qty[$index]."'),";
	$index++;
}

// Kita hilangkan tanda koma di akhir query
// sehingga kalau di echo $query nya akan sepert ini : (contoh ada 2 data siswa)
// INSERT INTO siswa VALUES('1011001','Rizaldi','Laki-laki','089288277372','Bandung'),('1011002','Siska','Perempuan','085266255121','Jakarta');
$query = substr($query, 0, strlen($query) - 1).";";

// Eksekusi $query
$query = mysqli_query($conn, "insert into masuk (kodebarang, namabarang, qty) values('$kodebarang', '$namabarang', '$qty')");

// Buat sebuah alert sukses, dan redirect ke halaman awal (index.php)
echo "<script>alert('Data berhasil disimpan');window.location = 'masuk.php';</script>";
?>

