<?php
session_start();

//membuat koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "Stokgudang");

//menambah barang baru
if(isset($_POST['addnewbarang'])){
    
    $namabarang = $_POST['namabarang'];
    $stok = $_POST['stok'];

    $addtotable = mysqli_query($conn, "insert into stok ( namabarang, stok) values( '$namabarang', '$stok')");
    if($addtotable){
        header('location:index.php');
    } else {
        echo 'Gagal';
        header('location:index.php');
    }
};


//menambah barang masuk
if(isset($_POST['barangmasuk'])){
    $barangnya = $_POST['barangnya'];
    
    $keterangan = $_POST['keterangan'];
    $petugas = $_POST['petugas'];
    $qty = $_POST['qty'];

    $cekstoksekarang = mysqli_query($conn, "select * from stok where idbarang='$barangnya'");
    $ambildatanya = mysqli_fetch_array($cekstoksekarang);

    $stoksekarang = $ambildatanya['stok'];
    $tambahkanstoksekarangdenganqty = $stoksekarang+$qty;

    $addtomasuk = mysqli_query($conn, "insert into masuk (idbarang, petugas,keterangan, qty) values('$barangnya', '$petugas', '$keterangan', '$qty')");   
    $updatestokmasuk = mysqli_query($conn, "update stok set stok= '$tambahkanstoksekarangdenganqty' where idbarang='$barangnya'");
    
    if($addtomasuk&&$updatestokmasuk){
        header('location:masuk.php');
    } else {
        echo 'Gagal';
        header('location:masuk.php');
    }
}



//menambah barang keluar
if(isset($_POST['barangkeluar'])){
    $barangnya = $_POST['barangnya'];
    
    $penerima = $_POST['penerima'];
    $petugas = $_POST['petugas'];
    $qty = $_POST['qty'];

    $cekstoksekarang = mysqli_query($conn, "select * from stok where idbarang='$barangnya'");
    $ambildatanya = mysqli_fetch_array($cekstoksekarang);

    $stoksekarang = $ambildatanya['stok'];

    // --- TAMBAHAN VALIDASI: CEK JIKA BARANG YANG DIKELUARKAN LEBIH BESAR DARI STOK ---
    if($qty > $stoksekarang){
        echo '
        <script>
            alert("Gagal! Stok barang tidak mencukupi untuk dikeluarkan. Stok saat ini: '.$stoksekarang.'");
            window.location.href="keluar.php";
        </script>
        ';
    } else {
        // JIKA STOK CUKUP, BARU PROSES DIJALANKAN
        $tambahkanstoksekarangdenganqty = $stoksekarang-$qty;

        $addtokeluar = mysqli_query($conn, "insert into keluar (idbarang, petugas, penerima, qty) values('$barangnya', '$petugas', '$penerima', '$qty')");   
        $updatestokmasuk = mysqli_query($conn, "update stok set stok= '$tambahkanstoksekarangdenganqty' where idbarang='$barangnya'");
        
        if($addtokeluar&&$updatestokmasuk){
            header('location:keluar.php');
        } else {
            echo 'Gagal';
            header('location:keluar.php');
        }
    }
}


//update barang
if(isset($_POST['updatebarang'])){
    $idb = $_POST['idb'];
    $namabarang = $_POST['namabarang'];
    
    $qty = $_POST['qty'];

    $update = mysqli_query($conn, "update stok set namabarang='$namabarang', stok='$qty' where idbarang='$idb'");
    if($update){
        header('location:index.php');
    } else {
        echo 'Gagal';
        header('location:index.php');
    }
};

//hapus barang
if(isset($_POST['hapusbarang'])){
    $idb = $_POST['idb'];

    $hapus = mysqli_query($conn, "delete from stok where idbarang='$idb'");
    if($hapus){
        header('location:index.php');
    } else {
        echo 'Gagal';
        header('location:index.php');
    }
}


//update barang masuk
if(isset($_POST['updatebarangmasuk'])){
    $idb = $_POST['idb'];
    $idm = $_POST['idm'];
    $petugas = $_POST['petugas'];
    $keterangan = $_POST['keterangan'];
    $qty = $_POST['qty'];

    $lihatstok = mysqli_query($conn, "select * from stok where idbarang ='$idb'");
    $stoknya = mysqli_fetch_array($lihatstok);
    $stokskrg = $stoknya['stok'];

    $qtyskrg = mysqli_query($conn, "select * from masuk where idmasuk='$idm'");
    $qtynya =  mysqli_fetch_array($qtyskrg);
    $qtyskrg = $qtynya['qty'];

    if($qty>$qtyskrg){
        $selisih = $qty-$qtyskrg;
        $kurangi = $stokskrg + $selisih;
        $kurangistoknya = mysqli_query($conn, "update stok set stok='$kurangi' where idbarang='$idb'");
        $updatenya = mysqli_query($conn, "update masuk set qty='$qty', petugas='$petugas', keterangan='$keterangan' where idmasuk='$idm'");
            if($kurangistoknya&&$updatenya){
                header('location:masuk.php');
            } else {
                echo 'Gagal';
                header('location:masuk.php');
            }
    } else {
        $selisih = $qtyskrg-$qty;
        $kurangi = $stokskrg - $selisih;
        $kurangistoknya = mysqli_query($conn, "update stok set stok='$kurangi' where idbarang='$idb'");
        $updatenya = mysqli_query($conn, "update masuk set qty='$qty', petugas='$petugas', keterangan='$keterangan' where idmasuk='$idm'");
            if($kurangistoknya&&$updatenya){
                header('location:masuk.php');
            } else {
                echo 'Gagal';
                header('location:masuk.php');
            }
    }
}



//hapus barang masuk
if(isset($_POST['hapusbarangmasuk'])){
    $idb = $_POST['idb'];
    $qty = $_POST['kty'];
    $idm = $_POST['idm'];

    $getdatastok = mysqli_query($conn, "select * from stok where idbarang='$idb'");
    $data = mysqli_fetch_array($getdatastok);
    $stock = $data['stok'];

    $selisih = $stock-$qty;

    $update = mysqli_query($conn, "update stok set stok='$selisih' where idbarang='$idb'");
    $hapusdata = mysqli_query($conn, "delete from masuk where idmasuk='$idm'");

    if($update&&$hapusdata){
        header('location:masuk.php');
    } else {
        header('location:masuk.php');
    }
}


//update barang keluar
if(isset($_POST['updatebarangkeluar'])){
    $idb = $_POST['idb'];
    $idk = $_POST['idk'];
    $penerima = $_POST['penerima'];
    $petugas = $_POST['petugas'];
    $qty = $_POST['qty'];

    $lihatstok = mysqli_query($conn, "select * from stok where idbarang ='$idb'");
    $stoknya = mysqli_fetch_array($lihatstok);
    $stokskrg = $stoknya['stok'];

    $qtyskrg = mysqli_query($conn, "select * from keluar where idkeluar='$idk'");
    $qtynya =  mysqli_fetch_array($qtyskrg);
    $qtyskrg = $qtynya['qty'];

    if($qty>$qtyskrg){
        $selisih = $qty-$qtyskrg;
        $kurangi = $stokskrg - $selisih;
        $kurangistoknya = mysqli_query($conn, "update stok set stok='$kurangi' where idbarang='$idb'");
        $updatenya = mysqli_query($conn, "update keluar set qty='$qty', petugas='$petugas' where idkeluar='$idk'");
            if($kurangistoknya&&$updatenya){
                header('location:keluar.php');
            } else {
                echo 'Gagal';
                header('location:keluar.php');
            }
    } else {
        $selisih = $qtyskrg-$qty;
        $kurangi = $stokskrg + $selisih;
        $kurangistoknya = mysqli_query($conn, "update stok set stok='$kurangi' where idbarang='$idb'");
        $updatenya = mysqli_query($conn, "update keluar set qty='$qty', petugas='$petugas', penerima='$penerima' where idkeluar='$idk'");
            if($kurangistoknya&&$updatenya){
                header('location:keluar.php');
            } else {
                echo 'Gagal';
                header('location:keluar.php');
            }
    }
}



//hapus barang keluar
if(isset($_POST['hapusbarangkeluar'])){
    $idb = $_POST['idb'];
    $qty = $_POST['kty'];
    $idk = $_POST['idk'];

    $getdatastok = mysqli_query($conn, "select * from stok where idbarang='$idb'");
    $data = mysqli_fetch_array($getdatastok);
    $stock = $data['stok'];

    $selisih = $stock+$qty;

    $update = mysqli_query($conn, "update stok set stok='$selisih' where idbarang='$idb'");
    $hapusdata = mysqli_query($conn, "delete from keluar where idkeluar='$idk'");

    if($update&&$hapusdata){
        header('location:keluar.php');
    } else {
        header('location:keluar.php');
    }
}



//tambah admin
if(isset($_POST['addadmin'])){
    $email = $_POST['email'];
    $password = $_POST['password'];

    $queryinsert = mysqli_query($conn, "insert into login (email, password) values ('$email', '$password')");

    if($queryinsert){
        header('location:admin.php');
    } else {
        header('location:admin.php');
    }
}


//edit admin
if(isset($_POST['updateadmin'])){
    $emailbaru = $_POST['emailadmin'];
    $passwordbaru = $_POST['passwordbaru'];
    $idnya = $_POST['id'];

    $queryupdate = mysqli_query($conn, "update login set email='$emailbaru', password='$passwordbaru' where iduser='$idnya'");

    if($queryupdate){
        header('location:admin.php');
    } else {
        header('location:admin.php');
    }
}



//hapus admin
if(isset($_POST['hapusadmin'])){
    $id = $_POST['id'];

    $querydelete = mysqli_query($conn, "delete from login where iduser='$id'");
    if($querydelete){
        header('location:admin.php');
    } else {
        header('location:admin.php');
    }
}
?>