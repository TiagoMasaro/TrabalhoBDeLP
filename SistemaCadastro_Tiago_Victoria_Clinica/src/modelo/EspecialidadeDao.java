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


public class EspecialidadeDao {
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

    

    // Método para incluir um novo cargo
    public boolean incluir(Especialidade objEspecialidade) {
        String sql = "insert into especialidade(nomeEspecialidade) values(?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objEspecialidade.getNomeEspecialidade());
           

            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Especialidade cadastrada com sucesso!");
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
            pst.setString(1, objEspecialidade.getNomeEspecialidade());
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

    public boolean salvar(Especialidade obj) {
        if (obj.getCodEspecialidade()== null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }
    
<<<<<<< HEAD
     /*public CargoFuncionario localizar(Integer id) {
=======
     public CargoFuncionario localizar(Integer id) {
>>>>>>> f7c3c539eeb85df494bbe15cf3fadd00c87b56a4
    String sql = "select * from especialidade where codEspecialidade=?";
    CargoFuncionario obj = null;
    try {
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            obj = new CargoFuncionario();
            obj.setCodCargo(rs.getInt("codEspecialidade"));
            obj.setNomeCargo(rs.getString("nomeEspecialidade"));
           
        }
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Erro de SQL ao localizar a especialidade: " + e.getMessage());
    }
    return obj;  
<<<<<<< HEAD
}*/
    
    public Especialidade localizar(Integer id){
        String sql = "select * from especialidade where codEspecialidade=?";
        Especialidade obj = new Especialidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery(); 
               while(rs.next()){
                   obj.setCodEspecialidade(rs.getInt("codEspecialidade"));
                   obj.setNomeEspecialidade(rs.getNString("nomeEspecialidade"));
                  
                   return obj;
               }
           }catch (SQLException e){
               JOptionPane.showMessageDialog(null, "Erro de SQL localizar"+e.getMessage());
           }
        return null;
    }
=======
}
>>>>>>> f7c3c539eeb85df494bbe15cf3fadd00c87b56a4

    
}
