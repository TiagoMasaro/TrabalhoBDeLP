/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class EspecialidadeDao { // Data Acess Object padrão

    public List<Especialidade> getLista() {
        String sql = "select * from especialidade";
        List<Especialidade> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Especialidade objEspecialidade = new Especialidade();
                objEspecialidade.setCodEspecialidade(rs.getInt("codEspecialidade"));         
                objEspecialidade.setNomeEspecialidade(rs.getString("nomeEspecialidade"));
                lista.add(objEspecialidade);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return lista;
    }

    public boolean incluir(Especialidade objEspecialidade) {
        String sql = "insert into Especialidade (nomeEspecialidade) values(?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objEspecialidade.getNomeEspecialidade());
          
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "A especialidade foi cadastrada com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Especialidade não cadastrada!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean alterar(Especialidade objEspecialidade) {
        String sql = "update especialidade set nomeEspecialidade=? where codEspecialidade=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1,objEspecialidade.getNomeEspecialidade());
            pst.setInt(2, objEspecialidade.getCodEspecialidade());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Especialidade alterada com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Especialidade não alterada!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean remover(Especialidade objEspecialidade) {
        String sql = "delete from especialidade where codEspecialidade=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objEspecialidade.getCodEspecialidade());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Especialidade excluída com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Especialidade não excluída!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean salvar(Especialidade objEspecialidade) {
        if (objEspecialidade.getCodEspecialidade() == null) {
            return incluir(objEspecialidade);
        } else {
            return alterar(objEspecialidade);
        }

    }
    
     public Especialidade localizar(Integer idEspecialidade){
        String sql = "select * from especialidade where codEspecialidade=?";
        Especialidade objEspecialidade = new Especialidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, idEspecialidade);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objEspecialidade.setCodEspecialidade(rs.getInt("codEspecialidade"));         
                objEspecialidade.setNomeEspecialidade(rs.getString("nomeEspecialidade"));
                return objEspecialidade;
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog
        (null,"Erro de SQL Localizar"+e.getMessage());
    }
        return null;
    }

}
