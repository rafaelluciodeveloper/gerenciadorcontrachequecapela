/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import conf.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Empresa;

/**
 *
 * @author Rafael
 */
public class EmpresaDAO {

    private Conexao c;
    private Statement stmt;
    private PreparedStatement ps;

    public EmpresaDAO() {
        c = new Conexao();
    }

    public List listar() {
        ResultSet rs = null;
        List lista = new ArrayList();
        try {
            String SQL = "select * from empresa";
            stmt = c.getConexao().createStatement();
            rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                Empresa e = new Empresa();
                e.setId(rs.getInt("id"));
                e.setCod_empresa(rs.getInt("cod_empresa"));
                e.setCnpj(rs.getString("cnpj"));
                e.setRazaosocial(rs.getString("razaosocial"));
                e.setEndereco(rs.getString("endereco"));
                lista.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public Empresa listarPorId(String id) {
        ResultSet rs = null;
        Empresa empresa = new Empresa();
        try {
            String SQL = "select * from empresa where id=" + id;
            stmt = c.getConexao().createStatement();
            rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                empresa.setId(rs.getInt("id"));
                empresa.setCod_empresa(rs.getInt("cod_empresa"));
                empresa.setCnpj(rs.getString("cnpj"));
                empresa.setRazaosocial(rs.getString("razaosocial"));
                empresa.setEndereco(rs.getString("endereco"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return empresa;
    }

    public void adicionar(Empresa empresa) throws SQLException {
        try {
            String SQL = "insert into empresa (cod_empresa,cnpj,razaosocial,endereco) values (?,?,?,?)";
            ps = c.getConexao().prepareCall(SQL);
            ps.setInt(1, empresa.getCod_empresa());
            ps.setString(2, empresa.getCnpj());
            ps.setString(3, empresa.getRazaosocial());
            ps.setString(4, empresa.getEndereco());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
        }
    }

    public void editar(Empresa empresa) throws SQLException {
        try {
            String SQL = "UPDATE empresa SET cod_empresa=?,cnpj=?,razaosocial=?,endereco=? where id=?";
            ps = c.getConexao().prepareStatement(SQL);
            ps.setInt(1, empresa.getCod_empresa());
            ps.setString(2, empresa.getCnpj());
            ps.setString(3, empresa.getRazaosocial());
            ps.setString(4, empresa.getEndereco());
            ps.setInt(5, empresa.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
        }
    }

    public void excluir(String id) {
        try {
            String SQL = "DELETE from empresa where id=" + id;
            stmt = c.getConexao().createStatement();
            stmt.executeUpdate(SQL);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
