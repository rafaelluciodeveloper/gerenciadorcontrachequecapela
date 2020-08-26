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
import model.Funcionario;

/**
 *
 * @author Rafael
 */
public class FuncionarioDAO {

    private Conexao c;
    private Statement stmt;
    private PreparedStatement ps;
    
    public FuncionarioDAO(){
        c = new Conexao();
    }

    public List listar() {
        ResultSet rs = null;
        List lista = new ArrayList();
        try {
            String SQL = "SELECT * FROM funcionario";
            stmt = c.getConexao().createStatement();
            rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(rs.getInt("id"));
                funcionario.setMatricula(rs.getString("matricula"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setAdmissao(rs.getString("admissao"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setPis(rs.getString("pis"));
                lista.add(funcionario);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public Funcionario listaPorid(String id) {
        ResultSet rs = null;
        Funcionario funcionario = new Funcionario();

        try {
            String SQL = "SELECT * FROM funcionario WHERE id=" + id;
            stmt = c.getConexao().createStatement();
            rs = stmt.executeQuery(SQL);

            while (rs.next()) {
                funcionario.setId(rs.getInt("id"));
                funcionario.setMatricula(rs.getString("matricula"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setAdmissao(rs.getString("admissao"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setPis(rs.getString("pis"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return funcionario;
    }

    public void adicionar(Funcionario funcionario) throws SQLException {
        try {
            String SQL = "INSERT INTO funcionario(matricula,nome,admissao,cpf,pis) values (?,?,?,?,?)";
            ps = c.getConexao().prepareStatement(SQL);
            ps.setString(1, funcionario.getMatricula());
            ps.setString(2, funcionario.getNome());
            ps.setString(3, funcionario.getAdmissao());
            ps.setString(4, funcionario.getCpf());
            ps.setString(5, funcionario.getPis());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
        }
    }

    public void editar(Funcionario funcionario) throws SQLException {
        try {
            String SQL = "UPDATE funcionario SET matricula=?,nome=?,admissao=?,cpf=?,pis=? WHERE id=?";
            ps = c.getConexao().prepareStatement(SQL);
            ps.setString(1, funcionario.getMatricula());
            ps.setString(2, funcionario.getNome());
            ps.setString(3, funcionario.getAdmissao());
            ps.setString(4, funcionario.getCpf());
            ps.setString(5, funcionario.getPis());
            ps.setInt(6, funcionario.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
        }
    }

    public void excluir(String id) {
        try {
            String SQL = "DELETE FROM funcionario WHERE id=" + id;
            stmt = c.getConexao().createStatement();
            stmt.executeUpdate(SQL);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
