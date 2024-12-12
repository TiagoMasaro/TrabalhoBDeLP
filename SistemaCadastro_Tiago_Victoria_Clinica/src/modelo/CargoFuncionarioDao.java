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

public class CargoFuncionarioDao {
     public List<CargoFuncionario> getLista() {
        String sql = "select * from cargofuncionario";
        List<CargoFuncionario> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                CargoFuncionario objCargoFuncionario = new CargoFuncionario();
                objCargoFuncionario.setCodCargo(rs.getInt("codCargo"));
                objCargoFuncionario.setNomeCargo(rs.getString("nomeCargo"));
                
                lista.add(objCargoFuncionario);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return lista;
    }

    

    // Método para incluir um novo cargo
    public boolean incluir(CargoFuncionario objCargoFuncionario) {
        String sql = "insert into cargofuncionario(nomeCargo) values(?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCargoFuncionario.getNomeCargo());
           

            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não cadastrado!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }
    
   
    public boolean alterar(CargoFuncionario objCargoFuncionario) {
        String sql = "update cargofuncionario set nomeCargo=? where codCargo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCargoFuncionario.getNomeCargo());
            pst.setInt(2, objCargoFuncionario.getCodCargo());
            
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo alterado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não alterado!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean remover(CargoFuncionario objCargoFuncionario) {
        String sql = "delete from cargofuncionario where codCargo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objCargoFuncionario.getCodCargo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo excluído com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não excluído!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean salvar(CargoFuncionario obj) {
        if (obj.getCodCargo() == null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }
    
     public CargoFuncionario localizar(Integer id) {
    String sql = "select * from cargofuncionario where codCargo=?";
    CargoFuncionario obj = null;
    try {
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            obj = new CargoFuncionario();
            obj.setCodCargo(rs.getInt("codCargo"));
            obj.setNomeCargo(rs.getString("nomeCargo"));
           
        }
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Erro de SQL ao localizar o cargo: " + e.getMessage());
    }
    return obj;  
}

    
}
