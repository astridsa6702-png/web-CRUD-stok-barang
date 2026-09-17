<?php
require 'function.php';
require 'cek.php';

$kode = $_GET['kode'];
$nama = mysqli_query($conn,"SELECT id_nama,namabarang FROM barang WHERE id_kode='$kode' order by namabarang");
echo "<option>Nama Barang</option>";
while($n = mysqli_fetch_array($nama)){
echo "<option value=\"".$n['id_barang']."\">".$n['namabarang']."</option>\n";
}
?>