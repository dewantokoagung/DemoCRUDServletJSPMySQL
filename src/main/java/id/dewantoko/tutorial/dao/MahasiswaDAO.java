/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.dewantoko.tutorial.dao;

import id.dewantoko.tutorial.bean.Mahasiswa;
import id.dewantoko.tutorial.jdbc.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author A.D
 */
public class MahasiswaDAO {

    private final Connection conn;

    public MahasiswaDAO() {
        conn = ConnectionDB.getConnection();
    }

    public void simpanMahasiswa(Mahasiswa mhs) {
        try {
            String sql = "INSERT INTO mahasiswa(npm, nama, tlahir, tgllahir, jkelamin, alamat) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, mhs.getNpm());
            ps.setString(2, mhs.getNama());
            ps.setString(3, mhs.getTlahir());
            ps.setDate(4, new java.sql.Date(mhs.getTgllahir().getTime()));
            ps.setString(5, mhs.getJkelamin());
            ps.setString(6, mhs.getAlamat());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Mahasiswa cariMahasiswa(int id, int npm) {
        Mahasiswa mhs = new Mahasiswa();
        try {
            String sql = "SELECT * FROM mahasiswa WHERE id=? and npm=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, npm);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                mhs.setId(rs.getInt("id"));
                mhs.setNpm(rs.getInt("npm"));
                mhs.setNama(rs.getString("nama"));
                mhs.setTlahir(rs.getString("tlahir"));
                mhs.setTgllahir(rs.getDate("tgllahir"));
                mhs.setJkelamin(rs.getString("jkelamin"));
                mhs.setAlamat(rs.getString("alamat"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return mhs;
    }

    public void updateMahasiswa(Mahasiswa mhs) {
        try {
            String sql = "UPDATE mahasiswa set nama=?, tlahir=?, tgllahir=?, jkelamin=?, alamat=? where id=? and npm=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, mhs.getNama());
            ps.setString(2, mhs.getTlahir());
            ps.setDate(3, new java.sql.Date(mhs.getTgllahir().getTime()));
            ps.setString(4, mhs.getJkelamin());
            ps.setString(5, mhs.getAlamat());
            ps.setInt(6, mhs.getId());
            ps.setInt(7, mhs.getNpm());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void hapusMahasiswa(int id, int npm) {
        try {
            String sql = "DELETE FROM mahasiswa where id=? and npm=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ps.setInt(2, npm);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List listMahasiswa() {
        List result = new ArrayList();
        try {
            String sql = "SELECT * FROM mahasiswa";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Mahasiswa mhs = new Mahasiswa();
                mhs.setId(rs.getInt("id"));
                mhs.setNpm(rs.getInt("npm"));
                mhs.setNama(rs.getString("nama"));
                mhs.setTlahir(rs.getString("tlahir"));
                mhs.setTgllahir(rs.getDate("tgllahir"));
                mhs.setJkelamin(rs.getString("jkelamin"));
                mhs.setAlamat(rs.getString("alamat"));
                result.add(mhs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;
    }

}
