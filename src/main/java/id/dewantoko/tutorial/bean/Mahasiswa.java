/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package id.dewantoko.tutorial.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author A.D
 */
public class Mahasiswa {
    private int id;
    private int npm;
    private String nama;
    private String tlahir;
    private Date tgllahir;
    private String jkelamin;
    private String alamat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNpm() {
        return npm;
    }

    public void setNpm(int npm) {
        this.npm = npm;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getTlahir() {
        return tlahir;
    }

    public void setTlahir(String tlahir) {
        this.tlahir = tlahir;
    }

    public Date getTgllahir() {
        return tgllahir;
    }

    public void setTgllahir(Date tgllahir) {
        this.tgllahir = tgllahir;
    }

    public String getJkelamin() {
        return jkelamin;
    }

    public void setJkelamin(String jkelamin) {
        this.jkelamin = jkelamin;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }        
    
    public String getTempatTanggalLahir(){
        DateFormat df = new SimpleDateFormat("dd MMMMM yyyy");
        String gooddate = df.format(tgllahir);
        return tlahir + ", " + gooddate;
    }
    
}
